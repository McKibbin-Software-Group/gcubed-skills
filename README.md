# AshieSlashy Skills

Portable Codex skills and setup guidance.

The intended install path is the skills collection installer:

```bash
npx skills@latest add ashieslashy/skills
```

This assumes the GitHub repo is published or mirrored as `ashieslashy/skills`; until then, substitute the current repo slug.

After installing, wire the selected skills into the relevant `AGENTS.md`:

```text
$setup-agents-md
```

That setup skill adds or refreshes a compact skill-hooks block. It shows a summary and diff, then writes only after approval.

If you also want Ashie's opinionated Architect methodology, run that separately:

```text
$ashie-agents-methodology
```

## Skills

- `skills/project-memory/`: create and maintain lightweight repo memory docs under `docs/`.
- `skills/setup-agents-md/`: wire installed skills into global/project/devcontainer `AGENTS.md`.
- `skills/ashie-agents-methodology/`: optionally preview, replace, or intelligently merge Ashie's Architect `AGENTS.md` methodology.

## Recommended Workflow

1. Install from the skill collection:

   ```bash
   npx skills@latest add ashieslashy/skills
   ```

2. Select the skills you want, usually:

   - `project-memory`
   - `setup-agents-md`
   - `ashie-agents-methodology` if you want the optional Architect methodology

3. Ask Codex:

   ```text
   $setup-agents-md add skill hooks to this project AGENTS.md. Show me proposed changes before applying.
   ```

4. Review the proposed summary and diff.
5. Approve the write only when the proposal looks right.
6. Optionally ask Codex:

   ```text
   $ashie-agents-methodology preview how Ashie's Architect methodology would merge into this AGENTS.md.
   ```

## Project / Devcontainer Setup

For a project, devcontainer, or Codespace, install the skills into the project scope with the skills CLI, then run `$setup-agents-md` from inside the target repo.

Project setup should keep global/personal defaults out of repo-local `AGENTS.md` unless explicitly approved. Use `$project-memory` for the project docs baseline.

## Global Setup

For personal/global Codex instructions, install globally with the skills CLI if desired, then run:

```text
$setup-agents-md add skill hooks to my global Codex AGENTS.md. Show me the diff before applying.
```

To adopt Ashie's full Architect methodology globally, run:

```text
$ashie-agents-methodology merge Ashie's Architect methodology into my global Codex AGENTS.md. Preserve skill hooks and show me the diff before applying.
```

## Source Of Truth

- Skill hooks template: `skills/setup-agents-md/assets/templates/skill-hooks-section.md`
- Architect methodology template: `skills/ashie-agents-methodology/assets/templates/global-architect-agents.md`
- Project `AGENTS.md` starter: `skills/project-memory/assets/templates/AGENTS.md`
- Project-memory methodology block: `skills/project-memory/assets/snippets/project-memory-methodology.md`
- Wiring packet template: `skills/setup-agents-md/assets/merge-packets/agents-md-wiring.md`
- Methodology adoption packet template: `skills/ashie-agents-methodology/assets/merge-packets/methodology-adoption.md`

Scripts render these templates; they should not bury canonical instruction prose.

## Manual Script Fallback

The scripts are retained as manual helpers for environments where the skills CLI is not available:

```bash
./scripts/install.sh
./scripts/install-project.sh
```

They install the base skills and create review-first skill-wiring packets. The scripts are no longer the primary distribution path.

Validation:

```bash
shellcheck scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
bash -n scripts/install.sh scripts/install-project.sh scripts/sync-from-local.sh
```

## Repository Layout

- `skills/project-memory/`: docs memory skill, templates, and snippets.
- `skills/setup-agents-md/`: skill-hook wiring skill and packet assets.
- `skills/ashie-agents-methodology/`: optional Architect methodology adoption skill and assets.
- `scripts/`: optional/manual install and sync helpers.
- `docs/`: repo memory, status, roadmap, and ADRs.

## Sync From Local Machine

After editing installed local skills:

```bash
./scripts/sync-from-local.sh
```

Review the diff before committing. Do not blindly sync a live global `AGENTS.md`; update the skill assets intentionally.
