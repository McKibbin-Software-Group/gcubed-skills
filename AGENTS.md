# Project Instructions

This repo packages personal and project-local Codex tooling: reusable skills, global `AGENTS.md` snippets, and install scripts.

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

- Project purpose: portable Codex skills, global instruction snippets, and safe install flows.
- Primary stack/tools: Bash scripts, Markdown docs, Codex skills, ShellCheck.
- Main entrypoints: `scripts/install.sh`, `scripts/install-project.sh`, `scripts/sync-from-local.sh`, and `skills/project-memory/SKILL.md`.

## Working Rules

- Keep installer behavior boring and operator-safe.
- Do not blindly merge instruction prose into an existing `AGENTS.md`; write a merge packet and ask Codex to propose a reviewable merge.
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
- `global/AGENTS.md.example`: recommended global/user-level instructions.
- `global/project-memory-section.md`: managed project-memory methodology block.
- `scripts/install.sh`: global/personal install flow.
- `scripts/install-project.sh`: project-local/devcontainer install flow.
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
