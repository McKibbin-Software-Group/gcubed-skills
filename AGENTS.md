# Project Instructions

This repo packages portable Codex-compatible skills for G-Cubed code development, review, and improvement.

## Working Rules

- Keep changes minimal, scoped, and reviewable.
- Before editing, inspect `git status --short` and relevant diffs.
- Preserve user changes and avoid opportunistic refactors.
- Do not commit, publish, or sync from local installs unless the user explicitly asks.
- Do not dogfood the skills in this repo.
- Keep `README.md` focused on user install/update instructions.
- Put maintainer notes, asset maps, and longer-lived implementation guidance in `docs/MAINTAINERS.md`.

## Entry Points

- `skills/setup-gcubed-skills/SKILL.md`: post-install setup flow.
- `skills/project-memory/SKILL.md`: project memory docs flow.
- `skills/skill-capture/SKILL.md`: review-first skill proposal flow.
- `skills/review-synthesis/SKILL.md`: multi-perspective review synthesis flow.
- `skills/code-structure-cleanup/SKILL.md`: post-feature structure cleanup flow.
- `skills/serena-memory-hygiene/SKILL.md`: optional Serena memory audit and refresh flow.
