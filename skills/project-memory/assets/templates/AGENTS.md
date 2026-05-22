# Project Agent Instructions

Start with `docs/00-START-HERE.md`. Durable project context belongs in `docs/`;
temporary investigation plans or handoff notes belong in `docs/ai/`.

## Before Editing

- Check `git status --short` and relevant diffs. Preserve user changes.
- Read `docs/02-current-status.md` and `docs/04-next-steps.md` for current
  risks, validation state, and pickup tasks.
- Keep changes minimal and scoped to the user's request.
- Run the narrowest meaningful validation and report what passed or could not
  be run.

## Repo Guardrails

- TODO: Add repo-specific safety, approval, validation, or hazard constraints.
- TODO: Remove these placeholder bullets before finishing setup.

## Docs Map

Use `docs/00-START-HERE.md` as the source-of-truth map. Keep stable
architecture and commands in `docs/01-repo-overview.md`, current state in
`docs/02-current-status.md`, roadmap in `docs/03-roadmap.md`, and pickup work in
`docs/04-next-steps.md`. Significant material durable architecture decisions when useful: `docs/adr/`.

{{PROJECT_MEMORY_METHODOLOGY}}
