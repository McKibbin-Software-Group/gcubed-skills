# AshieSlashy Skills

Portable Codex skills and setup guidance.

## Quick Start

Install the collection with:

```bash
npx skills@latest add ashieslashy/skills
```

Pick the skills you want to install. Make sure you include `$setup-ashieslashy-skills`; it is the post-install setup skill for this collection.

Then run:

```text
$setup-ashieslashy-skills set up the AshieSlashy skills installed in this AGENTS.md. Show me proposed changes before applying.
```

The setup skill wires installed skills into the relevant `AGENTS.md` and proposes Ashie's Architect methodology by default. Ask for hooks only if you want to opt out. It shows a summary and diff before writing.

## Skills

- `$setup-ashieslashy-skills` (`skills/setup-ashieslashy-skills/`): set up installed AshieSlashy skills in a global, project, devcontainer, or Codespace `AGENTS.md`; proposes Architect methodology by default unless the user opts out.
- `$project-memory` (`skills/project-memory/`): create and maintain lightweight repo memory docs under `docs/`.

## Setup Notes

For a project, devcontainer, or Codespace, install the skills into the project scope, then run `$setup-ashieslashy-skills` from inside the target repo.

Project setup should keep global or personal defaults out of repo-local `AGENTS.md` unless explicitly approved. Use `$project-memory` for a project docs baseline when the target repo actually wants one.

For personal or global Codex instructions, install globally if desired, then run:

```text
$setup-ashieslashy-skills set up my global Codex AGENTS.md. Show me the diff before applying.
```

To opt out of Ashie's Architect methodology, ask for hooks only:

```text
$setup-ashieslashy-skills set up only the installed skill hooks in my AGENTS.md. Do not add Architect methodology. Show me the diff before applying.
```

## Updates

To refresh installed skills after this repo changes, rerun:

```bash
npx skills@latest add ashieslashy/skills
```

Then rerun `$setup-ashieslashy-skills` if the generated skill hooks or setup guidance changed.

## Canonical Assets

- Skill hooks template: `skills/setup-ashieslashy-skills/assets/templates/skill-hooks-section.md`
- Architect methodology template: `skills/setup-ashieslashy-skills/assets/templates/global-architect-agents.md`
- Project `AGENTS.md` starter: `skills/project-memory/assets/templates/AGENTS.md`
- Project-memory methodology block: `skills/project-memory/assets/snippets/project-memory-methodology.md`
- Wiring packet template: `skills/setup-ashieslashy-skills/assets/merge-packets/agents-md-wiring.md`
- Methodology adoption packet template: `skills/setup-ashieslashy-skills/assets/merge-packets/methodology-adoption.md`

Canonical instruction prose belongs in skill assets, not ad hoc installer scripts.

## Maintainer Principles

- Keep `README.md` as the main user-facing source of truth for install, updates, skill purpose, and repo layout.
- Keep this repo as a clean distribution source; do not dogfood the `project-memory` docs baseline here.
- Keep setup behavior AI-driven and review-first: propose Architect methodology by default, but show the proposed summary and diff before writing.
- Keep ADRs optional in generated project docs; recommend them only when there is a durable decision with meaningful tradeoffs.

## Repository Layout

- `skills/setup-ashieslashy-skills/`: post-install setup skill, skill-hook assets, and Architect methodology assets.
- `skills/project-memory/`: docs memory skill, templates, and snippets.
