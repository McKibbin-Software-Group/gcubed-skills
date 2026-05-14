# Next Steps

Last updated: 2026-05-14

## Immediate Pickup

1. Review the current diff, especially `scripts/install-project.sh`, `README.md`, and this new `docs/` baseline.
2. Decide whether the README removal of the old "First Push" section should stay.
3. Run `scripts/install-project.sh` in a real devcontainer or Codespace and inspect the generated packet.
4. Commit the installer and project-memory baseline once reviewed.

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
test -f "$tmpdir/.codex-agent-tooling/project-agents-merge.md"
```

## Context Needed Before Starting

- Confirm whether the target is global install behavior, project install behavior, or skill contents.
- Check `git status --short` because this repo often has user edits in progress.

## Blockers

- None known.

## Good Stopping Point

The install scripts pass validation, docs reflect current behavior, and the user has reviewed the merge-packet workflow before commit.
