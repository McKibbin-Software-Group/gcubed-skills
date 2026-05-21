# AshieSlashy Skills

Portable Codex skills and setup guidance.

## Skills

- `$setup-ashieslashy-skills` (`skills/setup-ashieslashy-skills/`): add or refresh Ashie's Architect methodology in a global, project, devcontainer, or Codespace `AGENTS.md` with a review-first diff.
- `$project-memory` (`skills/project-memory/`): create and maintain lightweight repo memory docs under `docs/`, plus concise root `AGENTS.md` guidance when missing or explicitly approved.
- `$skill-capture` (`skills/skill-capture/`): review completed work, debugging sessions, or delivery lessons and propose whether they belong in docs, an existing skill patch, a new skill, or an upstream packet for a shared collection.
- `$review-synthesis` (`skills/review-synthesis/`): coordinate explicitly requested multi-agent or multi-perspective reviews, then synthesize findings into one integrated review.

## Install

Use the Skills CLI for installation.

Recommended usage:

- Install `$setup-ashieslashy-skills` globally once for normal local use, then run it so Architect methodology lives in your durable personal Codex instructions.
- If global Codex instructions are unavailable or not durable, such as Docker, devcontainer, Codespace, remote workspace, or similar environments, install `$setup-ashieslashy-skills` at project scope instead and run it there.
- Install `$project-memory`, `$skill-capture`, and `$review-synthesis` at project scope in each repo where you want those capabilities.

### 1. Global Architect Setup

Install the Architect setup skill globally:

```bash
npx skills@latest add ashieslashy/skills --skill setup-ashieslashy-skills --global
```

Restart Codex or start a new thread so the setup skill is available. Then run:

```text
$setup-ashieslashy-skills set up my global Codex AGENTS.md
```

Review and approve the proposed global `AGENTS.md` diff, then restart Codex or start a new thread again so the updated instructions are loaded.

### 2. Project Skills

From inside each repo, install the project-level skills you want. Use the picker to choose interactively:

```bash
cd my-repo
npx skills@latest add ashieslashy/skills
```

During `npx skills add`, select the AshieSlashy skills you want installed in that scope. Previously installed unrelated skills are retained. To exclude a skill that is already installed, remove it with `npx skills remove`.

To install with explicit CLI flags instead of the picker, run any of these commands. Run all three for the usual project set:

```bash
npx skills@latest add ashieslashy/skills --skill project-memory
npx skills@latest add ashieslashy/skills --skill skill-capture
npx skills@latest add ashieslashy/skills --skill review-synthesis
```

Those three skills are the common project install. `$setup-ashieslashy-skills` is normally installed globally, because it configures your operating guidance rather than a repo workflow.

To mirror the whole AshieSlashy collection into a repo, including `$setup-ashieslashy-skills`, use:

```bash
npx skills@latest add ashieslashy/skills --skill '*'
```

Use the whole-collection install mainly for devcontainers, Codespaces, remote workspaces, or repos that intentionally carry their own Architect setup.

Install `$project-memory` in repos that should maintain project docs. Install `$skill-capture` where you want agents to turn delivery lessons into review-first local or upstream skill proposals. Install `$review-synthesis` where you want coordinated review panels for code, docs, designs, plans, or delivery work.

Restart Codex or start a new Codex thread after adding project skills.

### 3. Project-Local Architect Setup

On a normal workstation where Architect guidance already lives in your global `AGENTS.md`, you do not need to run `$setup-ashieslashy-skills` in every repo.

Install and run `$setup-ashieslashy-skills` at project scope only when global setup is unavailable, not durable, or intentionally not enough for that repo:

```bash
cd my-repo
npx skills@latest add ashieslashy/skills --skill setup-ashieslashy-skills
```

Restart Codex or start a new thread in that repo. Then run:

```text
$setup-ashieslashy-skills
```

Review and approve the proposed repo-local `AGENTS.md` diff, then restart Codex or start a new thread again so the updated repo instructions are loaded.

## How Setup Fits

Most skills in this collection are used on demand inside a repo: `$project-memory` for repo docs, `$skill-capture` for reusable delivery lessons, and `$review-synthesis` for coordinated reviews. `$setup-ashieslashy-skills` is different: it configures the `AGENTS.md` instructions that shape how Codex works in a scope.

The setup skill does not install, select, enable, disable, or enumerate skills. The Skills CLI owns that. Setup only proposes Ashie's Architect methodology for a target `AGENTS.md`, preserves existing instructions, and shows a summary and diff before writing.

Run setup after the setup skill is installed in the scope you want to configure. Run it again only when refreshing Architect guidance or intentionally changing a target `AGENTS.md`. Do not use setup as an installer; use `npx skills` for that.

## Scope Notes

Install scope controls where a skill is available. Use global scope for durable personal operating guidance; use project scope for skills that should travel with, or only apply inside, a specific repo.

Project, devcontainer, and Codespace installs use project-scope skill state. A globally installed `$setup-ashieslashy-skills` can still configure a local project `AGENTS.md`, but the proposed file should reflect that target repo's local state and instructions.

To skip the Architect methodology, do not run setup. Installed skills still work from the scope selected during `npx skills`.

If `$project-memory` is installed for the target `AGENTS.md` scope, setup will propose including its methodology guidance in that `AGENTS.md`. That guidance tells future agents how to maintain the docs baseline; it does not create or update those docs by itself.

If `skills-lock.json` says a skill is installed but the matching `.agents/skills/<skill>/` directory is missing, treat that as an install inconsistency and rerun the Skills CLI for that scope.

## Managing Skills

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

After adding or upgrading skills, restart Codex or start a new Codex thread. Rerun `$setup-ashieslashy-skills` only when the Architect guidance for a configured `AGENTS.md` might need refreshing. Project workflow skills are used on demand after they are upgraded.

Common case: global Architect with repo-local project skills:

```bash
# Update global skills, including the Architect setup skill.
npx skills update --global

# Update project skills inside each repo that uses them.
cd my-repo
# Choose project scope if prompted.
npx skills update
```

Restart Codex or start a new thread after each scope update. Rerun `$setup-ashieslashy-skills set up my global Codex AGENTS.md` if the global Architect guidance changed. Inside a repo, use whichever project skill matches the work: `$project-memory`, `$skill-capture`, or `$review-synthesis`.

Repo-local case: project Architect with project skills:

```bash
cd my-repo
# Choose project scope if prompted.
npx skills update
```

Restart Codex or start a new thread in that repo. Rerun `$setup-ashieslashy-skills` if the repo-local Architect guidance changed. Use the other installed skills on demand.

### Remove

Use the Skills CLI to remove skills:

```bash
# Interactive removal
npx skills remove

# Remove one skill
npx skills remove project-memory
npx skills remove skill-capture
npx skills remove review-synthesis

# Remove from global scope
npx skills remove --global setup-ashieslashy-skills
```

After removing skills, restart Codex or start a new Codex thread. If removing a skill changes what should appear in a configured `AGENTS.md`, rerun `$setup-ashieslashy-skills` before removing the setup skill itself. If setup has already been removed, reinstall it or edit `AGENTS.md` manually.
