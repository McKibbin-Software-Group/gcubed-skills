# AshieSlashy Skills

Portable Codex-compatible skills and setup guidance for Ash's Architect methodology, repo memory, review synthesis, skill capture, and focused cleanup.

## Skills

- `$setup-ashieslashy-skills` (`skills/setup-ashieslashy-skills/`): bootstrap or refresh Ashie's Architect methodology in `AGENTS.md` with a review-first diff, then validate and remove itself.
- `$project-memory` (`skills/project-memory/`): create or refresh lightweight repo memory docs under `docs/`, including handoff, stale status, next steps, and concise root `AGENTS.md` guidance when missing or explicitly approved.
- `$skill-capture` (`skills/skill-capture/`): review completed work, debugging sessions, or delivery lessons and propose whether they belong in docs, an existing skill patch, a new skill, or an upstream packet for a shared collection.
- `$review-synthesis` (`skills/review-synthesis/`): coordinate explicitly requested multi-perspective reviews, using subagents only when allowed, then synthesize findings into one integrated review.
- `$code-structure-cleanup` (`skills/code-structure-cleanup/`): after a feature works, reduce duplicated mechanics, prepare focused PRs, and make agent-written code easier to maintain without changing behavior.

## When To Use Each Skill

- Use `$setup-ashieslashy-skills` when you want Architect methodology installed or refreshed in a global, project, devcontainer, Codespace, or remote-workspace `AGENTS.md`.
- Use `$project-memory` when a repo needs durable docs for current status, next steps, handoff, architecture, roadmap, or stale memory cleanup.
- Use `$skill-capture` after a repeated workflow, debugging pattern, or delivery lesson might deserve a reusable skill, skill patch, or upstream proposal.
- Use `$review-synthesis` when you want a coordinated review across perspectives such as docs, architecture, security, UX, delivery, or operations.
- Use `$code-structure-cleanup` after working behavior exists and the next useful move is a narrow cleanup pass, not new product behavior.

## Install

Use the Skills CLI for installation.

Recommended usage:

- Install `$setup-ashieslashy-skills` globally once for normal local use, then run it so Architect methodology lives in your durable personal Codex instructions. After a successful validated setup, the skill removes itself from the installed scope.
- If global Codex instructions are unavailable or not durable, such as Docker, devcontainer, Codespace, remote workspace, or similar environments, install `$setup-ashieslashy-skills` at project scope instead and run it there. It removes only itself after setup; project workflow skills stay installed.
- Install the rest of the skills at project scope in each repo where you want those capabilities.

### 1. Global Architect Setup

Install the Architect setup skill globally:

```bash
npx skills@latest add ashieslashy/skills --skill setup-ashieslashy-skills --global
```

Restart or reload Codex so the setup skill is available. Then run:

```text
$setup-ashieslashy-skills set up my global Codex AGENTS.md
```

Review the proposed global `AGENTS.md` diff or no-change report, then approve if changes are needed. The setup skill re-reads the target, writes approved content when needed, validates the result, removes only `$setup-ashieslashy-skills` from global scope, and reports what happened. Then restart or reload Codex again so the updated instructions and leaner skill inventory are loaded.

### 2. Project Skills

From inside each repo, install the project-level skills you want. Use the picker to choose interactively:

```bash
cd my-repo
npx skills@latest add ashieslashy/skills
```

During `npx skills add`, select the AshieSlashy skills you want installed in that scope. Previously installed unrelated skills are retained. To exclude a skill that is already installed, remove it with `npx skills remove`.

To install with explicit CLI flags instead of the picker, run any of these commands. Run all four for the usual project set:

```bash
npx skills@latest add ashieslashy/skills --skill project-memory
npx skills@latest add ashieslashy/skills --skill skill-capture
npx skills@latest add ashieslashy/skills --skill review-synthesis
npx skills@latest add ashieslashy/skills --skill code-structure-cleanup
```

Those four skills are the common project install. `$setup-ashieslashy-skills` is normally installed globally and temporarily, because global Architect guidance is a key deliverable of this collection and the setup skill configures your operating guidance rather than an ordinary repo workflow.

To mirror the whole AshieSlashy collection into a repo, including `$setup-ashieslashy-skills`, use:

```bash
npx skills@latest add ashieslashy/skills --skill '*'
```

Use the whole-collection install mainly for devcontainers, Codespaces, remote workspaces, or repos that intentionally carry their own Architect setup.


Restart or reload Codex after adding project skills.

### 3. Project-Local Architect Setup

On a normal workstation where Architect guidance already lives in your global `AGENTS.md`, you do not need to run `$setup-ashieslashy-skills` in every repo.

Install and run `$setup-ashieslashy-skills` at project scope only when global setup is unavailable, not durable, or intentionally not enough for that repo:

```bash
cd my-repo
npx skills@latest add ashieslashy/skills --skill setup-ashieslashy-skills
```

Restart or reload Codex in that repo. Then run:

```text
$setup-ashieslashy-skills
```

