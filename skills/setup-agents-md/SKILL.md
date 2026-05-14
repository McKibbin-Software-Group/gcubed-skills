---
name: setup-agents-md
description: Wire installed skills into a global, project, devcontainer, or Codespace AGENTS.md by adding or refreshing a compact skill-hooks section. Use after `npx skills@latest add ashieslashy/skills` when the user wants to keep their existing AGENTS.md style and only connect selected skills.
---

# Setup AGENTS.md

Wire installed skills into `AGENTS.md` without adopting AshieSlashy's opinionated methodology.

This skill is deliberately boring. It adds or refreshes a concise skill-hooks block, preserves existing instructions, and does not import the Architect methodology template. If the user wants that optional methodology, hand off to `$ashie-agents-methodology`.

## Assets

- Skill hooks template: `assets/templates/skill-hooks-section.md`
- Minimal AGENTS template: `assets/templates/minimal-agents.md`
- Wiring packet template: `assets/merge-packets/agents-md-wiring.md`

## Workflow

1. Determine scope:
   - Global: personal/user Codex instructions.
   - Project: repository root `AGENTS.md`.
   - Devcontainer/Codespace: usually project scope inside the workspace unless the user says otherwise.
2. Inspect before proposing:
   - Read the target `AGENTS.md` if it exists.
   - Check which AshieSlashy skills are installed or selected.
   - For project/devcontainer scope, inspect root docs enough to avoid contradicting local guidance.
3. Prepare a proposal:
   - Add or refresh only the skill-hooks block from `assets/templates/skill-hooks-section.md`.
   - Preserve all existing user/project instructions.
   - Remove duplicate old skill hook blocks if they clearly refer to the same AshieSlashy skills.
   - Do not add the Architect methodology or rewrite the user's operating style.
4. Show before writing:
   - Short semantic summary.
   - Unified diff, or full proposed file if creating a missing file.
   - Any conflicts or assumptions.
5. Write only after explicit approval:
   - Back up the existing file first when one exists.
   - Apply the approved content exactly.
   - Tell the user to restart Codex or reload the workspace if needed.

## Boundaries

- This skill wires skills into `AGENTS.md`; it does not create the project docs memory baseline. Use `$project-memory` for that.
- This skill does not replace or substantially rewrite `AGENTS.md`. Use `$ashie-agents-methodology` when the user wants to adopt or merge the opinionated Architect methodology.
- Manual installers may generate wiring packets from this skill's assets, but canonical prose belongs in assets, not shell scripts.
