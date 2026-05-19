---
name: setup-ashieslashy-skills
description: Set up installed AshieSlashy Codex skills in a global, project, devcontainer, or Codespace AGENTS.md. Use after `npx skills@latest add ashieslashy/skills`; this adds or refreshes skill hooks for the skills the user installed and proposes Ashie's Architect methodology by default unless the user opts out.
---

# Setup AshieSlashy Skills

Set up the AshieSlashy skills the user installed, without silently rewriting their operating style.

This is the one post-install setup skill for the collection. It wires installed skills into `AGENTS.md` and proposes the Architect methodology from the bundled template by default. The user can opt out of the methodology, and all changes remain review-first.

## Assets

- Skill hooks template: `assets/templates/skill-hooks-section.md`
- Minimal AGENTS template: `assets/templates/minimal-agents.md`
- Architect methodology template: `assets/templates/global-architect-agents.md`
- Wiring packet template: `assets/merge-packets/agents-md-wiring.md`
- Methodology adoption packet: `assets/merge-packets/methodology-adoption.md`

## Workflow

1. Determine scope:
   - Global: personal/user Codex instructions.
   - Project: repository root `AGENTS.md`.
   - Devcontainer/Codespace: usually project scope inside the workspace unless the user says otherwise.
2. Discover setup context:
   - If the user provided a packet path, read that first.
   - If no packet exists, use the bundled assets directly.
   - Check which AshieSlashy skills are installed or selected. If this cannot be discovered reliably, ask the user or propose hooks only for skills that clearly exist.
3. Inspect before proposing:
   - Read the target `AGENTS.md` if it exists.
   - For project/devcontainer scope, inspect repo-local guidance enough to avoid contradicting it.
4. Prepare the skill-hooks proposal:
   - Add or refresh only the skill-hooks block from `assets/templates/skill-hooks-section.md`.
   - Include hooks only for installed AshieSlashy skills.
   - If the target `AGENTS.md` is missing, use `assets/templates/minimal-agents.md` as the starter.
   - Preserve all existing user/project instructions.
   - Remove duplicate old AshieSlashy skill-hook blocks when they clearly refer to the same purpose.
5. Handle Architect methodology by default:
   - Unless the user explicitly opts out, use `assets/templates/global-architect-agents.md` as part of the proposed setup.
   - If the target `AGENTS.md` is missing or only contains generated skill hooks, propose the Architect template plus the skill-hooks block.
   - If the target `AGENTS.md` already has meaningful instructions, propose an intelligent merge rather than a blind replacement.
   - Preserve any `ashieslashy-skill-hooks` block.
   - For project/devcontainer scope, adapt or flag global-only wording instead of copying it blindly.
   - Remove duplicate or contradictory guidance.
   - If the user asks for hooks only, do not add the Architect methodology.
6. Show before writing:
   - Short semantic summary.
   - Unified diff, or full proposed file if creating a missing file.
   - Any conflicts, assumptions, or questions.
7. Write only after explicit approval:
   - Back up the existing target first when one exists.
   - Apply the approved content exactly.
   - Tell the user to restart Codex or reload the workspace if needed.

## Boundaries

- This skill wires installed AshieSlashy skills into `AGENTS.md`; it does not install skills.
- This skill does not create the project docs memory baseline. Use `$project-memory` for that when the target repo wants one.
- Architect methodology adoption is opt-out but review-first; never silently replace or substantially rewrite an existing `AGENTS.md`.
- Canonical instruction prose belongs in assets, not shell scripts.
