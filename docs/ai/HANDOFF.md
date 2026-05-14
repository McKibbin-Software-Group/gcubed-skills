# AI Handoff

This file is temporary working memory for AI-assisted sessions. Promote durable facts into canonical docs and prune stale notes.

Last updated: 2026-05-14

## Active Thread

Set up the repo's project-memory baseline after adding a project-local installer flow.

## Useful Findings

- Codex discovers repo skills under `.agents/skills` from the current directory up to the repo root.
- Project-local install is the preferred path for ephemeral devcontainers when changes need to survive container rebuilds without mount changes.
- The safest `AGENTS.md` update strategy is packet-first, preview-before-apply.

## Files Touched / Relevant

- `scripts/install-project.sh`
- `scripts/install.sh`
- `README.md`
- `AGENTS.md`
- `docs/`

## Suggested Next Agent Move

Review the new docs and script diff, then run validation. If asked to continue implementation, consider adding a dedicated smoke-test script for install flows.

## Superseded / Cleanup Notes

- None yet.
