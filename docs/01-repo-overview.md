# Repo Overview

## Purpose

This repository stores portable Codex agent tooling:

- reusable skills
- global `AGENTS.md` snippets
- install scripts for global and project-local setup
- lightweight project memory docs

The primary user is the repository owner/operator installing the same Codex workflow across WSL, devcontainers, Codespaces, and local projects.

## Architecture

The repo is file-and-script based. There is no package manager or runtime application.

- `skills/project-memory/` is the canonical skill source.
- `global/` contains global/user-level instruction material.
- `scripts/install.sh` copies the skill to a user skills directory and prepares a review-first global `AGENTS.md` merge when a global file already exists.
- `scripts/install-project.sh` copies the skill into a target repo's `.agents/skills/` and writes a review-first project `AGENTS.md` merge packet.
- `scripts/sync-from-local.sh` pulls the locally installed skill and global instructions back into this repo for review and commit.

## Directory Map

- `skills/project-memory/`: skill instructions, OpenAI metadata, and docs templates.
- `global/AGENTS.md.example`: recommended full global `AGENTS.md`.
- `global/project-memory-section.md`: managed project-memory methodology block.
- `scripts/`: install and sync scripts.
- `docs/`: durable project docs and AI handoff notes.

## Common Workflows

### Global Install

```bash
./scripts/install.sh
```

Override destinations when needed:

```bash
CODEX_SKILLS_DIR="$HOME/.codex/skills" \
CODEX_GLOBAL_AGENTS="$HOME/.codex/AGENTS.md" \
./scripts/install.sh
```

### Project / Devcontainer Install

Run from inside the target project, or set `PROJECT_ROOT`:

```bash
./path/to/codex-agent-tooling/scripts/install-project.sh
PROJECT_ROOT="/workspaces/my-project" ./scripts/install-project.sh
```

### Validate Scripts

```bash
shellcheck scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
bash -n scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
```

### Sync From Local Install

```bash
./scripts/sync-from-local.sh
```

Review the resulting diff before committing.

## Ownership Boundaries

- Scripts own file placement, backups, and merge packet generation.
- Codex/human review owns semantic merges of `AGENTS.md` prose.
- `global/` owns personal/global instruction source material.
- `skills/project-memory/assets/templates/` owns starter docs used by the skill.
- `docs/` owns durable repo state and decisions.
