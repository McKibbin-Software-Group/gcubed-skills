---
name: deliver-slices
description: Deliver a backlog or task bundle as ordered, reviewable implementation slices with a coordinating supervisor and scoped child agents. Use for end-to-end delivery from GitHub issues, local task docs, PR comments, or ticket bundles, including validation, docs, deploy decisions, and authorized commits and pushes.
---

# Deliver Slices

The main agent owns coordination, acceptance, delivery, and user communication. Delegate implementation to scoped workers. Plan once, deliver one slice at a time per checkout/branch, and continue until the authorized package is complete or genuinely blocked.

Keep decisions and receipt paths in a compact ledger. Use brief, precise inter-agent messages; preserve technical detail and uncertainty. Use $caveman for supervisor-to-child messages and supervisor working notes. Keep user-facing communication normal. Child communication requirements are defined in the Worker Contract.

## Supervisor Rules

- Keep parent context to scope, decisions, relevant diffs, risks, and receipts. Delegate implementation, diagnosis, and routine validation. Read deeper for a concrete review question; do not repeat worker exploration.
- Keep one writer per checkout/worktree, including the supervisor. Parallel writers require isolated directories, distinct branches within a repository, and isolated generated/test outputs.
- Record ownership, accepted dependency versions, and integration order. Workers must not consume another worker's changing files. Serialize integration and validate the combined result.
- Implement inline only for tiny fixes or emergency repair, after obtaining exclusive write ownership. Do not take over merely because a worker is quiet.
- Parallelize ready, independent work when useful. Do not launch workers whose only action is waiting for a dependency. Use discovery or review agents for a bounded question; avoid routine extra review tiers.
- Batch non-blocking comments; send correctness issues, blockers, and user steering promptly.
- Honor existing user/repo authorization for commits, pushes, issue updates, and deployments. This skill does not expand it.

## Workflow

1. **Intake and plan**
   - Read applicable repo instructions, relevant status/next-step sections, and `git status --short`. Record pre-existing user changes.
   - Freeze the worklist: ids, titles, refs, status, acceptance criteria, and dependencies. Group coherent, independently reviewable slices; read [grouping-heuristics.md](references/grouping-heuristics.md) only when grouping or ordering needs judgment.
   - Record slice order, ownership, validation gates and owners, deploy policy, and dependency readiness. For long work, use a ledger in an appropriate `docs/ai/` or `/tmp` location.
   - Record requested supervisor/worker model and effort separately. Honor user choices and configured defaults. When selection is delegated, choose capability appropriate to the work. Apply choices through supported launch settings; packet prose alone does not configure a model. Verify resolved settings once when metadata is available; otherwise mark them unverified.

2. **Assign ready work**
   - Confirm the checkout is clean or explicitly account for preserved user changes before each slice.
   - Read [slice-packet.md](references/slice-packet.md) once. Send a filled brief plus its Worker Contract, including checkpoint/report formats. Do not send this entire skill or require workers to reload it.
   - Include applicable instruction paths, exact relevant doc sections/symbols, accepted versions, decisions, validation commands, and reusable receipts. Inspect necessary context yourself to make the packet actionable; do not duplicate worker implementation discovery.
   - Start independent scope in fresh context (`fork_turns: "none"` where supported). Reuse a worker for corrections, dependency resumption, and closely related subsequent slices while its context remains useful. A new commit alone does not require a new worker.
   - Start a fresh worker when scope changes materially or accumulated context impedes work. Transfer only decisions, relevant refs, receipts, checkpoint, and unfinished work.

3. **Coordinate dependencies**
   - Treat `paused` as an internal dependency checkpoint, never as accepted or delivered work. Record the worker/thread, dependency owner, exact resume condition, receipts, and retained write ownership.
   - Continue other ready work. Do not poll paused workers, request heartbeats, or close a resumable thread.
   - When the prerequisite is ready, verify its accepted revision/artifact identity and explicitly resume the same worker with only the changed inputs and next task. Use the runtime's supported follow-up/resume operation; a status message alone may not restart an idle worker.
   - If resumption is unavailable, give a fresh worker the checkpoint after confirming the previous writer and any owned commands have stopped or transferred ownership.
   - A pause does not release a dirty checkout for another writer. Finish, safely integrate, or explicitly transfer the existing work first.
   - If running workers remain, wait for their events under the Patience Protocol. If only external blockers remain, report the concrete blocker and resume condition to the user.

