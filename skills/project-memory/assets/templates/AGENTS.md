# Project Agent Instructions

Start with `docs/00-START-HERE.md`. Durable project context belongs in
`docs/`; temporary investigation plans or handoff notes belong in `docs/ai/`.
Keep this file limited to instructions that should shape agent behavior before
or while reading the rest of the project memory.

## Before Editing

- Check `git status --short` and relevant diffs. Preserve user changes.
- Read `docs/02-current-status.md` and `docs/04-next-steps.md` for current
  risks, validation state, and pickup tasks.
- Keep changes minimal and scoped to the user's request.
- Run the narrowest meaningful validation and report what passed or could not
  be run.

## Guardrails

Keep this section short: usually 5-10 bullets, one or two lines each. Include
only constraints that should shape agent behavior before or while reading the
project docs. If a guardrail needs background, examples, runtime flow, or an
operational procedure, put that explanation in `docs/` and point to it here.

- TODO: Add repo-specific safety, approval, validation, or hazard constraints.
- TODO: Remove these placeholder bullets before finishing setup.

## Documentation Boundary

- Stable architecture, runtime flow, environment variables, commands, and release
  process: `docs/01-repo-overview.md`.
- Current behavior, known risks, and latest validation:
  `docs/02-current-status.md`.
- Next operator or agent actions: `docs/04-next-steps.md`.
- Significant material durable architecture decisions when useful: `docs/adr/`.

{{PROJECT_MEMORY_METHODOLOGY}}
