#!/usr/bin/env bash
set -euo pipefail

fail=0

check() {
  local message="$1"
  shift
  if ! "$@"; then
    printf 'FAIL: %s\n' "$message" >&2
    fail=1
  fi
}

for skill_dir in skills/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  skill_file="$skill_dir/SKILL.md"
  openai_file="$skill_dir/agents/openai.yaml"

  check "$skill_name has SKILL.md" test -f "$skill_file"
  check "$skill_name has matching frontmatter name" grep -qx "name: $skill_name" "$skill_file"
  check "$skill_name has description frontmatter" grep -q '^description: .' "$skill_file"
  check "$skill_name has agents/openai.yaml" test -f "$openai_file"
  check "$skill_name openai.yaml uses interface schema" grep -qx 'interface:' "$openai_file"
  check "$skill_name openai.yaml has display_name" grep -q '^  display_name: ' "$openai_file"
  check "$skill_name openai.yaml has short_description" grep -q '^  short_description: ' "$openai_file"
  check "$skill_name openai.yaml has default_prompt" grep -q '^  default_prompt: ' "$openai_file"
done

if rg -n 'setup-agents-md|ashie-agents-methodology|codex-agent-tooling|rescued|super duper' README.md AGENTS.md skills >/dev/null; then
  printf 'FAIL: stale names or informal setup prose remain:\n' >&2
  rg -n 'setup-agents-md|ashie-agents-methodology|codex-agent-tooling|rescued|super duper' README.md AGENTS.md skills >&2
  fail=1
fi

if rg -n '^version: 1$|^entries:|^  - trigger:' skills/*/agents/openai.yaml >/dev/null; then
  printf 'FAIL: stale agents/openai.yaml schema remains:\n' >&2
  rg -n '^version: 1$|^entries:|^  - trigger:' skills/*/agents/openai.yaml >&2
  fail=1
fi

if [ "$fail" -eq 0 ]; then
  printf 'skills validation passed\n'
fi

exit "$fail"
