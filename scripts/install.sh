#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"
CODEX_GLOBAL_AGENTS="${CODEX_GLOBAL_AGENTS:-$HOME/.codex/AGENTS.md}"

SKILL_NAMES=("project-memory" "setup-agents-md" "ashie-agents-methodology")
SETUP_SKILL="$REPO_ROOT/skills/setup-agents-md"
SKILL_HOOKS_TEMPLATE="$SETUP_SKILL/assets/templates/skill-hooks-section.md"
MINIMAL_AGENTS_TEMPLATE="$SETUP_SKILL/assets/templates/minimal-agents.md"
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

install_skill() {
  local skill_name="$1"
  local source_skill="$REPO_ROOT/skills/$skill_name"
  local dest_skill="$CODEX_SKILLS_DIR/$skill_name"

  require_file "$source_skill/SKILL.md"
  mkdir -p "$CODEX_SKILLS_DIR"

  local tmp_dest
  tmp_dest="$(mktemp -d)"
  cp -R "$source_skill" "$tmp_dest/$skill_name"

  if [ -e "$dest_skill" ]; then
    local backup
    backup="$dest_skill.backup.$(timestamp).$$"
    mv "$dest_skill" "$backup"
    printf 'Backed up existing skill to %s\n' "$backup"
  fi

  mv "$tmp_dest/$skill_name" "$dest_skill"
  rmdir "$tmp_dest"
  printf 'Installed %s to %s\n' "$skill_name" "$dest_skill"
}

write_global_merge_packet() {
  require_file "$WIRING_PACKET_TEMPLATE"
  require_file "$SKILL_HOOKS_TEMPLATE"

  local packet_dir="$HOME/.codex/merge-packets"
  mkdir -p "$packet_dir"

  local packet
  packet="$packet_dir/agents-md-wiring-$(timestamp).md"
  local global_agents_status="present"
  if [ ! -e "$CODEX_GLOBAL_AGENTS" ]; then
    global_agents_status="missing; create only after approval"
  fi

  render_template "$WIRING_PACKET_TEMPLATE" "$packet" \
    "GENERATED_AT=$(date -Iseconds)" \
    "TARGET_SCOPE=global" \
    "TARGET_AGENTS=$CODEX_GLOBAL_AGENTS" \
    "TARGET_STATUS=$global_agents_status" \
    "DEST_SKILL_PARENT=$CODEX_SKILLS_DIR" \
    "SKILL_HOOKS_SECTION_FILE=$SKILL_HOOKS_TEMPLATE"

  printf 'Global AGENTS.md already exists, so I left it unchanged.\n'
  printf 'A Codex skill-wiring packet was written to: %s\n' "$packet"
  printf '\nTo finish the global AGENTS.md merge safely, ask Codex:\n\n'
  printf "  Please use %s with \$setup-agents-md to add or refresh my global skill hooks. Show me the summary and unified diff before applying anything.\n" "$packet"
}

prepare_global_agents() {
  mkdir -p "$(dirname "$CODEX_GLOBAL_AGENTS")"
  require_file "$MINIMAL_AGENTS_TEMPLATE"
  require_file "$SKILL_HOOKS_TEMPLATE"

  if [ ! -e "$CODEX_GLOBAL_AGENTS" ]; then
    render_template "$MINIMAL_AGENTS_TEMPLATE" "$CODEX_GLOBAL_AGENTS" \
      "SKILL_HOOKS_SECTION_FILE=$SKILL_HOOKS_TEMPLATE"
    printf 'Created %s from setup-agents-md minimal skill-hooks template\n' "$CODEX_GLOBAL_AGENTS"
    return
  fi

  write_global_merge_packet
}

for skill_name in "${SKILL_NAMES[@]}"; do
  install_skill "$skill_name"
done

prepare_global_agents

printf '\nDone. Restart Codex to pick up skill changes.\n'
