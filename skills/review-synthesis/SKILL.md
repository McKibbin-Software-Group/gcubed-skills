---
name: review-synthesis
description: Coordinate multi-perspective project, code, docs, design, or delivery reviews into focused recommendations. Use for multiple subagents, perspectives, named roles like UI/UX, DevOps, architecture, security, docs, or integrated feedback before changes.
---

# Review Synthesis

Use this skill to run a review through several focused lenses and integrate the results into one coherent answer.

Default to read-only review unless the user explicitly asks to implement changes. This skill reviews work; `$skill-capture` decides whether review lessons should become reusable skills.

Default to spawning focused subagents for distinct review perspectives whenever subagents are allowed and likely to improve coverage. If subagents are explicitly disallowed, unavailable, or not worth the overhead, apply the selected perspectives locally.

## Workflow

1. Confirm scope and mode: read-only review, implementation follow-up, or both.
2. Inspect repo instructions, relevant docs, `git status --short`, and target files enough to avoid blind delegation.
3. If reviewing an agent skill, skill proposal, or skill collection change, read `references/skill-reviews.md` and use its lenses to select reviewers and structure findings.
4. Select relevant perspectives. Use user-named roles first; otherwise choose only roles that fit the target.
5. When using subagents, brief each reviewer with:
   - exact target files, directories, or question
   - its assigned perspective and boundaries
   - read-only instruction unless implementation was explicitly requested
   - expected output: findings first, severity, file/line references when available, and open questions
6. Continue a lightweight parent review while reviewers run; if applying lenses locally, keep each pass distinct and avoid re-reviewing the same concerns.
7. Integrate the results:
   - deduplicate overlapping findings
   - resolve contradictions or mark them as tradeoffs
   - verify important claims against files when practical
   - separate confirmed issues from suggestions and taste calls
   - connect findings to likely user impact
8. Present one synthesized review, not a paste-up of agent reports, with the smallest useful action path.

## Common Perspectives

Choose lenses that fit the target:

- Architecture: boundaries, coupling, domain model, maintainability.
- Expert coder: correctness, idioms, tests, edge cases, best practices.
- DevOps: deployment, CI, config, observability, reliability.
- Security/privacy: secrets, auth, data exposure, unsafe defaults.
- UI: implementation polish, responsiveness, accessibility mechanics.
- UX/design: flows, clarity, hierarchy, task fit.
- Docs/product: accuracy, reader fit, terminology, missing context.
- Skill authoring: trigger clarity, instruction coherence, cognitive load, progressive disclosure, agent ergonomics, portability, bundled assets, and validation.

For skill-specific reviews, read `references/skill-reviews.md`.

## Output Shape

Lead with integrated findings:

```text
Findings
- [severity] [perspective] File/line: issue, impact, recommendation.

Cross-Perspective Synthesis
- Consensus, tensions/tradeoffs, and parent assessment.

Open Questions
- Questions blocking a confident recommendation.

Recommended Next Actions
- Smallest useful fixes and validation.

Subagent Notes
- Brief role-by-role summary when useful.
```

If there are no major issues, say so clearly and list residual risks or test gaps. For code reviews, prioritize bugs, regressions, missing tests, and operational risks before style. For planning or design reviews, prioritize decision risks and unclear assumptions.

## Guardrails

- Keep role briefs narrow; vague reviewers produce fog with bullet points.
- Prefer independent lenses over several agents reading the same thing.
- Do not treat subagent output as truth. Review, merge, and challenge it.
- Do not bury severe findings under perspective summaries.
- Do not make changes after a review unless the user explicitly asks for implementation.
- Avoid decorative roles; more reviewers can mean more noise, not more insight.
- Tie subjective design feedback to user goals, accessibility, or task fit.
