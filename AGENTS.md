# Project Instructions

This repo packages portable Codex skills, review-first AGENTS.md skill wiring, and optional methodology adoption guidance.

## Methodology

- Operate as the Architect for this repository: keep work scoped, preserve user changes, and prefer boring, reviewable install behavior.
- Use sub-agents only when the user explicitly asks. Directly handle small, tightly coupled, or urgent work; when a task would clearly benefit from parallel agents, tell the user why.
- Prefer investigating skills, templates, docs, and current diffs before changing behavior.
- If useful tools are missing, call that out and provide install guidance. Prefer `rg`, `jq`, `git`, and `bash` for this repo.
- For read-only questions, avoid unnecessary worktree checks unless they help answer the question.
- The worktree is often dirty. Before editing, inspect `git status --short` and relevant diffs.
- Keep changes minimal and scoped to the request. Avoid opportunistic refactors.
- After changes, run the narrowest meaningful validation and report what passed or could not be run.
- When handling secrets, avoid printing full token values, config files, environment dumps, or credential contents.
- Prefer explicit operator-safe commands over clever shell one-liners when the user may need to repeat them.

## Project Context

- Project purpose: portable Codex skills, review-first AGENTS.md skill wiring, and optional Architect methodology adoption.
- Primary stack/tools: Markdown docs and Codex skills.
- Main entrypoints: `skills/project-memory/SKILL.md`, `skills/setup-agents-md/SKILL.md`, and `skills/ashie-agents-methodology/SKILL.md`.

## Working Rules

- Treat `npx skills@latest add ashieslashy/skills` as the primary distribution path.
- Keep setup behavior AI-driven and review-first.
- Do not blindly merge instruction prose into an existing `AGENTS.md`; write a packet and ask Codex to propose a reviewable diff.
- Keep skill wiring separate from optional methodology adoption.
- Keep durable design decisions in `docs/adr/`.
- Before editing, inspect `git status --short` and relevant diffs.
- Do not commit, publish, or sync from local installs unless the user explicitly asks.

## Repository Map

- `skills/project-memory/`: installable Codex skill and templates.
- `skills/setup-agents-md/`: AGENTS.md skill-hook wiring skill and assets.
- `skills/ashie-agents-methodology/`: optional Architect AGENTS.md methodology adoption skill and assets.
- `skills/project-memory/assets/snippets/project-memory-methodology.md`: managed project-memory methodology block.
- `docs/adr/`: durable design decisions for this skills collection.
