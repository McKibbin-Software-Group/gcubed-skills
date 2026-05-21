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
- `docs/adr/` as a hint directory for ADRs when useful
- `docs/ai/` as a hint directory for temporary AI notes when useful

If the baseline is missing or clearly stale, suggest using `$project-memory`. When substantial work changes project state, use `$project-memory` to update the smallest relevant docs. Keep `AGENTS.md` concise and agent-facing: short guardrails only, with durable project truth in `docs/` and temporary AI handoff notes in `docs/ai/`. If `AGENTS.md` contains runtime flow, environment catalogs, release procedure, architecture overview, current status, roadmap, or long maintenance notes, propose moving that content into `docs/` and lean `AGENTS.md` down to guardrails plus pointers.
<!-- END project-memory-methodology -->
