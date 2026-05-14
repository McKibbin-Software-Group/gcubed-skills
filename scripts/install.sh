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
    local backup="$DEST_SKILL.backup.$(timestamp)"
    mv "$DEST_SKILL" "$backup"
    printf 'Backed up existing skill to %s\n' "$backup"
  fi

  mv "$tmp_dest/$SKILL_NAME" "$DEST_SKILL"
  rmdir "$tmp_dest"
  printf 'Installed %s to %s\n' "$SKILL_NAME" "$DEST_SKILL"
}

ensure_global_agents() {
  mkdir -p "$(dirname "$CODEX_GLOBAL_AGENTS")"

  if [ ! -e "$CODEX_GLOBAL_AGENTS" ]; then
    require_file "$GLOBAL_EXAMPLE"
    cp "$GLOBAL_EXAMPLE" "$CODEX_GLOBAL_AGENTS"
    printf 'Created %s from global/AGENTS.md.example\n' "$CODEX_GLOBAL_AGENTS"
  fi
}

update_global_block() {
  require_file "$SECTION_FILE"
  ensure_global_agents

  local backup="$CODEX_GLOBAL_AGENTS.backup.$(timestamp)"
  cp "$CODEX_GLOBAL_AGENTS" "$backup"

  python3 - "$CODEX_GLOBAL_AGENTS" "$SECTION_FILE" <<'PY'
from pathlib import Path
import sys

target = Path(sys.argv[1])
section_path = Path(sys.argv[2])

start = "<!-- BEGIN project-memory-methodology -->"
end = "<!-- END project-memory-methodology -->"

text = target.read_text()
section = section_path.read_text().strip() + "\n"

if start in text and end in text:
    before, rest = text.split(start, 1)
    _, after = rest.split(end, 1)
    new_text = before.rstrip() + "\n\n" + section + after.lstrip()
elif "## Project Documentation Methodology" in text:
    marker = "## Project Documentation Methodology"
    before, rest = text.split(marker, 1)
    rest_with_marker = marker + rest
    lines = rest_with_marker.splitlines(keepends=True)
    next_section = None
    for idx, line in enumerate(lines[1:], start=1):
        if line.startswith("## "):
            next_section = idx
            break
    after = "".join(lines[next_section:]) if next_section is not None else ""
    new_text = before.rstrip() + "\n\n" + section + after.lstrip()
else:
    new_text = text.rstrip() + "\n\n" + section

target.write_text(new_text)
PY

  printf 'Updated managed project-memory block in %s\n' "$CODEX_GLOBAL_AGENTS"
  printf 'Backup written to %s\n' "$backup"
}

install_skill
update_global_block

printf '\nDone. Restart Codex to pick up skill changes.\n'
