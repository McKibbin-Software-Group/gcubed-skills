# Conventions

- Keep changes minimal, scoped, and reviewable. Preserve user changes; inspect `git status --short` and relevant diffs before editing.
- Do not commit, publish, sync from local installs, or mutate installed skills unless the user explicitly asks.
- Keep `README.md` user-facing: install/update/remove/scope instructions only.
- Put maintainer rationale, asset maps, release checks, and longer-lived implementation guidance in `docs/MAINTAINERS.md`.
- Root `AGENTS.md` should stay concise: guardrails plus entry-point map, not durable project facts.
- Skill metadata: each `SKILL.md` starts with YAML frontmatter containing `name` matching the directory and a trigger-oriented `description`.
- Skill instructions should use progressive disclosure: concise `SKILL.md`; larger optional details in directly linked `references/` files; reusable templates/snippets in `assets/`.
- `agents/openai.yaml` shape should remain consistent across skills: `interface.display_name`, `short_description`, `default_prompt`.
- Keep canonical instruction prose in assets/templates/snippets where setup/rendering depends on it; avoid duplicating it ad hoc in README or scripts.
- Setup behavior is owned by `skills/setup-ashieslashy-skills/`; Skills CLI owns selection, agent selection, install scope, updates, and removals.
- Project-memory generated docs should keep `AGENTS.md` lean and move durable facts into `docs/`.
- `$skill-capture` remains proposal-first; it should not silently mutate installed/shared skills.
- `$review-synthesis` uses subagents only when explicitly allowed.
- `$code-structure-cleanup` is post-feature and behavior-preserving, not a broad architecture rewrite pass.