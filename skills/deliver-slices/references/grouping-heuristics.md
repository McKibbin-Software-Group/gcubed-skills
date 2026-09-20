# Grouping Heuristics

Load this when the worklist is large, mixed, or dependency order is unclear.

## Slice Size

A good slice:

- can be understood from one compact packet
- has one primary outcome and coherent ownership
- has clear validation and a reviewable diff
- can be committed independently after its assigned gate
- leaves the product in a better state, with release readiness stated accurately

Split unrelated outcomes, deploy targets, validation, or risk owners.

Merge tasks with the same root cause, files, and validation when separate slices would create churn without useful review boundaries. Keep multiple reviewable commits where useful; commit boundaries need not be worker-session boundaries.

## Ordering

Prefer this order:

1. Safety, secrets, data loss, broken deploy, or broken CI.
2. Reproduction and diagnostics that unblock later slices.
3. Contract/schema/API changes needed by multiple tasks.
4. Core behavior fixes.
5. UI/docs/ergonomics built on stable behavior.
6. Cleanup after behavior works.
7. Long soak, deploy, or operational follow-up.

Move a slice earlier when it reduces uncertainty for later work. Move it later when it has broad blast radius but no current blocker.

## Grouping and Readiness

Group by shared root cause, ownership, user workflow, deploy target, docs, dependency, fixture, or validation. Do not group merely by issue number.

Separate a slice's local implementation checks from acceptance requiring another slice's frozen output. Schedule that acceptance when the dependency is ready; avoid launching a worker just to wait.

Parallelize only work that can make useful progress with accepted inputs and isolated write/test outputs. Record integration order before launching writers.

Reuse a worker across closely related slices when retained context helps, subject to each slice's acceptance and clean-tree gate. Use fresh context for unrelated scope or when accumulated context impedes work.

## Context and Escalation

Keep the worklist and receipt index in one ledger. Packets should reference exact sections/symbols and accepted versions; avoid full documents or bare paths that require rediscovering the assignment.

Adjust grouping and routine ownership within existing authorization. Escalate when the change requires new access, unsafe or unauthorized effects, changed acceptance criteria, or departure from an explicit user/repo branch policy.
