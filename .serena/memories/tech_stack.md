# Tech Stack

- Source format: Markdown skills plus small YAML agent metadata files.
- Serena project language: `markdown`; encoding `utf-8`.
- Distribution path: Skills CLI, primarily `npx skills@latest add ashieslashy/skills` from a consumer repo or install scope.
- No tracked `package.json`, lockfile, CI config, test runner, formatter config, or release automation in this repo.
- No application code runtime; changes are usually documentation/skill-instruction edits.
- `agents/openai.yaml` files use a simple `interface` object with `display_name`, `short_description`, and `default_prompt`.
- Canonical setup/project-memory prose lives in skill assets, not scripts.