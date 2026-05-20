# Maintainer Notes

This repo is a distribution source for portable Codex skills. It should stay boring, reviewable, and easy to install from.

## Operating Model

- Treat `npx skills@latest add ashieslashy/skills` as the primary distribution path.
- Keep setup behavior AI-driven, opt-out, and review-first.
- Use `$setup-ashieslashy-skills` as the normal user-facing setup path.
- Do not blindly merge instruction prose into an existing `AGENTS.md`; use the setup skill and its bundled assets to produce a reviewable proposal first.
- Keep one setup skill that wires installed skills and proposes Architect methodology by default unless the user opts out.
- Keep canonical instruction prose in skill assets rather than ad hoc installer scripts.
- Keep setup merge behavior in setup assets, especially the hook merge policy.
- Keep ADR files optional in generated project docs; recommend them only for durable decisions with meaningful tradeoffs.

## Maintainer Checklist

- Before changing setup behavior, inspect the setup skill, its agent prompt, relevant templates, and hook merge policy together.
- Keep `README.md` focused on install/update instructions for users.
- Keep maintainer-only rationale, asset maps, and release checks in this file.
- Keep reusable setup rules in canonical assets, then reference or render them elsewhere.
- When adding a skill, update setup discovery expectations and any generated hook examples that should mention it.
- When changing generated `AGENTS.md` guidance, check for duplicated or conflicting prose across templates, snippets, and policies.
- Before release, run `git diff --check` and do one dry review of the proposed setup output.

## Single Setup Path

- Keep setup behavior in `$setup-ashieslashy-skills`, with canonical prose in templates, snippets, and policies.
- Do not add separate static merge/review packet templates for normal setup work.
- If an external workflow eventually needs a portable brief, generate it from the same canonical assets instead of storing a parallel setup path.

## Key Assets

- `skills/setup-ashieslashy-skills/assets/templates/skill-hooks-section.md`: AshieSlashy hook block starter.
- `skills/setup-ashieslashy-skills/assets/policies/hook-merge-policy.md`: hook selection, preservation, pruning, and cross-collection merge policy.
- `skills/setup-ashieslashy-skills/assets/templates/global-architect-agents.md`: Architect methodology source.
- `skills/project-memory/assets/templates/AGENTS.md`: project `AGENTS.md` starter.
- `skills/project-memory/assets/snippets/project-memory-methodology.md`: managed project-memory methodology block.

## Repository Map

- `skills/setup-ashieslashy-skills/`: post-install setup skill, skill-hook assets, policies, and Architect methodology assets.
- `skills/project-memory/`: installable project-memory skill, templates, and snippets.
