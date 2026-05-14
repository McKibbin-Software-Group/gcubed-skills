# ADR 0002: Prefer Skills Collection Distribution

Date: 2026-05-14

## Status

Accepted

## Context

The original install model was clone this tooling repo, run local scripts, finish merge tasks, then delete the clone. That works, but it makes source layout and purpose harder to understand: a distribution repo starts to look like a dogfooding workspace.

The `npx skills@latest add <owner>/<repo>` workflow can install a collection of skills directly from GitHub and let users choose project/global scope and target agent. This matches the desired experience for a growing set of skills.

## Decision

Use skills collection installation as the primary distribution model:

```bash
npx skills@latest add ashieslashy/skills
```

Keep `project-memory` as the docs-memory skill. Add `setup-agents-md` as the post-install skill-hook wiring skill. Add `ashie-agents-methodology` as the optional skill for previewing, replacing, or intelligently merging Ashie's Architect `AGENTS.md` methodology.

Do not keep manual install/sync scripts in this repo. They obscure the distribution-source purpose. Setup work should be performed by installed AI skills.

## Consequences

- Installed skills must be self-contained; required templates and setup assets must live under `skills/`.
- Canonical instruction prose must live in templates/snippets under skill assets, not inside shell scripts.
- Skill-hook wiring assets move into `skills/setup-agents-md/`.
- Optional Architect methodology assets move into `skills/ashie-agents-methodology/`.
- Project-memory docs templates and snippets stay under `skills/project-memory/`.
- The GitHub repo may need to be renamed or mirrored to `ashieslashy/skills` for the desired final command.
- The review-first merge policy from ADR 0001 still applies.
