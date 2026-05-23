# Suggested Commands

- List tracked repo files: `git ls-files`.
- Inspect all repo files, including untracked Serena/config files: `rg --files`.
- Check whitespace/conflict-marker issues before finishing changes: `git diff --check`.
- List Serena memories for this project: `serena memories list .`.
- Validate Serena memory references: `serena memories check .`.
- Primary consumer install path: `npx skills@latest add ashieslashy/skills`.
- Install one skill explicitly: `npx skills@latest add ashieslashy/skills --skill <skill-name>`.
- Install the whole collection intentionally: `npx skills@latest add ashieslashy/skills --skill '*'`.
- Update installed skills from a selected scope: `npx skills update`; use `npx skills update --global` for global scope.
- Remove installed skills: `npx skills remove <skill-name>`; use `npx skills remove --global <skill-name>` for global scope.
- Do not run install/update/remove commands against local installs unless the user explicitly asks; this repo is the distribution source.