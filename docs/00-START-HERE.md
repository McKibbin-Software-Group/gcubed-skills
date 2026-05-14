# Start Here

This is the entrypoint for humans and agents working in this repo.

## Current Source Of Truth

- Repo overview: `docs/01-repo-overview.md`
- Current status: `docs/02-current-status.md`
- Roadmap: `docs/03-roadmap.md`
- Next steps: `docs/04-next-steps.md`
- Architecture decisions: `docs/adr/`
- Temporary AI working notes: `docs/ai/`

## Project In One Paragraph

This repo is a small portable Codex skills collection. It currently has three base responsibilities: `project-memory` owns repo docs memory, `setup-agents-md` owns boring AGENTS.md skill-hook wiring, and `ashie-agents-methodology` owns optional Architect methodology adoption.

## First Commands

```bash
git status --short
rg --files
shellcheck scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
bash -n scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
```

## Before Making Changes

- Read root `AGENTS.md`.
- Check `docs/02-current-status.md` and `docs/04-next-steps.md`.
- Inspect relevant scripts/config before editing.
- Preserve local/user changes.
- For installer changes, test both fresh and existing target states in temporary directories.
