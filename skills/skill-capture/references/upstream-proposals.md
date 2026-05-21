# Upstream Skill Proposals

Use this reference when a captured skill seems broadly useful, but the current project cannot or should not write directly to the shared skill collection.

## Packet Shape

Prefer a self-contained packet:

```text
docs/ai/skill-proposals/<YYYY-MM-DD>-<skill-name>/
  skill/
    SKILL.md
    agents/openai.yaml
    references/...
    scripts/...
  rationale.md
  incorporation.md
  review-checklist.md
```

`rationale.md` should explain:

- source task or delivery context, without pasting transcripts
- why this should be shared beyond the current project
- which existing skills were checked when known
- what project-specific details were removed
- known limits and maintainer review questions

`incorporation.md` should name the intended shared collection when known and list expected landing paths, such as:

```text
skills/<skill-name>/
README.md skill list
docs/MAINTAINERS.md repository map
AGENTS.md entry points, if the collection lists them
```

`review-checklist.md` should cover:

- privacy redaction
- portability beyond the source project
- trigger clarity
- overlap with existing skills
- validation evidence
- whether the candidate should remain project-local

## Maintainer Handoff

1. Draft the upstream packet locally.
2. Remove source-project secrets, customer identifiers, private URLs, local-only paths, and transcript noise.
3. If the target collection is accessible and the user explicitly wants it, prepare a branch or GitHub PR that copies `skill/` into `skills/<skill-name>/` and updates collection bookkeeping.
4. If the target collection is not accessible, tell the user where the packet is and how to send it to the maintainer by issue, chat, email, or another available channel.
5. Do not claim the skill is incorporated until the maintainer has reviewed and accepted it.

## Skill Or Plugin

For an upstream packet, draft the reusable workflow as a skill first. Consider plugin packaging only when the maintainer wants marketplace distribution, bundled integrations, MCP config, hooks, or multiple skills shipped as one installable unit.
