# Current Status

Last updated: 2026-05-14

## Working State

- The repo has a global install script for user-level setup.
- The repo has a project install script for repo-local/devcontainer setup.
- Existing `AGENTS.md` files are not rewritten blindly; install scripts create merge packets for review-first Codex merges.
- The `project-memory` skill and templates are stored in-repo under `skills/project-memory/`.

## Recent Changes

- Added `scripts/install-project.sh` to install `project-memory` into a target repo's `.agents/skills/project-memory`.
- Updated `README.md` with project install guidance.
- Fixed ShellCheck `SC2155` in `scripts/install.sh` by splitting declaration and assignment for `backup`.
- Added this project memory baseline: root `AGENTS.md`, `docs/`, ADR, and AI handoff.

## Known Risks / Gaps

- `scripts/install-project.sh` has been tested in temporary Git repos, not yet in a real Codespace/devcontainer.
- There is no automated test harness beyond ShellCheck, bash syntax checks, and temporary-directory smoke tests.
- `scripts/sync-from-local.sh` intentionally replaces the in-repo skill from a local install; use it carefully and review diffs.
- `date -Iseconds` assumes GNU date, which is suitable for the current WSL/Linux target but may not be portable to macOS without adjustment.

## Last Validation

- Date: 2026-05-14
- Commands run:

```bash
shellcheck scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
bash -n scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
```

- Result: passed.
- Additional checks: temporary Git repos covered missing `AGENTS.md`, existing `AGENTS.md`, repeated project install/backups, `PROJECT_ROOT` pointing at a nested subdirectory, and a final project-install smoke test after docs were added.
- Gaps: no real devcontainer/Codespace run yet.

## Open Questions

- Should `.codex-agent-tooling/project-agents-merge.md` be committed in target projects or treated as temporary working state?
- Should `scripts/install-project.sh` gain flags such as `--packet-only`, `--yes`, or `--target` later?
- Should this repo add a small shell smoke-test script to preserve installer behavior?
