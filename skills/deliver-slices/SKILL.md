---
name: deliver-slices
description: Token-efficiently deliver a backlog or task bundle as ordered implementation slices using a supervisor and fresh child agents. Use when the user asks to work through GitHub issues, local next-step docs, markdown task lists, or a package of tickets sequentially with validation, docs, deploy decisions, commits, pushes, and a clean tree between slices.
---

# Deliver Slices

Use this skill when the user wants a package of work delivered end to end, not just planned. The main agent is the supervisor. Child agents do slice work in fresh context.

Default: plan once, deliver one slice at a time, keep the parent context small, commit/push after each accepted slice, start the next slice from a clean tree.

## Child Prompt Requirements

Every child-agent packet must include this initial-response handshake near the top:

```text
Use `$caveman`. Keep reports compressed.
On your first response only, start with:
ack: caveman active

Do not repeat `ack: caveman active` in progress updates, WIP heartbeats,
or the final report.

If `$caveman` is unavailable, start the first response with:
ack: caveman unavailable; compressed mode active
Mention this fallback again in the final report.
```

Also include the slice heartbeat path:

```text
wip_path: /tmp/deliver-slices/<repo>-<slice-id>-<agent-role>.wip.md
```

## Supervisor Rules

- Do not implement inline except for tiny fixes or emergency repair of a child result.
- Use read-only discovery agents in parallel when worklist discovery is large.
- Use one writer at a time on the active branch unless separate worktrees/branches and a merge plan are explicit.
- Keep parent updates terse. Summarize receipts; do not paste full child logs.
- Require the child prompt requirements above in every child packet.
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
   - Tell the child to update its WIP heartbeat every 10 minutes, before long commands, and after long commands.

4. Child contract
   - Acknowledge `$caveman` or compressed fallback on the first child response only.
   - Omit `ack: caveman active` from progress updates and the final report. If `$caveman` is unavailable, mention the fallback in the final report.
   - Inspect before editing.
   - Keep changes minimal and scoped.
   - Validate narrowly first, wider when risk requires.
   - Update docs touched by behavior or ops.
   - Update the WIP heartbeat at least every 10 minutes and before/after long validation, deploy, flash, or network operations.
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

## Supervisor Patience Protocol

`wait_agent` can wait up to 1 hour but does not stream progress. Use child WIP heartbeats and local diffs to distinguish active work from stalls.

Treat a child as still working when any condition is true:

- `wait_agent` times out but the child is not final
- heartbeat updated within the last 20 minutes
- `git status --short` or relevant diffs changed since the last check
- child reported a long validation, deploy, flash, or network operation that may still be running

Treat a child as stalled only when all conditions are true:

- at least one long wait elapsed without a final result
- two heartbeat intervals were missed
- no diff/status movement was observed
- no known long operation is expected to still be running

Before `close_agent` on a running child:

1. Send a non-interrupt status ping asking for the heartbeat/final report.
2. Wait at least 5 minutes.
3. Close only if still stalled, unsafe, conflicting, or explicitly stopped by the user.

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
