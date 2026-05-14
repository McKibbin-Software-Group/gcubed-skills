# Repo Overview

## Purpose

This repository stores portable Codex skills:

- reusable skills
- review-first AGENTS.md skill wiring
- optional Architect methodology adoption
- lightweight project memory docs

The primary user is the repository owner/operator installing the same Codex workflow across WSL, devcontainers, Codespaces, and local projects. The intended distribution model is `npx skills@latest add ashieslashy/skills`.

## Architecture

The repo is file-and-script based. There is no package manager or runtime application.

- `skills/project-memory/` owns the docs memory workflow, docs templates, and project-memory methodology snippet.
- `skills/setup-agents-md/` owns post-install skill-hook wiring in global/project/devcontainer `AGENTS.md` files.
- `skills/ashie-agents-methodology/` owns optional preview/replace/merge of the Architect AGENTS methodology.
- `scripts/install.sh` and `scripts/install-project.sh` are optional/manual fallbacks for environments without the skills CLI.
- `scripts/sync-from-local.sh` pulls locally installed skills back into this repo for review and commit.

## Directory Map

- `skills/project-memory/`: docs memory skill, OpenAI metadata, docs templates, and snippets.
- `skills/setup-agents-md/`: skill-hook wiring skill, templates, and packet assets.
- `skills/ashie-agents-methodology/`: optional Architect methodology skill, template, and adoption packet.
- `scripts/`: optional/manual install and sync scripts.
- `docs/`: durable project docs and AI handoff notes.

## Common Workflows

### Skills CLI Install

```bash
npx skills@latest add ashieslashy/skills
```

Then ask Codex to run `$setup-agents-md`. Run `$ashie-agents-methodology` only if you want Ashie's opinionated AGENTS.md methodology.

### Manual Global Install

```bash
./scripts/install.sh
```

### Manual Project / Devcontainer Install

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

Review the resulting diff before committing. Do not sync a live global `AGENTS.md` into this repo blindly.

## Ownership Boundaries

- Skills own the primary workflows and reusable assets.
- Scripts own fallback file placement, backups, and merge packet generation.
- Codex/human review owns semantic merges of `AGENTS.md` prose.
- `skills/setup-agents-md/assets/templates/` owns skill-hook source material.
- `skills/ashie-agents-methodology/assets/templates/` owns optional Architect methodology source material.
- `skills/project-memory/assets/templates/` owns starter docs used by the project-memory skill.
- `skills/project-memory/assets/snippets/` owns reusable project-memory instruction snippets.
- `docs/` owns durable repo state and decisions.
