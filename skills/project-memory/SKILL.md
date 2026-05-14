---
name: project-memory
description: Create and maintain a concise per-project documentation memory system for agent handoff and low-loss project continuity. Use when setting up a new repository, when a repo is missing root AGENTS.md or standard docs, when docs/current-status/next-steps are stale, or when substantial work should be captured for future sessions.
---

# Project Memory

Use this skill to create or refresh a repository's lightweight memory layer without polluting context.

## Baseline Shape

Expected repository memory set:

- `AGENTS.md`: repo-local agent instructions only; no long status history.
- `docs/00-START-HERE.md`: entrypoint and source-of-truth map.
- `docs/01-repo-overview.md`: stable project map, architecture, key directories, commands.
- `docs/02-current-status.md`: living snapshot of what works, what changed, risks, last validation.
- `docs/03-roadmap.md`: milestones, priorities, deferred work, sequencing.
- `docs/04-next-steps.md`: practical pickup list for the next work session.
- `docs/adr/`: durable decisions that should not be repeatedly relitigated.
- `docs/ai/`: temporary AI handoff, investigations, and implementation plans.

Copy and adapt templates from `assets/templates/` when creating missing files. Treat them as starting points, not boilerplate to leave untouched.

## Setup Workflow

1. Read any existing root `AGENTS.md`, `docs/00-START-HERE.md`, and nearby docs before writing.
2. Inspect the repo shape with `rg --files`, package manifests, deployment/config files, and existing tests or scripts.
3. Create only the missing baseline files/directories. Preserve the project's existing doc style and naming if it already has one.
4. Keep each doc short and link to deeper docs instead of duplicating detail.
5. Put durable project truth in `docs/`; put temporary investigation notes and draft plans in `docs/ai/`.
6. Never overwrite existing docs without reading them. If replacing structure would be substantial, explain the proposed move first.

If this skill is noticed during unrelated work, do not derail the task. Briefly mention that the repo is missing/stale and offer to run the setup later.

## Update Workflow

After substantial work, update the smallest relevant docs:

- Update `docs/02-current-status.md` when behavior, deployment state, known risks, or validation state changes.
- Update `docs/04-next-steps.md` when the next operator/agent action changes.
- Update `docs/01-repo-overview.md` when architecture, directory ownership, or core workflows change.
- Update `docs/03-roadmap.md` when priority or sequencing changes.
- Add an ADR for durable decisions with meaningful tradeoffs.
- Promote lasting findings from `docs/ai/` into canonical docs; prune or mark temporary notes as superseded.

Do not paste chat transcripts. Summarize outcomes, decisions, commands, and verification signals in current-state language. Use concrete dates when recording status.

## Writing Rules

- Optimize for fast pickup by a future human or agent.
- Prefer bullets, links, and short sections over narrative.
- Record "what is true now" and "what to do next"; avoid historical archaeology unless it explains current constraints.
- Keep secrets, token paths, and sensitive environment dumps out of docs.
- Make validation explicit: command run, result, date, and any gaps.
- When uncertain, mark assumptions and open questions plainly.

## Template Use

Templates live at:

- `assets/templates/AGENTS.md`
- `assets/templates/docs/00-START-HERE.md`
- `assets/templates/docs/01-repo-overview.md`
- `assets/templates/docs/02-current-status.md`
- `assets/templates/docs/03-roadmap.md`
- `assets/templates/docs/04-next-steps.md`
- `assets/templates/docs/ai/HANDOFF.md`
- `assets/templates/docs/adr/0001-record-architecture-decisions.md`

When using templates, replace placeholders with repo-specific facts discovered from files. Delete sections that do not apply.
