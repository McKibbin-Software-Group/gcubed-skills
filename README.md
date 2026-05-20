# AshieSlashy Skills

Portable Codex skills and setup guidance.

## Quick Start

Install the collection with:

```bash
npx skills@latest add ashieslashy/skills
```

Default setup is opt-out: install the full AshieSlashy collection unless you already know which skills you do not want. Make sure `$setup-ashieslashy-skills` is included; it is the post-install setup skill for this collection.

Then run:

```text
$setup-ashieslashy-skills set up my target AGENTS.md. Resolve the scope, list discovered AshieSlashy skills, ask whether to apply all or opt out of specific items, and show me proposed changes before applying.
```

The setup skill lists discovered installed AshieSlashy skills, asks whether to apply all or opt out of specific skills or guidance blocks, then wires the selected skills into the relevant `AGENTS.md`. It proposes Ashie's Architect methodology and `$project-memory` methodology by default when available, preserves existing instructions according to the bundled hook merge policy, and shows a summary and diff before writing.

## Skills

- `$setup-ashieslashy-skills` (`skills/setup-ashieslashy-skills/`): set up installed AshieSlashy skills in a global, project, devcontainer, or Codespace `AGENTS.md`; proposes Architect methodology by default unless the user opts out.
- `$project-memory` (`skills/project-memory/`): create and maintain lightweight repo memory docs under `docs/`, plus concise root `AGENTS.md` guidance when missing or explicitly approved.

## Setup Notes

For a project, devcontainer, or Codespace, install the skills into the project scope, then run `$setup-ashieslashy-skills` from inside the target repo.

Project setup should keep global or personal defaults out of repo-local `AGENTS.md` unless explicitly approved. `$project-memory` guidance is included by default when installed; opt out during setup if the target repo should not adopt the docs baseline.

For personal or global Codex instructions, install globally if desired, then run:

```text
$setup-ashieslashy-skills set up my global Codex AGENTS.md. Show me the diff before applying.
```

To opt out of Ashie's Architect methodology, ask for hooks only:

```text
$setup-ashieslashy-skills set up only the installed skill hooks in my AGENTS.md. Do not add Architect methodology. Show me the diff before applying.
```

You can also opt out of individual skill hooks or guidance blocks, such as `$project-memory` methodology, during the setup confirmation.

## Updates

To refresh installed skills after this repo changes, rerun:

```bash
npx skills@latest add ashieslashy/skills
```

Then rerun `$setup-ashieslashy-skills` if the generated skill hooks or setup guidance changed. It should report when no changes are needed, and should preserve existing valid hooks for installed skills from this collection as well as unrelated hooks from other skill collections.
