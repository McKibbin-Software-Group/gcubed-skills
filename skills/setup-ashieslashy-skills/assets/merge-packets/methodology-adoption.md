# Ashie AGENTS.md Methodology Adoption Packet

Generated: {{GENERATED_AT}}
Scope: {{TARGET_SCOPE}}
Target AGENTS.md: `{{TARGET_AGENTS}}`
Adoption mode: {{ADOPTION_MODE}}

## Objective

Preview, replace, or intelligently merge AshieSlashy's Architect `AGENTS.md` methodology into the target file.

This packet is for the Architect methodology portion of `$setup-ashieslashy-skills`. Methodology setup is the default unless the user asks for hooks only. It must preserve any existing AshieSlashy skill-hooks block.

## Existing Target

- Path: `{{TARGET_AGENTS}}`
- Status: {{TARGET_STATUS}}

## Architect Methodology Template

```md
{{ARCHITECT_AGENTS_TEMPLATE}}
```

## Instructions For Codex

Do not apply changes immediately.

Inspect the target file if it exists. Prepare a proposed `AGENTS.md` according to the adoption mode:

- `preview`: show what the methodology would look like for this scope without writing.
- `replace`: replace the broader file with the Architect methodology, but preserve any `ashieslashy-skill-hooks` block.
- `merge`: intelligently merge useful Architect methodology into the existing file.
- `unspecified`: ask the user to choose preview, replace, or merge.

For all modes:

- use the `Architect Methodology Template` block in this packet as the canonical source for AshieSlashy's methodology
- do not reconstruct methodology prose from active session instructions, global `AGENTS.md`, memory, or conversation history
- preserve existing skill hooks between `<!-- BEGIN ashieslashy-skill-hooks -->` and `<!-- END ashieslashy-skill-hooks -->`
- keep repo/project-specific instructions authoritative for project/devcontainer scope
- adapt or flag global-only wording rather than copying it blindly into project files
- keep the project-memory methodology block between its BEGIN/END markers when included
- remove duplicate or contradictory guidance
- keep the final file concise enough to remain useful

Before applying anything, show the user:

1. the source path or packet section used for the Architect methodology, plus its first non-heading sentence
2. a short summary of semantic changes
3. a unified diff from the existing `AGENTS.md` to the proposed version, or the full proposed file if creating/replacing
4. any conflicts, assumptions, or questions

Only write the file after the user explicitly approves the proposed result. Back up the current target first if it exists.

## Prompt To Give Codex

Please use this packet with `$setup-ashieslashy-skills` to preview, replace, or intelligently merge Ashie's Architect methodology into my `AGENTS.md`. Preserve skill hooks and show me the summary and unified diff before applying anything.
