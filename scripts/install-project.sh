#!/usr/bin/env bash
set -euo pipefail

TOOLING_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SKILL_NAMES=("project-memory" "setup-agents-md" "ashie-agents-methodology")
SETUP_SKILL="$TOOLING_ROOT/skills/setup-agents-md"
SKILL_HOOKS_TEMPLATE="$SETUP_SKILL/assets/templates/skill-hooks-section.md"
WIRING_PACKET_TEMPLATE="$SETUP_SKILL/assets/merge-packets/agents-md-wiring.md"

timestamp() {
  date +"%Y%m%d-%H%M%S"
}

require_file() {
  if [ ! -e "$1" ]; then
    printf 'Missing required file: %s\n' "$1" >&2
    exit 1
  fi
}

render_template() {
  local template="$1"
  local output="$2"
  shift 2

  python3 - "$template" "$output" "$@" <<'PY'
from pathlib import Path
import sys

template = Path(sys.argv[1])
output = Path(sys.argv[2])
values = {}

for arg in sys.argv[3:]:
    key, value = arg.split("=", 1)
    if key.endswith("_FILE"):
        values[key[:-5]] = Path(value).read_text().rstrip()
    else:
        values[key] = value

text = template.read_text()
for key, value in values.items():
    text = text.replace("{{" + key + "}}", value)

output.write_text(text)
PY
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
PROJECT_AGENTS="$PROJECT_ROOT/AGENTS.md"
PACKET_DIR="$PROJECT_ROOT/.codex-agent-tooling"
PACKET_FILE="$PACKET_DIR/agents-md-wiring.md"

install_project_skill() {
  local skill_name="$1"
  local source_skill="$TOOLING_ROOT/skills/$skill_name"
  local dest_skill="$PROJECT_SKILLS_DIR/$skill_name"

  require_file "$source_skill/SKILL.md"
  mkdir -p "$PROJECT_SKILLS_DIR"

  local tmp_dest
  tmp_dest="$(mktemp -d)"
  cp -R "$source_skill" "$tmp_dest/$skill_name"

  if [ -e "$dest_skill" ]; then
    local backup
    backup="$dest_skill.backup.$(timestamp).$$"
    mv "$dest_skill" "$backup"
    printf 'Backed up existing project skill to %s\n' "$backup"
  fi

  mv "$tmp_dest/$skill_name" "$dest_skill"
  rmdir "$tmp_dest"
  printf 'Installed %s to %s\n' "$skill_name" "$dest_skill"
}

write_project_wiring_packet() {
  require_file "$WIRING_PACKET_TEMPLATE"
  require_file "$SKILL_HOOKS_TEMPLATE"

  mkdir -p "$PACKET_DIR"

  local project_agents_status="present"
  if [ ! -e "$PROJECT_AGENTS" ]; then
    project_agents_status="missing; create only after approval"
  fi

  render_template "$WIRING_PACKET_TEMPLATE" "$PACKET_FILE" \
    "GENERATED_AT=$(date -Iseconds)" \
    "TARGET_SCOPE=project" \
    "TARGET_AGENTS=$PROJECT_AGENTS" \
    "TARGET_STATUS=$project_agents_status" \
    "DEST_SKILL_PARENT=$PROJECT_SKILLS_DIR" \
    "SKILL_HOOKS_SECTION_FILE=$SKILL_HOOKS_TEMPLATE"

  printf 'Project AGENTS.md was left unchanged.\n'
  printf 'A Codex project skill-wiring packet was written to: %s\n' "$PACKET_FILE"
  printf '\nTo finish the project AGENTS.md merge safely, ask Codex:\n\n'
  printf "  Please use %s with \$setup-agents-md to add or refresh project skill hooks. Show me the summary and unified diff before applying anything.\n" "$PACKET_FILE"
}

for skill_name in "${SKILL_NAMES[@]}"; do
  install_project_skill "$skill_name"
done

write_project_wiring_packet

printf '\nDone. Restart Codex or reload the workspace to pick up project skill changes.\n'
