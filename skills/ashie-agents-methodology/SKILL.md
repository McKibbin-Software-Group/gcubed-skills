---
name: ashie-agents-methodology
description: Optionally adopt AshieSlashy's opinionated Architect AGENTS.md methodology into a global, project, devcontainer, or Codespace AGENTS.md. Use when the user wants to preview, replace, or intelligently merge the rescued Architect methodology while preserving existing skill hooks.
---

# Ashie AGENTS Methodology

Adopt AshieSlashy's opinionated Architect `AGENTS.md` methodology only when the user asks for it.

This skill is separate from `$setup-agents-md`. Use `$setup-agents-md` when the user only wants skill wiring. Use this skill when the user wants the "super duper" Architect-style operating instructions.

## Assets

- Global Architect template: `assets/templates/global-architect-agents.md`
- Methodology adoption packet: `assets/merge-packets/methodology-adoption.md`

The global template is the restored canonical source for the original global methodology. Do not recreate it in scripts.

## Workflow

1. Determine scope:
   - Global: personal/user `AGENTS.md`.
   - Project: repository root `AGENTS.md`.
   - Devcontainer/Codespace: usually project scope inside the workspace unless the user says otherwise.
2. Determine adoption mode:
   - Preview only.
   - Replace existing `AGENTS.md`, while preserving skill hooks.
   - Intelligently merge useful methodology into the existing file.
   - If unclear, ask which mode the user wants.
3. Inspect before proposing:
   - Read the target `AGENTS.md` if it exists.
   - Preserve any block between `<!-- BEGIN ashieslashy-skill-hooks -->` and `<!-- END ashieslashy-skill-hooks -->`.
   - For project/devcontainer scope, inspect repo-local docs enough to avoid overwriting project-specific guidance.
4. Prepare a proposal:
   - Use `assets/templates/global-architect-agents.md` as the source for the Architect methodology.
   - Keep the project-memory methodology block between its BEGIN/END markers when included.
   - For project/devcontainer scope, adapt or flag global-only wording instead of copying it blindly.
   - Preserve useful existing instructions, commands, safety constraints, and documentation pointers.
   - Remove duplicate or contradictory guidance.
5. Show before writing:
   - Short semantic summary.
   - Unified diff, or full proposed file if creating/replacing.
   - Conflicts, assumptions, and judgment calls.
6. Write only after explicit approval:
   - Back up the existing target first when one exists.
   - Apply the approved content exactly.
   - Tell the user to restart Codex or reload the workspace if needed.

## Boundaries

- Do not install skills; the skills collection installer does that.
- Do not add only the skill-hooks block; `$setup-agents-md` owns that.
- Do not silently replace an existing `AGENTS.md`; replacement is a user-selected adoption mode.
