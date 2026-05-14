# Next Steps

Last updated: 2026-05-14

## Immediate Pickup

1. Review the current diff, especially `skills/setup-agents-md`, `skills/ashie-agents-methodology`, `skills/project-memory/SKILL.md`, `README.md`, and the fallback scripts.
2. Run the validation commands below.
3. Smoke-test `scripts/install.sh` and `scripts/install-project.sh` after the pivot.
4. Test `npx skills@latest add ashieslashy/skills` once the repo name/publish target is ready.
5. Commit the skills-collection pivot once reviewed.

## Validation To Run

```bash
shellcheck scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
bash -n scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
```

Optional smoke test:

```bash
tmpdir=$(mktemp -d /tmp/project-install-smoke.XXXXXX)
git -C "$tmpdir" init -q
PROJECT_ROOT="$tmpdir" scripts/install-project.sh
test -f "$tmpdir/.agents/skills/project-memory/SKILL.md"
test -f "$tmpdir/.agents/skills/setup-agents-md/SKILL.md"
test -f "$tmpdir/.agents/skills/ashie-agents-methodology/SKILL.md"
test -f "$tmpdir/.codex-agent-tooling/agents-md-wiring.md"
```

## Context Needed Before Starting

- Confirm whether the target is skills CLI behavior, fallback script behavior, or skill contents.
- Check `git status --short` because this repo often has user edits in progress.

## Blockers

- None known.

## Good Stopping Point

The install scripts pass validation, docs reflect current behavior, and the user has reviewed the merge-packet workflow before commit.
