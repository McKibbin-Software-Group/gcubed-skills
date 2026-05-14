#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"
CODEX_GLOBAL_AGENTS="${CODEX_GLOBAL_AGENTS:-$HOME/.codex/AGENTS.md}"

SKILL_NAME="project-memory"
SOURCE_SKILL="$REPO_ROOT/skills/$SKILL_NAME"
DEST_SKILL="$CODEX_SKILLS_DIR/$SKILL_NAME"
SECTION_FILE="$REPO_ROOT/global/project-memory-section.md"
GLOBAL_EXAMPLE="$REPO_ROOT/global/AGENTS.md.example"

timestamp() {
  date +"%Y%m%d-%H%M%S"
}

require_file() {
  if [ ! -e "$1" ]; then
    printf 'Missing required file: %s\n' "$1" >&2
    exit 1
  fi
}

install_skill() {
  require_file "$SOURCE_SKILL/SKILL.md"

  mkdir -p "$CODEX_SKILLS_DIR"

  local tmp_dest
  tmp_dest="$(mktemp -d)"
  cp -R "$SOURCE_SKILL" "$tmp_dest/$SKILL_NAME"

  if [ -e "$DEST_SKILL" ]; then
    local backup
    backup="$DEST_SKILL.backup.$(timestamp)"
    mv "$DEST_SKILL" "$backup"
    printf 'Backed up existing skill to %s\n' "$backup"
  fi

  mv "$tmp_dest/$SKILL_NAME" "$DEST_SKILL"
  rmdir "$tmp_dest"
  printf 'Installed %s to %s\n' "$SKILL_NAME" "$DEST_SKILL"
}

write_global_merge_packet() {
  require_file "$SECTION_FILE"
  require_file "$GLOBAL_EXAMPLE"

  local packet_template="${TMPDIR:-/tmp}/codex-agent-tooling-agents-merge.XXXXXX.md"
  local packet
  packet="$(mktemp "$packet_template")"

  cat > "$packet" <<EOF
# Codex Global AGENTS.md Merge Packet

Generated: $(date -Iseconds)
Repository: $REPO_ROOT

## Files

- Existing global AGENTS.md: \`$CODEX_GLOBAL_AGENTS\`
- Recommended example: \`$GLOBAL_EXAMPLE\`
- Project-memory managed block: \`$SECTION_FILE\`

## Objective

Propose a sane merge of the recommended global instructions into the existing global AGENTS.md.

## Instructions For Codex

Do not apply changes immediately.

Read the files listed above, then prepare a proposed merged AGENTS.md that:

- preserves the user's existing intent and personal operating preferences
- incorporates useful guidance from the recommended example
- keeps the project-memory managed block between its BEGIN/END markers
- uses \`$SECTION_FILE\` as the source of truth for the project-memory managed block
- removes duplicate guidance
- avoids contradictory or over-broad instructions
- keeps the final file concise enough to remain useful as global agent guidance
- leaves unrelated local instructions alone unless they conflict with the merged result

Before applying anything, show the user:

1. a short summary of semantic changes
2. a unified diff from the existing global AGENTS.md to the proposed version
3. any conflicts, judgment calls, or questions

Only write the merged file after the user explicitly approves the proposed result. If the sandbox requires permission to edit the global file, request that permission only after approval.

When applying the approved merge:

- back up the current global AGENTS.md first
- write the approved merged content to \`$CODEX_GLOBAL_AGENTS\`
- tell the user to restart Codex so the global instruction changes are picked up

## Prompt To Give Codex

Please use this merge packet to propose a sane merge for my global AGENTS.md. Show me the summary and unified diff before applying anything, and only write the file after I approve the proposal.
EOF

  printf 'Global AGENTS.md already exists, so I left it unchanged.\n'
  printf 'A Codex merge packet was written to: %s\n' "$packet"
  printf '\nTo finish the global AGENTS.md merge safely, ask Codex:\n\n'
  printf '  Please use %s to propose a sane merge for my global AGENTS.md. Show me the summary and unified diff before applying anything.\n' "$packet"
}

prepare_global_agents() {
  mkdir -p "$(dirname "$CODEX_GLOBAL_AGENTS")"
  require_file "$GLOBAL_EXAMPLE"

  if [ ! -e "$CODEX_GLOBAL_AGENTS" ]; then
    cp "$GLOBAL_EXAMPLE" "$CODEX_GLOBAL_AGENTS"
    printf 'Created %s from global/AGENTS.md.example\n' "$CODEX_GLOBAL_AGENTS"
    return
  fi

  write_global_merge_packet
}

install_skill
prepare_global_agents

printf '\nDone. Restart Codex to pick up skill changes.\n'
