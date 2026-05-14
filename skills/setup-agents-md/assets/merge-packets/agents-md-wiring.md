# AGENTS.md Skill Wiring Packet

Generated: {{GENERATED_AT}}
Scope: {{TARGET_SCOPE}}
Target AGENTS.md: `{{TARGET_AGENTS}}`

## Objective

Add or refresh the AshieSlashy skill-hooks block in the target `AGENTS.md`.

This packet is for wiring installed skills only. It must not adopt or merge the opinionated Architect methodology. If the user wants that, use `$ashie-agents-methodology` separately.

## Existing Target

- Path: `{{TARGET_AGENTS}}`
- Status: {{TARGET_STATUS}}
- Installed skill parent: `{{DEST_SKILL_PARENT}}`

## Recommended Skill Hooks

```md
{{SKILL_HOOKS_SECTION}}
```

## Instructions For Codex

Do not apply changes immediately.

Inspect the existing target file if it exists. If the target is missing, propose a minimal `AGENTS.md` containing the recommended skill-hooks block.

Prepare a proposed `AGENTS.md` that:

- preserves existing user/project intent
- adds the skill-hooks block if missing
- refreshes the block between `<!-- BEGIN ashieslashy-skill-hooks -->` and `<!-- END ashieslashy-skill-hooks -->` if present
- removes duplicate AshieSlashy skill-hook blocks only when they clearly refer to the same purpose
- avoids adding AshieSlashy's Architect methodology or broader operating preferences
- keeps project-specific instructions authoritative in project/devcontainer scope

Before applying anything, show the user:

1. a short summary of semantic changes
2. a unified diff from the existing `AGENTS.md` to the proposed version, or the full proposed file if the target is missing
3. any conflicts, assumptions, or questions

Only write the file after the user explicitly approves the proposed result. Back up the current target first if it exists.

## Prompt To Give Codex

Please run `$setup-agents-md`. It should discover this packet, add or refresh the AshieSlashy skill hooks in my `AGENTS.md`, and show me the summary and unified diff before applying anything.
