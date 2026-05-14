# Project Instructions

This repo packages personal and project-local Codex tooling: reusable skills, global `AGENTS.md` snippets, and install scripts.

## Start Here

- Read `docs/00-START-HERE.md` before non-trivial changes.
- Check `docs/02-current-status.md` and `docs/04-next-steps.md` for current work and validation state.
- Preserve user changes. This repo is often edited interactively while installer behavior is being designed.

## Working Rules

- Keep installer behavior boring and operator-safe.
- Do not blindly merge instruction prose into an existing `AGENTS.md`; write a merge packet and ask Codex to propose a reviewable merge.
- Prefer repo-local/project guidance in root `AGENTS.md`; keep durable project truth in `docs/`.
- Before editing scripts, inspect `git status --short` and relevant diffs.
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

## Project Documentation Methodology

At the start of work in this repository, check for the standard project documentation set under `docs/`.

Expected baseline:
- `AGENTS.md`
- `docs/00-START-HERE.md`
- `docs/01-repo-overview.md`
- `docs/02-current-status.md`
- `docs/03-roadmap.md`
- `docs/04-next-steps.md`
- `docs/adr/`
- `docs/ai/`

When substantial work changes installer behavior, update the smallest relevant docs. Keep `AGENTS.md` concise and agent-facing. Keep durable project truth in `docs/`; keep temporary AI handoff notes in `docs/ai/`.
