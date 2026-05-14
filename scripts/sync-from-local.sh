#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"
SKILL_NAMES=("project-memory" "setup-agents-md" "ashie-agents-methodology")

sync_skill() {
  local skill_name="$1"
  local source_skill="$CODEX_SKILLS_DIR/$skill_name"
  local dest_skill="$REPO_ROOT/skills/$skill_name"

  if [ ! -e "$source_skill/SKILL.md" ]; then
    printf 'Missing local skill: %s\n' "$source_skill" >&2
    exit 1
  fi

  local tmp_skill
  tmp_skill="$(mktemp -d)"
  cp -R "$source_skill" "$tmp_skill/$skill_name"

  rm -rf "$dest_skill"
  mkdir -p "$(dirname "$dest_skill")"
  mv "$tmp_skill/$skill_name" "$dest_skill"
  rmdir "$tmp_skill"

  printf 'Synced %s into %s\n' "$source_skill" "$dest_skill"
}

for skill_name in "${SKILL_NAMES[@]}"; do
  sync_skill "$skill_name"
done

printf '\nReview the diff before committing. AGENTS.md wiring templates live in setup-agents-md assets; optional Architect methodology templates live in ashie-agents-methodology assets.\n'