4. **Review and accept**
   - Inspect `git status --short`, relevant diffs, and the worker report. A worker's `done` means ready for acceptance.
   - Resolve material review comments before expensive acceptance checks. Freeze the candidate by commit or working-tree/artifact fingerprint; later changes invalidate affected receipts.
   - Verify the assigned checks and evidence. Use focused independent review when risk warrants it; give the reviewer a stable candidate and specific questions. Independently rerun critical checks when high risk or unreliable evidence warrants it; otherwise reuse receipts. Avoid duplicate routine validation or screenshot inspection.
   - Confirm documentation and the Deploy Gate. Commit/push each accepted slice when authorized; verify the intended remote branch matches the delivered commit.
   - Record pending group acceptance explicitly. A feature-branch push does not establish release readiness.
   - Confirm a clean tree, accounting for preserved user changes, before the next slice on that checkout. This applies equally when reusing a worker.

5. **Finish**
   - Complete required group acceptance on the final integrated inputs. Reconcile every acceptance criterion, outstanding check, and authorized exception before declaring delivery.
   - Summarize commits, validation, deploys, deferred work, and blockers. Update/close tracker items only as authorized. Leave the repo clean or explain exactly why not.
   - For a necessary session continuation, preserve a compact handoff at a safe boundary. Use a configured handoff skill only when needed; do not replay full histories or stop authorized delivery merely to create a handoff.

## Validation Schedule

Assign coverage and ownership before implementation:

- **Per slice:** smallest checks covering changed behavior and material risks, including essential contract feedback. Prefer one representative browser unless the change or repo rules require more.
- **Per feature group:** one named owner runs required broad suites, cross-browser, packaging, generated-output, offline/export, and representative visual checks against stable integrated inputs. Include only relevant checks. Reuse an implementation worker; do not add a worker solely to monitor commands.
- **Before delivery/deploy:** all required gates pass or have an explicitly authorized exception. Do not silently move or weaken previously required per-slice gates.

Reuse valid evidence before scheduling another run. A passing broad suite can satisfy included focused checks when its receipt identifies those checks and the tested inputs are still valid. Extract the evidence rather than rerunning solely to obtain separate counts or receipts.

A receipt must identify commands/checks, exit status/result, tested code and relevant dependency/configuration/generated-input identities, and log/artifact paths. A commit alone is insufficient for tests of modified or untracked files. Preserve failures when aggregating commands.

Carry receipts forward only when intervening changes cannot affect their results; otherwise rerun affected checks. Across repositories, freeze shared schemas/artifacts before consumer validation and record both sides' versions. One broad run is a target, not a guarantee: fix failures and repeat affected or broader coverage as the risk requires.

Prefer existing repo validation scripts. If needed, use a small task-local runner that records commands, inputs, statuses, and logs and propagates failures. Keep full logs on disk and return a compact result with relevant failure excerpts. Avoid a generic validation framework.

Keep required automated visual coverage. Assign representative human/model screenshot inspection to one owner; inspect additional images for a concrete concern. Reviewers can request additional evidence without routinely repeating the worker's inspection.

## Patience Protocol

Prefer native completion notifications and interruptible waits, normally 5–10 minutes when higher-priority instructions and tool limits permit. After a shorter timeout, resume waiting unless a new event or a due checkpoint justifies action. A user update does not require another worker status request.

Long commands have one monitor: their owning worker or an explicitly assigned completion-notifying runner. Do not independently poll the same process. Dependency-paused workers have ended their turns and need no monitor or heartbeat.

If session instructions force frequent wake-ups or user updates, disclose that limitation once and perform only the required work. This skill cannot change the controlling runtime's cadence or guarantee token savings.

Inspect liveness only after an expected checkpoint is missed or an operation's recorded check time arrives. Read enough to resolve uncertainty. A timeout, stale checkpoint, or generic running status alone proves neither progress nor a stall.

Before replacing an apparently stalled worker:

1. Exclude an intentional dependency pause and check for recent checkpoint/diff movement or an explained long operation.
2. Outside an explained operation, allow two missed active-work checkpoint intervals before treating silence as a suspected stall.
3. Send one non-interrupting status request and allow at least five minutes for a response, using waits permitted by the runtime.
4. Inspect the checkpoint, existing changes, command status, and receipts. Replace only if evidence still supports a stall. Stop the old writer and resolve owned commands before transferring its checkout and unfinished work.

Unsafe/conflicting activity or an explicit user stop may require immediate intervention. Preserve completed work; silence alone is not permission to redo it.

## Deploy Gate and Escalation

Classify each slice before implementation:

- `deploy-required`: live proof is required; proceed only within existing authorization.
- `deploy-if-safe`: deploy if authorized, reachable, and low risk.
- `defer-deploy`: record why validation is sufficient for now and the follow-up.
- `no-deploy`: no deployment needed.

Workers return blockers to the supervisor. Escalate to the user only for a decision, access, or authorization the supervisor cannot resolve within scope. Stop affected work for unexplained conflicting user changes, conflicting acceptance criteria, missing required access/targets, unauthorized effects, or failures whose risk cannot be isolated.

If a slice is too broad, revise its boundaries with the supervisor while preserving completed work and acceptance coverage. Needing another commit does not by itself require user intervention.
