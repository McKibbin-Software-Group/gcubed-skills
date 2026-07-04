---
name: deliver-slices
description: Token-efficiently deliver a backlog or task bundle as ordered implementation slices using a supervisor and fresh child agents. Use when the user asks to work through GitHub issues, local next-step docs, markdown task lists, or a package of tickets sequentially with validation, docs, deploy decisions, commits, pushes, and a clean tree between slices.
---

# Deliver Slices

Use this skill when the user wants a package of work delivered end to end, not just planned. The main agent is the supervisor. Child agents do slice work in fresh context.

Default: plan once, deliver one slice at a time, keep the parent context small, commit/push after each accepted slice, start the next slice from a clean tree.

## Supervisor Rules

- Do not implement inline except for tiny fixes or emergency repair of a child result.
- Use read-only discovery agents in parallel when worklist discovery is large.
- Use one writer at a time on the active branch unless separate worktrees/branches and a merge plan are explicit.
- Keep parent updates terse. Summarize receipts; do not paste full child logs.
- Tell child agents to use `$caveman` when available, or otherwise answer in compressed form.
- Use `$handoff` only for paused/failed sprint continuation. For normal slice delivery, use the smaller slice packet.

## Workflow

1. Intake
   - Read repo instructions, current status/next-step docs, and `git status --short`.
   - Identify work sources: GitHub issues, local docs, user-provided task list, PR comments, or mixed set.
   - Freeze a worklist snapshot: ids, titles, paths/URLs, current labels/status, and any obvious dependencies.

2. Plan slices
   - Group by dependency order, shared files, shared validation, deploy target, and rollback risk.
   - Make each slice independently reviewable and committable.
   - Prefer thin vertical slices over broad subsystem rewrites.
   - Record planned slice order in chat or a transient `docs/ai/`/`/tmp` ledger when the sprint is long.
   - Read [grouping-heuristics.md](references/grouping-heuristics.md) when ordering is non-obvious.

3. Before each slice
   - Confirm clean tree or account for user changes.
   - Build a compact slice packet from [slice-packet.md](references/slice-packet.md).
   - Launch one child agent for implementation. Give it only the packet plus needed repo instructions.

4. Child contract
   - Inspect before editing.
   - Keep changes minimal and scoped.
   - Validate narrowly first, wider when risk requires.
   - Update docs touched by behavior or ops.
   - Return the fixed final report shape below.
   - Do not close issues unless packet explicitly says so.
   - Default: do not commit/push; supervisor owns the final gate. If packet delegates commit/push, child must still return proof.

5. Supervisor acceptance gate
   - Inspect `git status --short`, relevant diffs, and child report.
   - Run or verify meaningful validation. Re-run critical checks yourself when risk is high.
   - Decide deploy: deploy/revalidate only when safe, necessary, and sensible under repo/user rules.
   - Ensure docs are updated or explicitly unnecessary.
   - Commit and push one accepted slice.
   - Confirm clean tree before starting next slice.

6. Finish
   - Summarize slice commits, validation, deploys, deferred work, and remaining blockers.
   - Update/close issue tracker items only according to repo/user policy.
   - Leave repo clean or state exactly why not.

## Deploy Gate

Classify each slice before implementation:

- `deploy-required`: user-facing or hardware behavior needs live proof now.
- `deploy-if-safe`: deploy only if target reachable and risk low.
- `defer-deploy`: validation enough for now; record reason and follow-up.
- `no-deploy`: docs, tests, refactor, or tooling-only slice.

## Stop Conditions

Stop the slice and return to the user or supervisor when:

- worktree has unexplained user changes in files the slice must edit
- acceptance criteria conflict
- required secret/credential/target is missing
- deploy would affect hardware/prod beyond authorization
- tests fail outside slice scope and risk cannot be isolated
- child finds the slice is too broad for one clean commit

## Child Final Report

Require this fixed shape:

```text
slice: <name/id>
status: done | blocked | partial
commit: <hash or "not committed">
changed: <files/areas, brief>
validated: <commands/checks and result>
deployed: <target/result or "not deployed: reason">
docs: <updated paths or "not needed">
issues: <closed/updated refs or "not touched">
risks: <remaining risks/blockers>
```
