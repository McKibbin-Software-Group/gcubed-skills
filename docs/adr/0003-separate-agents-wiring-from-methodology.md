# ADR 0003: Separate AGENTS.md Wiring From Methodology Adoption

Date: 2026-05-14

## Status

Accepted

## Context

Installing skills, wiring those skills into `AGENTS.md`, and adopting Ashie's opinionated Architect methodology are different user choices. Combining them risks surprising users who only wanted skill hooks or project-memory docs.

## Decision

Use three separate skills:

- `project-memory`: project docs memory.
- `setup-agents-md`: compact skill-hook wiring for global/project/devcontainer `AGENTS.md`.
- `ashie-agents-methodology`: optional preview/replace/merge of Ashie's Architect methodology.

All `AGENTS.md` changes remain review-first.

## Consequences

- Users can keep an existing `AGENTS.md` and only add skill hooks.
- Users can opt into the Architect methodology separately.
- Manual scripts should create wiring packets only, not deploy the full Architect methodology by default.
