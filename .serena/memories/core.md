# Core

- Distribution repo for portable Codex-compatible skills around Ashie's Architect methodology, repo memory, skill capture, review synthesis, and behavior-preserving cleanup.
- Markdown/YAML content repo; no app runtime, package manifest, test harness, or generated build artifacts are tracked.
- Root `README.md`: user-facing install, update, remove, and scope guidance. Keep it focused on Skills CLI usage and lifecycle instructions.
- Root `AGENTS.md`: repo-local guardrails and entry-point map. It intentionally stays concise.
- `docs/MAINTAINERS.md`: maintainer-only operating model, asset map, release/change checklist, and durable rationale.
- `skills/<skill>/SKILL.md`: installable skill instructions with frontmatter metadata.
- `skills/<skill>/agents/openai.yaml`: per-skill interface metadata.
- Skill subfolders may include `assets/` for canonical templates/snippets and `references/` for progressive-disclosure supporting guidance.
- Current distributed skills: `setup-ashieslashy-skills`, `project-memory`, `skill-capture`, `review-synthesis`, `code-structure-cleanup`.
- Important local rule: do not dogfood this repo's skills while maintaining them.
- For implementation environment and lack of build tooling, see `mem:tech_stack`.
- For style and repo-specific guardrails, see `mem:conventions`.
- For useful commands and completion checks, see `mem:suggested_commands` and `mem:task_completion`.