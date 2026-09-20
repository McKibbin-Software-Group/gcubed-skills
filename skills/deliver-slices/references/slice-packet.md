# Slice Packet Template

Supervisor: fill relevant fields, remove unused fields, and append the Worker Contract below, including its checkpoint and report formats. This is the worker's complete delivery contract; do not require a read of the parent skill.

For follow-up work in the same thread, send only changed fields and the next task. Supply missing state after context loss rather than replaying the original history.

Model/effort choices belong in supported launch configuration and the supervisor's ledger, not merely in this brief.

## Brief

```text
role: implement | discover | review | accept
slice: <id/name>
objective: <one outcome>
work_refs: <issue/task refs and relevant sections>
instructions: <applicable repo instruction paths; read in full as required>
context_refs: <specific files with sections/symbols and accepted versions>
decisions: <settled constraints the worker must not rediscover>
scope: <allowed areas, non-goals, preserved user changes>
acceptance: <observable outcomes>
working_directory: <exclusive checkout/worktree; read-only for discovery/review>
branch: <branch and expected baseline>
dependencies: <accepted revisions/artifact identities; any later prerequisite and its owner>
integration: <owner, target, merge order; omit if not applicable>

validation:
  now: <assigned commands/checks, or none for read-only review>
  later: <group checks, owner, exact trigger; or none>
  receipts: <valid existing evidence, paths, tested inputs and reuse limits>
  runner: <existing script and invocation, if available>

deploy: <policy, authorized target, required revalidation; default no-deploy>
docs: <expected paths or none unless behavior changes>
commit_policy: <supervisor-commits by default; delegated scope if applicable>
issue_policy: <not touched by default; explicit delegated actions if applicable>
stop_if: <task-specific blockers beyond the contract below>
wip_path: /tmp/deliver-slices/<run-id>-<repo>-<slice-id>-<role>.wip.md
```

## Worker Contract

Use $caveman for working notes, inter-agent messages, and reports. Preserve technical detail, uncertainty, blockers, and validation evidence. Keep code, commands, identifiers, and quoted errors exact. If unavailable, use concise technical language and report the fallback once.

Use concise technical notes and reports; no acknowledgement is required. Report blockers and decisions promptly. Do not spawn additional agents unless the packet explicitly delegates that authority.

Read applicable repo instructions. Confirm branch/baseline and account for pre-existing changes before work or resumption. Inspect before editing and preserve user changes. Discovery/review roles are read-only except their checkpoint; do not run checks that mutate shared files or outputs. Keep implementation within assigned scope and update docs affected by behavior or operations.

Search for relevant sections/symbols before reading large files. Reuse material already in context; reread when it changed, is no longer available, or a specific question requires it. Read broader context when needed for correctness. Keep full logs and generated artifacts on disk; return summaries, paths, and useful failure excerpts. Do not load bundles, whole plans, full test logs, or batches of screenshots by default.

Run assigned checks and add meaningful regression tests for discovered bugs. Do not run another owner's group checks unless a concrete risk warrants earlier feedback; report why. Reuse passing evidence only when it covers the required check and tested inputs remain valid. Do not rerun solely for a separate receipt. Record actual commands, results/exit statuses, tested code/dependency/configuration/generated-input identities, and log paths; propagate failures. Changed inputs invalidate affected receipts.

Use existing validation scripts when available. Monitor only commands you own, using completion notifications or the longest appropriate interruptible wait allowed by higher-priority instructions and tool limits. Do not repeatedly read logs or status just to fill a wait. One command has one monitor.

If remaining work depends solely on another worker, supervisor approval, or an unavailable external input, write a checkpoint and return `status: paused` with the dependency and exact resume condition. End your turn. Do not poll, list agents, send reminders, or maintain heartbeats while paused. Retain the thread for explicit resumption. Before pausing, finish, stop safely, or explicitly hand off owned commands; never leave an unmonitored writer running.

Return `blocked` for conflicting user changes, unclear/conflicting acceptance, missing required access, unauthorized effects, or a failure whose risk cannot be isolated. Ask the supervisor to regroup an oversized slice; preserve completed work. A dependency pause or blocker is not acceptance.

Do not commit/push or update/close issues unless delegated. Return the report below when done, paused, blocked, or partial; `done` means ready for supervisor acceptance.

### Checkpoint

Create the parent directory and maintain one current snapshot at `wip_path`. Write at startup, before pausing, at completion, and before/after long commands. During active work, refresh after roughly ten minutes when control is available; routine writes need no chat message. A recorded long-command wait suspends periodic writes until control returns. Paused workers have no heartbeat deadline.

Use actual timestamps and record any long operation's expected next check; do not invent an ETA. If uncertain, record a reasonable inspection time rather than promising completion.

```text
time: <ISO timestamp>
status: working | validating | paused | blocked | done | partial
current: <activity or dependency>
changed: <files/areas, or none>
validated: <receipt/log refs with tested inputs, or none>
next: <remaining action>
operation: <owned command/session, actual start time, log path; omit if none>
check_after: <next inspection time for an owned long operation; omit otherwise>
blocked_by: <dependency and owner; only if paused/blocked>
resume_when: <verifiable condition; only if paused/blocked>
```

### Report

```text
slice: <id/name>
status: done | paused | blocked | partial
commit: <hash and remote verification if delegated, or not committed>
changed: <files/areas, brief>
validated: <checks, results, tested input identities, receipt/log paths>
acceptance_pending: <checks and owners, or none>
deployed: <target/result, or not deployed: reason>
docs: <updated paths, or not needed>
issues: <updated refs, or not touched>
risks: <remaining risks/blockers, or none>
checkpoint: <wip_path>
blocked_by: <dependency and owner; omit unless paused/blocked>
resume_when: <exact condition and next action; omit unless paused/blocked>
```
