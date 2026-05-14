#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"
CODEX_GLOBAL_AGENTS="${CODEX_GLOBAL_AGENTS:-$HOME/.codex/AGENTS.md}"

SKILL_NAME="project-memory"
SOURCE_SKILL="$CODEX_SKILLS_DIR/$SKILL_NAME"
DEST_SKILL="$REPO_ROOT/skills/$SKILL_NAME"
GLOBAL_EXAMPLE="$REPO_ROOT/global/AGENTS.md.example"
SECTION_FILE="$REPO_ROOT/global/project-memory-section.md"

if [ ! -e "$SOURCE_SKILL/SKILL.md" ]; then
  printf 'Missing local skill: %s\n' "$SOURCE_SKILL" >&2
  exit 1
fi

if [ ! -e "$CODEX_GLOBAL_AGENTS" ]; then
  printf 'Missing global AGENTS file: %s\n' "$CODEX_GLOBAL_AGENTS" >&2
  exit 1
fi

tmp_skill="$(mktemp -d)"
cp -R "$SOURCE_SKILL" "$tmp_skill/$SKILL_NAME"

rm -rf "$DEST_SKILL"
mkdir -p "$(dirname "$DEST_SKILL")"
mv "$tmp_skill/$SKILL_NAME" "$DEST_SKILL"
rmdir "$tmp_skill"

cp "$CODEX_GLOBAL_AGENTS" "$GLOBAL_EXAMPLE"

python3 - "$CODEX_GLOBAL_AGENTS" "$SECTION_FILE" <<'PY'
from pathlib import Path
import sys

source = Path(sys.argv[1])
dest = Path(sys.argv[2])

start = "<!-- BEGIN project-memory-methodology -->"
end = "<!-- END project-memory-methodology -->"

text = source.read_text()
if start in text and end in text:
    block = start + text.split(start, 1)[1].split(end, 1)[0] + end + "\n"
else:
    marker = "## Project Documentation Methodology"
    idx = text.find(marker)
    if idx == -1:
        raise SystemExit("Could not find Project Documentation Methodology section")
    section_text = text[idx:]
    lines = section_text.splitlines(keepends=True)
    next_section = None
    for line_idx, line in enumerate(lines[1:], start=1):
        if line.startswith("## "):
            next_section = line_idx
            break
    if next_section is not None:
        section_text = "".join(lines[:next_section])
    block = "<!-- BEGIN project-memory-methodology -->\n" + section_text.strip() + "\n<!-- END project-memory-methodology -->\n"

dest.write_text(block)
PY

printf 'Synced %s into %s\n' "$SOURCE_SKILL" "$DEST_SKILL"
printf 'Synced %s into %s\n' "$CODEX_GLOBAL_AGENTS" "$GLOBAL_EXAMPLE"
printf 'Updated %s\n' "$SECTION_FILE"
