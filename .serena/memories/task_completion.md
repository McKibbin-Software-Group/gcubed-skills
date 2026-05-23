# Task Completion

- Before editing: `git status --short`; inspect relevant diffs and untracked files that overlap the task.
- For most changes, narrow validation is repo-content validation rather than app tests; no tracked package/test harness exists.
- Always run `git diff --check` after file edits.
- For skill changes, manually verify:
  - `SKILL.md` frontmatter has `name` and trigger-focused `description`.
  - directory name matches frontmatter `name`.
  - `agents/openai.yaml` keeps the established `interface` shape.
  - README skill list/usage and `docs/MAINTAINERS.md` asset map are updated when adding or materially changing a distributed skill.
  - references to renamed/deleted assets are not stale.
- For Serena memory changes, run `serena memories check .`.
- Report validation run, skipped checks, and any residual risk in the final response.