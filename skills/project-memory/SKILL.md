---
name: project-memory
description: Create/refresh lean repo memory docs and root AGENTS.md guidance for handoffs, stale status, next steps, or post-work capture.
---

# Project Memory

Create or refresh a repository's lightweight memory layer without polluting default context.

Assume the global Architect methodology has been installed globally from
`$setup-gcubed-skills`, call out the missing dependency if not. This skill owns project documentation memory and
repo-local guardrails only. It does not own global `AGENTS.md` setup or
Architect methodology setup.

## Baseline Shape

Expected memory set:

- `AGENTS.md`: concise repo-local guardrails only; no runtime flow, status history, release process, environment catalog, or architecture overview.
- `docs/00-START-HERE.md`: entrypoint and source-of-truth map.
- `docs/01-repo-overview.md`: stable project map, architecture, key directories, commands.
- `docs/02-current-status.md`: current behavior, recent changes, risks, validation.
- `docs/03-roadmap.md`: milestones, priorities, deferred work, sequencing.
- `docs/04-next-steps.md`: practical pickup list only; current state needed
  to choose work, immediate next actions, current blockers, and narrow
  validation notes.
- `docs/adr/`: hint directory; add ADRs only for durable choices with tradeoffs.
- `docs/ai/`: hint directory; add temporary handoff, investigation, or plan files only when useful.

Copy and adapt templates from `assets/templates/` when creating missing files. Treat them as starting points, not boilerplate to leave untouched.

Keep `assets/snippets/project-memory-methodology.md` short; it is rendered by
`$setup-gcubed-skills` into global Architect guidance, not into repo-local
`AGENTS.md` files.

## Progressive Disclosure

- Keep generated repo `AGENTS.md` lean: point to memory, do not restate global
  Architect or project-memory methodology.
- Keep baseline, setup mechanics, and refresh rules here, loaded only when `$project-memory` runs.
- Use `docs/00-START-HERE.md` as the map, then open only docs needed for the task.
- Link instead of duplicating architecture, runtime flow, commands, release process, or status.

## Setup or Refresh Workflow

Use this for missing memory or stale, incomplete, placeholder-heavy docs.

1. Read any existing root `AGENTS.md`, `docs/00-START-HERE.md`, baseline docs, and nearby domain/architecture docs before writing.
2. Inspect repo shape with `rg --files`, manifests, deployment/config files, tests, scripts, recent work, validation signals, and user context.
3. Preserve useful existing doc structure and voice. Avoid broad rewrites when targeted updates will do.
4. Keep each doc short and link to deeper docs instead of duplicating detail.
5. Put durable project truth in `docs/`; put temporary investigation notes and draft plans in `docs/ai/`.
6. Never overwrite existing docs unread. Explain substantial structural moves first.

For setup:

- Create only the missing baseline files and hint directories.
- Preserve existing doc style and naming when useful.
- Copy templates from `assets/templates/`, replace placeholders with discovered repo facts, and delete sections that do not apply.

For refresh:

- Do not treat existing files as a no-op by default.
- Distinguish stale from still-accurate content before changing it.
- Replace stale facts and placeholders with discovered facts.
- Delete or replace obsolete pickup bullets before appending new ones.
- If information cannot be discovered, write a dated unknown such as "Not identified from repo scan on YYYY-MM-DD" only when keeping the section is still useful.
- Update `docs/02-current-status.md` and `docs/04-next-steps.md` first after substantial work; update overview, roadmap, ADRs, or `docs/ai/` only when facts changed.
- Summarize semantic changes, validation run or skipped, and remaining unknowns before writing.

If noticed during unrelated work, do not derail the task; briefly offer to run setup later.

## AGENTS.md Boundary

`AGENTS.md` is part of the baseline, but it is instruction prose rather than ordinary documentation.

