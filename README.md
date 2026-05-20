# AshieSlashy Skills

Portable Codex skills and setup guidance.

## Quick Start

Install the collection with the Skills CLI:

```bash
npx skills@latest add ashieslashy/skills
```

When prompted, select all AshieSlashy skills unless you already know which ones you do not want. Keep `setup-ashieslashy-skills` selected if you want the `$setup-ashieslashy-skills` setup step. Also choose the install scope there: project scope for one repo, or global scope for your user-wide Codex setup.

After installation, restart Codex or start a new Codex thread so the newly installed setup skill is available. Then run:

```text
$setup-ashieslashy-skills
```

The setup skill does not install, select, enable, disable, or enumerate skills. The Skills CLI already owns that. Setup only proposes Ashie's Architect methodology for the relevant `AGENTS.md`, includes `$project-memory` methodology guidance when that skill is installed in the same active scope, preserves existing instructions, and shows a summary and diff before writing.

After setup writes `AGENTS.md`, restart Codex or start a new Codex thread again so the updated instructions are loaded.

## Skills

- `$setup-ashieslashy-skills` (`skills/setup-ashieslashy-skills/`): add or refresh Ashie's Architect methodology in a global, project, devcontainer, or Codespace `AGENTS.md`; preserves existing instructions and includes project-memory guidance when `$project-memory` is installed in the same active scope.
- `$project-memory` (`skills/project-memory/`): create and maintain lightweight repo memory docs under `docs/`, plus concise root `AGENTS.md` guidance when missing or explicitly approved.

## Setup Notes

For a project, devcontainer, or Codespace, install the skills into the project scope, restart Codex, then run `$setup-ashieslashy-skills` from inside the target repo.

Project setup should preserve repo-local instructions and avoid importing unrelated personal defaults. `$project-memory` guidance is included when that skill is installed in the same active scope; it suggests the docs baseline, but setup does not create project memory docs.

For personal or global Codex instructions, install globally if desired, then run:

```text
$setup-ashieslashy-skills
```

To skip the Architect methodology, do not run setup. Installed skills still work from the scope selected during `npx skills`.

If `$project-memory` is installed in the same active scope, setup includes its guidance. If you do not want that guidance, do not install `$project-memory` for that scope.

## Managing Skills

### Add

```bash
npx skills@latest add ashieslashy/skills
```

During `npx skills add`, select the AshieSlashy skills you want installed in that scope. Setup does not provide a second opt-out for installed skills. Previously installed unrelated skills are retained. To exclude a skill that is already installed, remove it with `npx skills remove`.

### Upgrade

To upgrade installed skills, use the Skills CLI:

```bash
npx skills update
```

Bare `npx skills update` prompts for scope. Use the CLI's project/global flags when you want to update a specific scope non-interactively.

You can also rerun the add command for this collection:

```bash
npx skills@latest add ashieslashy/skills
```

Previously installed AshieSlashy skills in that scope are upgrade candidates when the Skills CLI has an update path for them. `$setup-ashieslashy-skills` does not upgrade skill files; it refreshes the `AGENTS.md` guidance it owns.

After adding or upgrading skills, restart Codex or start a new Codex thread. Rerun `$setup-ashieslashy-skills` if the bundled Architect or project-memory guidance changed, or if the `$project-memory` install state changed in the same active scope. It should report when no `AGENTS.md` changes are needed and should preserve unrelated instructions from other skill collections.

### Remove

Use the Skills CLI to remove skills:

```bash
# Interactive removal
npx skills remove

# Remove one skill
npx skills remove project-memory

# Remove from global scope
npx skills remove --global project-memory

# Remove from a specific agent
npx skills remove project-memory --agent codex
```

After removing skills, restart Codex or start a new Codex thread. If removing `$project-memory` changes what should appear in `AGENTS.md`, rerun `$setup-ashieslashy-skills` to refresh the guidance before removing `setup-ashieslashy-skills` itself. If setup has already been removed, reinstall it or edit `AGENTS.md` manually.
