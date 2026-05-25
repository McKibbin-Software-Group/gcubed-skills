# Skill Reviews

Use this reference when the review target is an agent skill, skill proposal, or skill collection change. The review goal is to improve whether a future agent can discover, load, trust, and follow the skill with minimal extra context.

## Inputs To Inspect

- `SKILL.md`, especially frontmatter, trigger wording, workflow steps, guardrails, and output shape.
- Directly linked `references/`, `assets/`, `scripts/`, and `agents/openai.yaml` files.
- Collection-level install or usage docs when the skill is distributed as part of a package.
- Any examples, captured lessons, proposal rationale, or validation notes supplied with the change.

Do not deep-read unrelated references unless a link, script, or claim depends on them.

## Review Lenses

Apply the mandatory lenses in every skill review. For multi-reviewer work, keep each reviewer narrow.

### Mandatory

- Instruction coherence and feel: Check the whole document for ambiguities, tensions, unstated assumptions, contradictions, and behavior pressure that could make an agent too timid, over-cautious, over-permissive, or reckless. Ask whether a capable agent can resolve the instructions and act confidently without extra debate.
- Execution simplicity and cognitive load: Check whether the skill gives the agent a clear path through the work with minimal mental juggling. Look for too many branches, unclear defaults, repeated concepts, hidden prerequisites, vague stopping points, excessive cross-references, or instructions that require remembering earlier caveats. Prefer ordered workflows, concrete defaults, narrow decisions, and rare-case details moved out of the main path.

### Discretionary

Choose the lenses that fit.

- Trigger and discovery: The description is the pre-load signal. Check that it names the capability, uses specific trigger conditions, distinguishes this skill from nearby skills, avoids broad catch-all wording, and follows the collection's metadata conventions.
- Workflow and agent ergonomics: Check whether the steps are actionable in a live task, ask only for materially necessary user input, define default read/write behavior, and give clear stopping or escalation rules.
- Progressive disclosure: Keep `SKILL.md` concise and scannable. Move rare, long, or domain-specific material into directly linked references. Avoid reference chains deeper than one level unless the collection explicitly supports them.
- Asset and automation fit: Suggest scripts only for deterministic, repeated, low-judgement operations such as validation or formatting. Check that bundled assets are canonical rather than duplicated prose.
- Portability and privacy: Flag local-only paths, secrets, customer identifiers, private URLs, raw logs, brittle environment assumptions, and time-sensitive facts without maintenance guidance.
- Validation and distribution: Check frontmatter shape, `agents/openai.yaml` consistency, stale links, executable assumptions, README or maintainer-map updates, and the narrowest meaningful validation evidence.
- Ecosystem fit: Identify overlap with existing skills. Recommend patching an existing skill, adding a reference, or creating a new skill based on the smallest reusable unit.

## Findings To Prefer

Prioritize findings that affect future agent behavior:

- Severe: vague or misleading trigger metadata, unsafe write behavior, hidden destructive operations, leaked sensitive context, missing required files, or instructions that conflict with the collection's operating model.
- Moderate: bloated `SKILL.md`, missing guardrails, unclear user-confirmation rules, duplicated canonical guidance, stale asset references, unresolved instruction tension, excessive cognitive load, or validation gaps.
- Minor: wording, examples, ordering, naming, and style issues that do not change behavior but reduce clarity.

Ground subjective comments in agent outcomes: wrong skill selection, excess context load, unsafe action, poor handoff, hard validation, or duplicate maintenance.

## Improvement Patterns

- Rewrite the description as: first sentence capability, second sentence `Use when...` with concrete triggers.
- Split long guidance into `references/<topic>.md` when `SKILL.md` is drifting beyond quick-load size or mixing common and rare workflows.
- Add a small deterministic script when agents would otherwise regenerate the same validation or transformation code.
- Replace broad "always" rules with scoped defaults and explicit exceptions.
- Put the common path in execution order, then move rare branches, edge cases, and rationale behind references.
- Add examples only when they clarify selection, expected output, or a tricky workflow decision.
- Move durable package rationale to maintainer docs; keep user-facing install docs focused on usage.

## Delegating Reviewers

Assign reviewers from the review lenses above. Use as many lenses as the skill change genuinely needs. Combine related lenses for small reviews; split them for larger, riskier, or collection-wide changes.

Each reviewer should own a narrow lens, avoid re-reviewing the whole skill, and report findings first with severity, file references, and concrete rewrite or restructuring suggestions.
