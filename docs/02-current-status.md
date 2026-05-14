# Current Status

Last updated: 2026-05-14

## Working State

- The repo is pivoting to a skills collection distribution model: `npx skills@latest add ashieslashy/skills`.
- The repo has a `project-memory` skill for docs memory.
- The repo has a `setup-agents-md` skill for post-install AGENTS.md skill-hook wiring.
- The repo has an `ashie-agents-methodology` skill for optional Architect methodology preview/replace/merge.
- The repo keeps manual global/project install scripts as fallback helpers.
- Existing `AGENTS.md` files are not rewritten blindly; install scripts create skill-wiring packets for review-first Codex merges.
- The `project-memory` skill and templates are stored in-repo under `skills/project-memory/`.

## Recent Changes

- Added `scripts/install-project.sh` to install `project-memory` into a target repo's `.agents/skills/project-memory`.
- Updated `README.md` with project install guidance.
- Fixed ShellCheck `SC2155` in `scripts/install.sh` by splitting declaration and assignment for `backup`.
- Added this project memory baseline: root `AGENTS.md`, `docs/`, ADR, and AI handoff.
- Split post-install AGENTS behavior into `setup-agents-md` for skill hooks and `ashie-agents-methodology` for optional Architect methodology adoption.
- Moved the project-memory methodology snippet into `skills/project-memory/assets/snippets/`.
- Reframed scripts as manual fallbacks rather than the primary install UX.
- Clarified the boundary: `$project-memory` owns docs memory; `$setup-agents-md` owns skill hooks; `$ashie-agents-methodology` owns optional methodology adoption.

## Known Risks / Gaps

- `scripts/install-project.sh` has been tested in temporary Git repos, not yet in a real Codespace/devcontainer after the skills-collection pivot.
- `npx skills@latest add ashieslashy/skills` has not yet been tested against the published GitHub repo.
- There is no automated test harness beyond ShellCheck, bash syntax checks, and temporary-directory smoke tests.
- `scripts/sync-from-local.sh` intentionally replaces in-repo skills from a local install; use it carefully and review diffs.
- `date -Iseconds` assumes GNU date, which is suitable for the current WSL/Linux target but may not be portable to macOS without adjustment.

## Last Validation

- Date: 2026-05-14
- Commands run:

```bash
shellcheck scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
bash -n scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
```

- Result: passed.
- Additional checks: temporary smoke tests after the skill split covered fresh global install, existing global skill-wiring packet generation, and project install. Generated wiring outputs installed all three skills, included the skill-hooks block, and did not include the optional Architect methodology or unresolved `{{PLACEHOLDER}}` values.
- Gaps: no real devcontainer/Codespace run yet.

## Open Questions

- Should `.codex-agent-tooling/agents-md-wiring.md` be committed in target projects or treated as temporary working state?
- Should this repo add a small shell smoke-test script to preserve installer behavior?
- Should the GitHub repo be renamed from `codex-agent-tooling` to `skills` so the final install command is exactly `npx skills@latest add ashieslashy/skills`?
