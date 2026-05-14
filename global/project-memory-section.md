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