- If root `AGENTS.md` is missing during project-memory setup, propose a concise repo-local file from `assets/templates/AGENTS.md`. Do not include global Architect or project-memory methodology blocks in repo-local `AGENTS.md`.
- If root `AGENTS.md` exists and mixes agent guardrails with durable project facts, treat that as documentation drift. Propose moving durable facts into the smallest appropriate `docs/` file and rewriting `AGENTS.md` as lean guardrails.
- Keep guardrails short and actionable: usually 5-10 bullets, one or two lines each. If a guardrail needs background, examples, runtime flow, or operational procedure, put the explanation in `docs/` and link or point to it from `AGENTS.md`.
- Keep only repository-specific constraints that should shape agent behavior
  before or while reading project docs: generated-file rules, unusual validation
  commands, protected paths, external side effects, repo-specific hazards, and
  pointers into the docs memory set.
- Do not preserve runtime flow, environment variable catalogs, release procedure, architecture overview, current status, roadmap, or long maintenance notes in `AGENTS.md` merely because they already exist there.
- Architect methodology adoption still belongs to `$setup-gcubed-skills`; use that skill when the user wants to install or refresh MSG-owned methodology blocks.
- Show a semantic summary and diff/full file before writing any `AGENTS.md` change, and write only after explicit approval.

## Update Workflow

After substantial work, update the smallest relevant docs:

- Update `docs/02-current-status.md` when behavior, deployment state, known risks, or validation state changes.
- Update `docs/04-next-steps.md` when the next operator/agent action changes.
- Update `docs/01-repo-overview.md` when architecture, directory ownership, or core workflows change.
- Update `docs/03-roadmap.md` when priority or sequencing changes.
- Add an ADR only for durable decisions with meaningful tradeoffs.
- Promote lasting findings from `docs/ai/` into canonical docs; prune or mark temporary notes as superseded.

Do not paste chat transcripts. Summarize outcomes, decisions, commands, and verification signals in current-state language. Use concrete dates when recording status.

## Current-Status Boundary

Treat `docs/02-current-status.md` as a dashboard, not a phase diary. It should
answer: what is active now, what baseline must hold, what currently blocks or
risks the next action, and what was most recently verified.

Keep only:

- active phase/slice and authoritative links;
- current behavior or invariants needed for that slice;
- active risks, blockers, and conditional gates;
- the latest relevant validation/deployment baseline; and
- operational facts needed before the next external action.

Do not keep completed-phase narratives, test-count ledgers, commit histories,
fixture archaeology, troubleshooting diaries, superseded sequencing, or
decisions already owned by an ADR/spec. Git is the default history store.

At a phase transition, replace the previous status snapshot; do not append a
new receipt beneath it. Aim for five or fewer sections and roughly 100 lines.
Before writing, delete any statement that does not change the next work,
validation, or live operation.

## Next-Steps Boundary

Treat `docs/04-next-steps.md` as the cockpit, not the flight recorder. It
answers "what now?" for the next human or agent. It should usually stay under
150-200 lines; if it grows past that, compact it before adding more.

Keep only:

- current state needed to choose the next slice
- required next actions and immediate acceptance notes
- current blockers, risks, and assumptions
- narrow validation guidance for the next slice
- links to deeper history or command catalogs

Do not keep:

- completed issue schedules or "complete" ledgers
- historical validation logs
- old deploy diaries or blow-by-blow troubleshooting narratives
- long command catalogs
- architecture overviews already covered by roadmap/overview docs
- stale alternatives that no longer affect the next decision

Move durable current facts to `docs/02-current-status.md`. Move historical
detail to milestone/archive docs or `docs/ai/` if it is temporary. Link instead
of duplicating.

Before writing `docs/04-next-steps.md`, check:

- What can be deleted because it is complete?
- What belongs in `docs/02-current-status.md` instead?
- What belongs only in history/archive docs?
- Can a future agent choose the next slice within two minutes?
- Is the file still within the line-budget heuristic?

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
- `assets/templates/docs/ai/HANDOFF.md` when a handoff note is useful
- `assets/templates/docs/adr/0001-record-architecture-decisions.md` when an ADR is useful
- `assets/snippets/project-memory-methodology.md`

When using templates, replace placeholders with repo-specific facts discovered
from files. Delete sections that do not apply. Before proposing generated docs,
check the proposed `AGENTS.md` and `docs/` content for unresolved `TODO`
placeholders and either resolve them, remove the section, or mark a dated
unknown.
