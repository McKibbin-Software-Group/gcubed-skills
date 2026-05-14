# Codex Agent Tooling

Portable personal Codex setup for:

- reusable skills
- global `AGENTS.md` snippets
- safe installation on new machines

## Contents

- `skills/project-memory/`: Codex skill for creating and maintaining concise per-project documentation memory.
- `global/AGENTS.md.example`: Example full global `AGENTS.md`.
- `global/project-memory-section.md`: Managed global `AGENTS.md` section that points Codex at `$project-memory`.
- `scripts/install.sh`: Install/update the skill and prepare a safe global `AGENTS.md` merge when needed.
- `scripts/install-project.sh`: Install/update project-local skills and prepare a safe project `AGENTS.md` merge.
- `scripts/sync-from-local.sh`: Refresh this repo from the currently installed local files.

## Install On A Machine

From a clone of this repo:

```bash
./scripts/install.sh
```

Defaults:

- skills install to `$HOME/.agents/skills`
- global instructions update `$HOME/.codex/AGENTS.md`

Override paths when needed:

```bash
CODEX_SKILLS_DIR="$HOME/.codex/skills" \
CODEX_GLOBAL_AGENTS="$HOME/.codex/AGENTS.md" \
./scripts/install.sh
```

The installer:

- installs `skills/project-memory`
- creates `~/.codex/AGENTS.md` if missing
- backs up an existing installed skill before replacing it
- leaves an existing global `AGENTS.md` unchanged
- writes a temporary Codex merge packet when global `AGENTS.md` already exists

When a merge packet is created, ask Codex to use it to propose a sane merge. Codex should show you the summary and diff first, then write the merged file only after you approve it.

Restart Codex after installing or updating skills or global instructions.

## Install Into A Project

Use this from a devcontainer, Codespace, or any repository where you want the skill and `AGENTS.md` guidance to live with the project:

```bash
./scripts/install-project.sh
```

Run it from inside the target project. If this tooling repo lives elsewhere, call the script by path from the target project. By default it targets the Git repository containing your current working directory. Override the target when needed:

```bash
PROJECT_ROOT="/workspaces/my-project" ./scripts/install-project.sh
```

The project installer:

- installs `skills/project-memory` to `$PROJECT_ROOT/.agents/skills/project-memory`
- leaves `$PROJECT_ROOT/AGENTS.md` unchanged
- writes `$PROJECT_ROOT/.codex-agent-tooling/project-agents-merge.md`
- prints a Codex prompt for a review-first project `AGENTS.md` merge

This is the preferred mode for ephemeral devcontainers when you want the setup to survive container rebuilds without changing mounts. Ask Codex to use the merge packet, review the proposed summary and diff, and approve before it writes `AGENTS.md`.

## Install Skill Only

Codex can install the skill directly from GitHub, but this does not update global `AGENTS.md`:

```bash
install-skill-from-github.py --repo YOUR_GITHUB_USER/codex-agent-tooling --path skills/project-memory
```

Use `scripts/install.sh` when you want both the skill and global methodology block.

## Refresh This Repo From Local Machine

After editing your live skill or global `AGENTS.md`:

```bash
./scripts/sync-from-local.sh
```

Then review the diff, commit, and push.
