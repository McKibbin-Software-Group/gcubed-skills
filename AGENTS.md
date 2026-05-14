# Project Instructions

This repo packages portable Codex skills, review-first AGENTS.md skill wiring, and optional methodology adoption guidance.

## Methodology

- Operate as the Architect for this repository: keep work scoped, preserve user changes, and prefer boring, reviewable install behavior.
- Use sub-agents only when the user explicitly asks. Directly handle small, tightly coupled, or urgent work; when a task would clearly benefit from parallel agents, tell the user why.
- Prefer investigating scripts, generated packets, docs, and current diffs before changing behavior.
- If useful tools are missing, call that out and provide install guidance. Prefer `rg`, `jq`, `shellcheck`, `git`, and `bash` for this repo.
- For read-only questions, avoid unnecessary worktree checks unless they help answer the question.
- The worktree is often dirty. Before editing, inspect `git status --short` and relevant diffs.
- Keep changes minimal and scoped to the request. Avoid opportunistic refactors.
- After changes, run the narrowest meaningful validation and report what passed or could not be run.
- When handling secrets, avoid printing full token values, config files, environment dumps, or credential contents.
- Prefer explicit operator-safe commands over clever shell one-liners when the user may need to repeat them.

## Start Here

- Read `docs/00-START-HERE.md` before non-trivial changes.
- Check `docs/02-current-status.md` and `docs/04-next-steps.md` for current work and validation state.
- Preserve user changes. This repo is often edited interactively while installer behavior is being designed.

## Project Context

- Project purpose: portable Codex skills, review-first AGENTS.md skill wiring, and optional Architect methodology adoption.
- Primary stack/tools: Bash scripts, Markdown docs, Codex skills, ShellCheck.
- Main entrypoints: `skills/project-memory/SKILL.md`, `skills/setup-agents-md/SKILL.md`, `skills/ashie-agents-methodology/SKILL.md`, and optional scripts under `scripts/`.

## Working Rules

- Treat `npx skills@latest add ashieslashy/skills` as the primary distribution path.
- Keep manual installer behavior boring and operator-safe.
- Do not blindly merge instruction prose into an existing `AGENTS.md`; write a packet and ask Codex to propose a reviewable diff.
- Keep skill wiring separate from optional methodology adoption.
- Prefer repo-local/project guidance in root `AGENTS.md`; keep durable project truth in `docs/`.
- Before editing scripts, inspect `git status --short` and relevant diffs.
- Do not commit, publish, or sync from local installs unless the user explicitly asks.
- After script changes, run:

```bash
shellcheck scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
bash -n scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
```

## Repository Map

- `skills/project-memory/`: installable Codex skill and templates.
- `skills/setup-agents-md/`: AGENTS.md skill-hook wiring skill and assets.
- `skills/ashie-agents-methodology/`: optional Architect AGENTS.md methodology adoption skill and assets.
- `skills/project-memory/assets/snippets/project-memory-methodology.md`: managed project-memory methodology block.
- `scripts/install.sh`: optional global/personal manual install flow.
- `scripts/install-project.sh`: optional project-local/devcontainer manual install flow.
- `scripts/sync-from-local.sh`: refresh this repo from installed local files.
- `docs/`: project memory and handoff docs.

<!-- BEGIN project-memory-methodology -->
## Project Documentation Methodology

At the start of work in a repository, check for a root `AGENTS.md` and the standard project documentation set under `docs/`.

Expected baseline:
- `AGENTS.md`
- `docs/00-START-HERE.md`
- `docs/01-repo-overview.md`
- `docs/02-current-status.md`
- `docs/03-roadmap.md`
- `docs/04-next-steps.md`
- optional `docs/adr/`
- optional `docs/ai/`

If the baseline is missing or clearly stale, suggest using `$project-memory`. When substantial work changes project state, use `$project-memory` to update the smallest relevant docs. Keep `AGENTS.md` concise and agent-facing. Keep durable project truth in `docs/`; keep temporary AI handoff notes in `docs/ai/`.
<!-- END project-memory-methodology -->
