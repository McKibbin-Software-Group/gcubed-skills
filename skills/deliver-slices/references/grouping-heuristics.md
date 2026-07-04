# Grouping Heuristics

Load this when the worklist is large, mixed, or dependency order is unclear.

## Slice Size

A good slice:

- can be understood by a fresh child from one packet
- has one primary outcome
- touches a coherent ownership area
- has clear validation
- can be committed and pushed alone
- leaves the product in a better deployable state

Split when a task needs different deploy targets, unrelated files, unrelated validation, or different risk owners.

Merge when several tasks share the same root cause, same files, same validation, and separate commits would create churn without useful review boundaries.

## Ordering

Prefer this order:

1. Safety, secrets, data loss, broken deploy, or broken CI.
2. Reproduction and diagnostics that unblock later slices.
3. Contract/schema/API changes needed by multiple tasks.
4. Core behavior fixes.
5. UI/docs/ergonomics built on stable behavior.
6. Cleanup after behavior works.
7. Long soak, deploy, or operational follow-up.

Move a slice earlier when it reduces uncertainty for many later tasks. Move it later when it has broad blast radius but no current blocker.

## Group By

Useful grouping axes:

- same failing test/check
- same issue root cause
- same module/package/ownership boundary
- same deploy target
- same user workflow
- same docs section
- same external dependency or hardware fixture

Avoid grouping only by issue number when implementation dependency says otherwise.

## Token Controls

- Discovery agents may summarize large issue/doc sets into tables.
- Child packets should cite paths/URLs, not copy whole issues/docs.
- Child output should report proof, not raw logs.
- Supervisor should keep a sprint ledger outside chat when slice count is high.
- Prefer exact validation command names and result status over full output.

## Escalation

Ask user before continuing when the next sensible slice needs new credentials, hardware access not already authorized, destructive migration, production deploy with unclear blast radius, or a branch/worktree strategy change.
