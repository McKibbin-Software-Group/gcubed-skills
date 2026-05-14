# AI Handoff

This file is temporary working memory for AI-assisted sessions. Promote durable facts into canonical docs and prune stale notes.

Last updated: 2026-05-14

## Active Thread

Pivot from clone-and-run installers to a skills collection model with separated docs memory, AGENTS.md skill wiring, and optional methodology adoption.

## Useful Findings

- `npx skills@latest add ashieslashy/skills` is the intended primary UX.
- `setup-agents-md` owns post-install global/project/devcontainer skill-hook wiring.
- `ashie-agents-methodology` owns optional Architect methodology preview/replace/merge.
- `project-memory` owns docs memory templates and the project-memory methodology snippet.
- Manual scripts remain as fallback helpers.
- The safest `AGENTS.md` update strategy remains preview-before-apply.

## Files Touched / Relevant

- `scripts/install-project.sh`
- `scripts/install.sh`
- `scripts/sync-from-local.sh`
- `README.md`
- `skills/setup-agents-md/`
- `skills/ashie-agents-methodology/`
- `skills/project-memory/SKILL.md`
- `AGENTS.md`
- `docs/`

## Suggested Next Agent Move

Run validation and smoke-test both fallback scripts. Then test the skills CLI install path once the GitHub repo is renamed/mirrored to `ashieslashy/skills` or the README is adjusted to the current repo name.

## Superseded / Cleanup Notes

- None yet.
