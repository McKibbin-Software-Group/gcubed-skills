# Maintainer Notes

This repo is a distribution source for portable Codex-compatible skills. It should stay boring, reviewable, and easy to install from.

## Operating Model

- Treat `npx skills@latest add ashieslashy/skills` as the primary distribution path.
- Let the Skills CLI own skill selection, agent selection, and global/project scope.
- Keep setup behavior AI-driven and review-first.
- Use `$setup-ashieslashy-skills` as the normal user-facing setup path, but treat it as temporary bootstrap tooling. After successful validation it should remove only itself from the scope that supplied the running skill.
- Keep global Architect setup as a key package deliverable while still presenting the other workflow skills as first-class capabilities.
- Do not blindly merge instruction prose into an existing `AGENTS.md`; use the setup skill and its bundled assets to produce a reviewable proposal first.
- Keep one setup skill that proposes Architect methodology and includes project-memory guidance whenever `$project-memory` is installed for the target `AGENTS.md` scope, without reselecting installed skills.
- When project-memory is present, keep generated or refreshed `AGENTS.md` files lean: short guardrails and doc pointers only. Durable project facts belong in `docs/`; temporary AI working notes belong in `docs/ai/`.
- Keep canonical instruction prose in skill assets rather than ad hoc installer scripts.
- Keep ADR files optional in generated project docs; recommend them only for durable decisions with meaningful tradeoffs.
- Keep `$skill-capture` proposal-first. It may draft skill files, local review packets, and upstream packets for maintainers, but should not silently mutate installed or shared skills.
- Keep `$review-synthesis` orchestration-focused. It should coordinate and synthesize focused perspectives, using subagents only when explicitly allowed, not replace normal implementation, issue triage, or project-memory flows.
- Keep `$code-structure-cleanup` post-feature and behavior-preserving. It should reduce concrete duplication in the feature area, not become a general architecture cleanup permission slip.

## Maintainer Checklist

- Before changing setup behavior, inspect the setup skill, its agent prompt, and relevant templates together.
- Keep the setup self-removal path explicit: validation must pass first, unrelated skills must remain installed, and the final message must point users back to README install instructions for future refreshes.
- Keep `README.md` focused on install/update instructions for users.
- Keep maintainer-only rationale, asset maps, and release checks in this file.
- Keep reusable setup rules in canonical assets, then reference or render them elsewhere.
- When adding or materially changing a skill, update the README skill list, usage guidance, relevant skill-specific docs, and this maintainer map. Do not add a second selection layer to setup.
- When changing generated `AGENTS.md` guidance, check for duplicated or conflicting prose across templates and snippets.
- When changing project-memory guidance, check `skills/project-memory/SKILL.md`, its `AGENTS.md` template, the methodology snippet, and `skills/setup-ashieslashy-skills/SKILL.md` together.
- Before release, run `git diff --check`, validate `SKILL.md` frontmatter and `agents/openai.yaml` shape, compare README summaries with skill metadata, search for stale references to deleted assets, and do one dry review of the proposed setup output.

## Skill Incorporation

- External projects may not be able to see this repository. Treat their `$skill-capture` output as an upstream proposal packet, not as an already accepted skill.
- Promote accepted proposals by copying the packet's `skill/` contents into `skills/<skill-name>/`, then update `README.md`, this maintainer map, and root `AGENTS.md` entry points when applicable.
- Prefer skills as the source format for incorporated workflows. Consider plugin packaging only when the collection needs marketplace distribution, bundled integrations, MCP config, hooks, or multiple skills shipped as one installable unit.
- Review upstream packets for privacy, portability, trigger clarity, overlap with existing skills, and validation evidence before incorporation.

## Single Setup Path

- Keep setup behavior in `$setup-ashieslashy-skills`, with canonical prose in templates and snippets.
- Do not add separate static merge/review packet templates for normal setup work.
- If an external workflow eventually needs a portable brief, generate it from the same canonical assets instead of storing a parallel setup path.

## Key Assets

- `skills/*/SKILL.md`: installable skill instructions and public metadata.
- `skills/*/agents/openai.yaml`: per-skill agent interface metadata; keep shape consistent across the collection.
- `skills/setup-ashieslashy-skills/assets/templates/global-architect-agents.md`: Architect methodology source.
- `skills/project-memory/assets/templates/AGENTS.md`: project `AGENTS.md` starter.
- `skills/project-memory/assets/snippets/project-memory-methodology.md`: managed project-memory methodology block.
- `skills/skill-capture/SKILL.md`: review-first flow for turning delivery lessons into skill proposals and upstream packets.
- `skills/skill-capture/references/new-skill-proposals.md`: authoring-skill selection, optional subagent drafting, candidate file shape, and local review packet guidance.
- `skills/skill-capture/references/upstream-proposals.md`: packet shape and handoff guidance for proposals from external projects.
- `skills/review-synthesis/SKILL.md`: orchestration guidance for explicitly requested multi-perspective review synthesis, with subagents only when allowed.
- `skills/code-structure-cleanup/SKILL.md`: post-feature cleanup guidance for reducing duplicated mechanics without changing behavior.

## Repository Map

- `skills/setup-ashieslashy-skills/`: post-install setup skill and Architect methodology assets.
- `skills/project-memory/`: installable project-memory skill, templates, and snippets.
- `skills/skill-capture/`: installable skill proposal workflow for reusable delivery knowledge.
- `skills/review-synthesis/`: installable multi-perspective review synthesis skill.
- `skills/code-structure-cleanup/`: installable post-feature code structure cleanup skill.
