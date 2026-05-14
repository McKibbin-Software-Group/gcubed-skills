#!/usr/bin/env bash
set -euo pipefail

TOOLING_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SKILL_NAME="project-memory"
SOURCE_SKILL="$TOOLING_ROOT/skills/$SKILL_NAME"
GLOBAL_EXAMPLE="$TOOLING_ROOT/global/AGENTS.md.example"
SECTION_FILE="$TOOLING_ROOT/global/project-memory-section.md"
PROJECT_TEMPLATE="$TOOLING_ROOT/skills/$SKILL_NAME/assets/templates/AGENTS.md"

timestamp() {
  date +"%Y%m%d-%H%M%S"
}

require_file() {
  if [ ! -e "$1" ]; then
    printf 'Missing required file: %s\n' "$1" >&2
    exit 1
  fi
}

find_project_root() {
  if [ "${PROJECT_ROOT:-}" ]; then
    if [ ! -d "$PROJECT_ROOT" ]; then
      printf 'PROJECT_ROOT is not a directory: %s\n' "$PROJECT_ROOT" >&2
      exit 1
    fi

    local configured_root
    if configured_root="$(git -C "$PROJECT_ROOT" rev-parse --show-toplevel 2>/dev/null)"; then
      printf '%s\n' "$configured_root"
      return
    fi

    printf 'PROJECT_ROOT is not inside a Git repository: %s\n' "$PROJECT_ROOT" >&2
    exit 1
  fi

  local root
  if root="$(git -C "$PWD" rev-parse --show-toplevel 2>/dev/null)"; then
    printf '%s\n' "$root"
    return
  fi

  local workspace_root
  if [ "${GITHUB_WORKSPACE:-}" ] && workspace_root="$(git -C "$GITHUB_WORKSPACE" rev-parse --show-toplevel 2>/dev/null)"; then
    printf '%s\n' "$workspace_root"
    return
  fi

  printf 'Could not find a Git repository root from %s\n' "$PWD" >&2
  printf 'Run from inside the target project, or set PROJECT_ROOT=/path/to/project.\n' >&2
  exit 1
}

PROJECT_ROOT="$(find_project_root)"
PROJECT_SKILLS_DIR="$PROJECT_ROOT/.agents/skills"
DEST_SKILL="$PROJECT_SKILLS_DIR/$SKILL_NAME"
PROJECT_AGENTS="$PROJECT_ROOT/AGENTS.md"
PACKET_DIR="$PROJECT_ROOT/.codex-agent-tooling"
PACKET_FILE="$PACKET_DIR/project-agents-merge.md"

install_project_skill() {
  require_file "$SOURCE_SKILL/SKILL.md"

  mkdir -p "$PROJECT_SKILLS_DIR"

  local tmp_dest
  tmp_dest="$(mktemp -d)"
  cp -R "$SOURCE_SKILL" "$tmp_dest/$SKILL_NAME"

  if [ -e "$DEST_SKILL" ]; then
    local backup
    backup="$DEST_SKILL.backup.$(timestamp).$$"
    mv "$DEST_SKILL" "$backup"
    printf 'Backed up existing project skill to %s\n' "$backup"
  fi

  mv "$tmp_dest/$SKILL_NAME" "$DEST_SKILL"
  rmdir "$tmp_dest"
  printf 'Installed %s to %s\n' "$SKILL_NAME" "$DEST_SKILL"
}

write_project_merge_packet() {
  require_file "$GLOBAL_EXAMPLE"
  require_file "$SECTION_FILE"
  require_file "$PROJECT_TEMPLATE"

  mkdir -p "$PACKET_DIR"

  local project_agents_status="present"
  if [ ! -e "$PROJECT_AGENTS" ]; then
    project_agents_status="missing; create only after approval"
  fi

  cat > "$PACKET_FILE" <<EOF
# Codex Project AGENTS.md Merge Packet

Generated: $(date -Iseconds)
Tooling repository: $TOOLING_ROOT
Target project: $PROJECT_ROOT

## Files

- Project AGENTS.md path: \`$PROJECT_AGENTS\`
- Project AGENTS.md status: $project_agents_status
- Recommended global methodology example: \`$GLOBAL_EXAMPLE\`
- Project AGENTS.md starter template: \`$PROJECT_TEMPLATE\`
- Project-memory managed block: \`$SECTION_FILE\`
- Installed project skill: \`$DEST_SKILL\`

## Objective

Propose a sane project-level AGENTS.md for this repository.

The goal is to make the project self-contained in ephemeral devcontainers or Codespaces: Codex should be able to discover the project instructions from \`$PROJECT_AGENTS\` and the project skill from \`$DEST_SKILL\` after a container rebuild.

## Instructions For Codex

Do not apply changes immediately.

Read the files listed above. If \`$PROJECT_AGENTS\` exists, preserve its existing intent and treat repo-specific guidance as authoritative. If it does not exist, propose a new project AGENTS.md.

Prepare a proposed project AGENTS.md that:

- is project-facing rather than personal-global where possible
- inspects the project worktree state and relevant existing docs before proposing changes
- may incorporate broadly useful methodology from \`$GLOBAL_EXAMPLE\`, including the \`# METHODOLOGY\` section
- removes or rewrites any global-only wording that would be confusing inside a repository
- incorporates the useful project structure from \`$PROJECT_TEMPLATE\`
- keeps the project-memory methodology between its BEGIN/END markers when included
- uses \`$SECTION_FILE\` as the source of truth for the project-memory managed block
- flags malformed or duplicated project-memory markers as a judgment call instead of guessing silently
- preserves useful existing project instructions, commands, safety constraints, and documentation pointers
- removes duplicate guidance
- avoids contradictory or over-broad instructions
- keeps the final file concise enough to remain useful as repo-local agent guidance

Before applying anything, show the user:

1. a short summary of semantic changes
2. a unified diff from the existing project AGENTS.md to the proposed version, or the full proposed file if AGENTS.md does not exist yet
3. any conflicts, judgment calls, or questions

Only write the merged file after the user explicitly approves the proposed result.

When applying the approved merge:

- back up the current project AGENTS.md first if it exists
- write the approved merged content to \`$PROJECT_AGENTS\`
- tell the user that Codex may need to restart or reload the workspace to pick up new project skills and instructions

## Prompt To Give Codex

Please use this merge packet to propose a sane project AGENTS.md for this repository. Show me the summary and unified diff before applying anything, and only write the file after I approve the proposal.
EOF

  printf 'Project AGENTS.md was left unchanged.\n'
  printf 'A Codex project merge packet was written to: %s\n' "$PACKET_FILE"
  printf '\nTo finish the project AGENTS.md merge safely, ask Codex:\n\n'
  printf '  Please use %s to propose a sane project AGENTS.md for this repository. Show me the summary and unified diff before applying anything.\n' "$PACKET_FILE"
}

install_project_skill
write_project_merge_packet

printf '\nDone. Restart Codex or reload the workspace to pick up project skill changes.\n'
