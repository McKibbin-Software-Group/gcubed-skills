# AshieSlashy Skills

Portable Codex skills and setup guidance.

## Recommended Setup

Use the Skills CLI for installation.

Scope rules:

- For normal local use, install `$setup-ashieslashy-skills` globally once so Architect methodology lives in your durable personal Codex instructions.
- Install `$project-memory` separately inside each repo that should maintain project docs. Project memory is intentionally repo-local.
- Install `$setup-ashieslashy-skills` into a project only when global setup is unavailable or not durable, such as Docker, devcontainer, Codespace, remote workspace, or other environments where the agent cannot reach your true global Codex scope.
- There is no special devcontainer or Codespace installer. Use the Skills CLI project scope from inside that environment.

Install the Architect setup skill globally:

```bash
npx skills@latest add ashieslashy/skills --skill setup-ashieslashy-skills --global
```

After installation, restart Codex or start a new Codex thread so the setup skill is available. Then run:

```text
$setup-ashieslashy-skills set up my global Codex AGENTS.md
```

Review and approve the proposed global `AGENTS.md` diff, then restart Codex or start a new thread again so the updated instructions are loaded.

For each repo that should use project memory, install `$project-memory` in that repo:

```bash
cd my-repo
npx skills@latest add ashieslashy/skills --skill project-memory
```

Restart Codex or start a new Codex thread in that repo. Project memory is now available there. On a normal workstation where Architect guidance already lives in your global `AGENTS.md`, you do not need to run `$setup-ashieslashy-skills` in every repo. Run it for a repo only when you want to create or refresh that repo's local `AGENTS.md`, such as for devcontainers, Codespaces, remote workspaces, repo-specific Architect guidance, or local project-memory guidance:

```text
$setup-ashieslashy-skills update this repo's local AGENTS.md
```

## How Setup Fits

The setup skill does not install, select, enable, disable, or enumerate skills. The Skills CLI already owns that. Setup only proposes Ashie's Architect methodology for a target `AGENTS.md`, includes `$project-memory` methodology guidance when that skill is installed for that target scope, preserves existing instructions, and shows a summary and diff before writing.

Run setup after the setup skill is installed in the scope you want to configure. Run it again only when refreshing Architect guidance or intentionally changing a target `AGENTS.md`. Do not use setup as an installer; use `npx skills` for that.

## Repo-Local Architect Setup

Installing Architect setup into a specific repo is a special case. Use it when Codex is running inside Docker, a devcontainer, Codespace, remote workspace, or similar environment where the global scope is ephemeral or cannot reach your true global Codex instructions. It is also valid when a repo intentionally needs to carry its own Architect instructions in its local `AGENTS.md`, independent of your global Codex instructions.

```bash
cd my-repo
npx skills@latest add ashieslashy/skills --skill setup-ashieslashy-skills
```

Choose project/local scope if prompted. Restart Codex or start a new Codex thread in that repo so the skill is available, then run:

```text
$setup-ashieslashy-skills
```

Review and approve the proposed repo-local `AGENTS.md` diff, then restart Codex or start a new thread again so the updated repo instructions are loaded.

## Skills

- `$setup-ashieslashy-skills` (`skills/setup-ashieslashy-skills/`): add or refresh Ashie's Architect methodology in a global, project, devcontainer, or Codespace `AGENTS.md`; preserves existing instructions and includes project-memory guidance when `$project-memory` is installed for the target `AGENTS.md` scope.
- `$project-memory` (`skills/project-memory/`): create and maintain lightweight repo memory docs under `docs/`, plus concise root `AGENTS.md` guidance when missing or explicitly approved.

## Scope Notes

Project setup should preserve repo-local instructions and avoid importing unrelated personal defaults. `$project-memory` guidance is included when that skill is installed for the target repo scope; it suggests the docs baseline, but setup does not create project memory docs.

Project, devcontainer, and Codespace targets use project-scope skill state. Globally installed `$setup-ashieslashy-skills` can still configure a local project `AGENTS.md`; when it does, setup should use the target repo's local `$project-memory` state, not the global setup skill's sibling directory.

To skip the Architect methodology, do not run setup. Installed skills still work from the scope selected during `npx skills`.

If `$project-memory` is installed for the target `AGENTS.md` scope, setup includes its guidance. If you do not want that guidance, do not install `$project-memory` for that scope.

If `skills-lock.json` says a skill is installed but the matching `.agents/skills/<skill>/` directory is missing, treat that as an install inconsistency and rerun the Skills CLI for that scope.

## Managing Skills

### Add

```bash
npx skills@latest add ashieslashy/skills
```

During `npx skills add`, select the AshieSlashy skills you want installed in that scope. Setup does not provide a second opt-out for installed skills. Previously installed unrelated skills are retained. To exclude a skill that is already installed, remove it with `npx skills remove`.

To install all AshieSlashy skills in the selected scope without using the skill picker:

```bash
npx skills@latest add ashieslashy/skills --skill '*'
```

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

After adding or upgrading skills, restart Codex or start a new Codex thread. Rerun `$setup-ashieslashy-skills` if the bundled Architect or project-memory guidance changed, or if the `$project-memory` install state changed for the target `AGENTS.md` scope. It should report when no `AGENTS.md` changes are needed and should preserve unrelated instructions from other skill collections.

Common case: global Architect with repo-local project memory:

```bash
# Update the global Architect setup skill.
npx skills update --global

# Update project memory inside each repo that uses it.
cd my-repo
npx skills update
```

Restart Codex or start a new thread after each scope update. Rerun `$setup-ashieslashy-skills set up my global Codex AGENTS.md` if the global Architect guidance changed. Inside a repo, run `$project-memory` when that repo's docs need refreshing; global setup does not refresh repo docs.

Repo-local case: project Architect with project memory:

```bash
cd my-repo
npx skills update
```

Restart Codex or start a new thread in that repo. Rerun `$setup-ashieslashy-skills` if the repo-local Architect or project-memory guidance in `AGENTS.md` changed. Run `$project-memory` when the repo's docs need refreshing.

### Remove

Use the Skills CLI to remove skills:

```bash
# Interactive removal
npx skills remove

# Remove one skill
npx skills remove project-memory

# Remove from global scope
npx skills remove --global project-memory
```

After removing skills, restart Codex or start a new Codex thread. If removing `$project-memory` changes what should appear in `AGENTS.md`, rerun `$setup-ashieslashy-skills` to refresh the guidance before removing `setup-ashieslashy-skills` itself. If setup has already been removed, reinstall it or edit `AGENTS.md` manually.
