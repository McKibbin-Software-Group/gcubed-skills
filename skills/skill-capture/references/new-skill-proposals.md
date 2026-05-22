# New Skill Proposals

Use this reference after classification as `new-skill-proposal` and before drafting candidate files.

## Authoring Route

1. Identify available skill-authoring skills from the current skill list, such as `$write-a-skill`, `$skill-creator`, or a collection-local equivalent.
2. Ask the user which authoring path to use: a selected skill-authoring skill, or direct drafting when no suitable skill is available or the user prefers not to use one.
3. If subagents are available and the user has not already explicitly allowed them, ask whether to use one focused authoring subagent for the first drafting pass.
4. Explain that a focused subagent can keep the main context smaller, follow any selected authoring guidance, and leave the main agent free to perform an independent `$skill-capture` review.
5. If the user approves a subagent, give it only the proposal brief, relevant non-sensitive context, and any selected authoring skill to read and follow.
6. If drafting without a subagent, read the selected authoring skill when one was chosen and apply only the structure guidance that fits this proposal.

## Authoring Subagent Brief

Ask the authoring subagent for candidate files only. It should not write files unless the main agent explicitly delegates that action and the user has approved writes.

Include:

- the classification and proposal brief
- target candidate paths, usually `SKILL.md` plus `agents/openai.yaml` when the collection uses it
- relevant non-sensitive context and exclusions
- selected skill-authoring guidance to follow
- expected report: assumptions, overlaps checked, validation notes, and unresolved review questions

Do not give the subagent secrets, customer identifiers, private URLs, token paths, raw logs, transcript excerpts, or unnecessary local-only paths. Replace source-project specifics with neutral placeholders before delegation.

## Draft Files

Draft only the files needed for review:

- `SKILL.md`
- `agents/openai.yaml` when this repo or skill collection uses it
- optional `references/` only when the main skill would otherwise become long
- optional `scripts/` only for deterministic, repeated, low-judgement operations

Do not include auxiliary README, changelog, or installation files inside a skill folder.

## Distributed Skill Candidate

When working inside the target skill collection and the user explicitly asked to implement, draft the candidate in its landing path:

```text
skills/<skill-name>/
  SKILL.md
  agents/openai.yaml
  references/...
  scripts/...
```

Update the collection bookkeeping only when the candidate is meant to be incorporated there, such as the top-level README skill list and maintainer map in this repo.

## Local Review Packet

For work captured outside a shared skill collection, prefer a local review packet. Local packets keep the candidate `SKILL.md` at the packet root for quick project review; upstream packets use a nested `skill/` directory so the portable files can be copied cleanly into a shared collection.

```text
docs/ai/skill-proposals/<YYYY-MM-DD>-<skill-name>/
  SKILL.md
  rationale.md
```

`rationale.md` should summarize:

- source task or delivery context, without pasting transcripts
- why this should be a skill rather than docs
- what existing skill was checked, if any
- known limits and review questions

## Main Agent Duties

The main agent remains responsible for:

- classification and rationale
- checking overlap with existing skills
- privacy and portability review
- progressive disclosure and proposal shape
- the agent-led quality gate
- user-facing summary, diff presentation, and any writes