Review the proposed repo-local `AGENTS.md` diff or no-change report, then approve if changes are needed. The setup skill validates the configured result, removes only `$setup-ashieslashy-skills` from that project scope, and reports what happened. Then restart or reload Codex again so the updated repo instructions and leaner skill inventory are loaded.

For a devcontainer, Codespace, or remote workspace that should carry its own complete setup, the usual path is:

```bash
cd my-repo
npx skills@latest add ashieslashy/skills --skill '*'
```

Restart or reload Codex in that workspace, run `$setup-ashieslashy-skills`, review and approve the proposed repo-local `AGENTS.md`, then restart or reload Codex after setup removes only itself. The project workflow skills remain installed for that workspace.

## How Setup Fits

Most skills in this collection are used on demand inside a repo: `$project-memory` for repo docs, `$skill-capture` for reusable delivery lessons, `$review-synthesis` for coordinated reviews, and `$code-structure-cleanup` for post-feature cleanup. `$setup-ashieslashy-skills` is different: it configures the `AGENTS.md` instructions that shape how Codex works in a scope.

The setup skill does not install, select, enable, disable, or enumerate other skills. The Skills CLI owns that. Setup only proposes Ashie's Architect methodology for a target `AGENTS.md`, preserves existing instructions, shows a summary and diff before writing, validates the approved result, and removes itself after success.

Run setup after the setup skill is installed in a scope where Codex can load it. The target `AGENTS.md` may be global or project-local; after validation, setup removes only `$setup-ashieslashy-skills` from the scope that supplied the running skill. Run it again only when refreshing Architect guidance or intentionally changing a target `AGENTS.md`; reinstall it from these instructions first if it previously removed itself. Do not use setup as an installer; use `npx skills` for that.

## Scope Notes

Install scope controls where a skill is available. Use global scope for durable personal operating guidance; use project scope for skills that should travel with, or only apply inside, a specific repo.

Project, devcontainer, and Codespace installs use project-scope skill state. A globally installed `$setup-ashieslashy-skills` can still configure a local project `AGENTS.md`, but the proposed file should reflect that target repo's local state and instructions.

To skip the Architect methodology, do not run setup. Installed skills still work from the scope selected during `npx skills`.

If `$project-memory` is installed for the target `AGENTS.md` scope, setup will propose including its methodology guidance in that `AGENTS.md`. That guidance tells future agents how to maintain the docs baseline; it does not create or update those docs by itself.

For project scope, if `skills-lock.json` and `.agents/skills/<skill>/` disagree in either direction, treat that as an install inconsistency and rerun the Skills CLI for that scope. Global installs use the Skills CLI's global state instead of repo-local `.agents/` files.

## Managing Skills

### Upgrade

To upgrade installed skills, use the Skills CLI:

```bash
npx skills update
```

Bare `npx skills update` prompts for scope. Use the CLI's scope prompts, or a documented CLI scope flag such as `--global`, when you want to update a specific scope.

You can also rerun the add command for this collection:

```bash
npx skills@latest add ashieslashy/skills
```

Previously installed AshieSlashy skills in that scope are upgrade candidates when the Skills CLI has an update path for them. `$setup-ashieslashy-skills` does not upgrade skill files; it refreshes the `AGENTS.md` guidance it owns.

After adding or upgrading skills, restart or reload Codex. Reinstall and rerun `$setup-ashieslashy-skills` only when the Architect guidance for a configured `AGENTS.md` might need refreshing. Project workflow skills are used on demand after they are upgraded.

Common case: global Architect with repo-local project skills:

```bash
# Update global skills, including the Architect setup skill when temporarily installed.
npx skills update --global

# Update project skills inside each repo that uses them.
cd my-repo
# Choose project scope if prompted.
npx skills update
```

Restart or reload Codex after each scope update. Reinstall and rerun `$setup-ashieslashy-skills set up my global Codex AGENTS.md` when you intentionally want to refresh global Architect guidance. Inside a repo, use whichever project skill matches the work: `$project-memory`, `$skill-capture`, `$review-synthesis`, or `$code-structure-cleanup`.

Repo-local case: project Architect with project skills:

```bash
cd my-repo
# Choose project scope if prompted.
npx skills update
```

Restart or reload Codex in that repo. Reinstall and rerun `$setup-ashieslashy-skills` when you intentionally want to refresh repo-local Architect guidance. Use the other installed skills on demand.

### Remove

Use the Skills CLI to remove skills. `$setup-ashieslashy-skills` normally removes itself after successful setup validation, but these commands are useful if setup could not complete removal or you installed it intentionally for later refresh work:

```bash
# Interactive removal
npx skills remove

# Remove one project skill from the current repo/workspace.
# Run only the command for the skill you want to remove.
cd my-repo
npx skills remove project-memory
npx skills remove skill-capture
npx skills remove review-synthesis
npx skills remove code-structure-cleanup
npx skills remove setup-ashieslashy-skills

# Remove from global scope
npx skills remove --global setup-ashieslashy-skills
```

After removing skills, restart or reload Codex. If setup has already been removed and Architect guidance needs refreshing, reinstall `$setup-ashieslashy-skills` with the install command above or edit `AGENTS.md` manually.
