---
name: setup-ashieslashy-skills
description: Set up installed AshieSlashy Codex skills in a global, project, devcontainer, or Codespace AGENTS.md. Use after `npx skills@latest add ashieslashy/skills`; this lists discovered skills, lets the user opt out of specific skills or guidance, adds or refreshes selected skill hooks, and proposes Ashie's Architect methodology by default unless the user opts out.
---

# Setup AshieSlashy Skills

Set up the AshieSlashy skills the user installed, without silently rewriting their operating style.

This is the one post-install setup skill for the collection. Setup is opt-out: by default it wires every discovered installed AshieSlashy skill into `AGENTS.md` and proposes the Architect methodology from the bundled template. The user can opt out of specific skills or guidance blocks, and all changes remain review-first.

## Assets

- Skill hooks starter template: `assets/templates/skill-hooks-section.md`
- Hook merge policy: `assets/policies/hook-merge-policy.md`
- Minimal AGENTS template: `assets/templates/minimal-agents.md`
- Architect methodology template: `assets/templates/global-architect-agents.md`

## Workflow

1. Determine scope:
   - Global: personal/user Codex instructions.
   - Project: repository root `AGENTS.md`.
   - Devcontainer/Codespace: usually project scope inside the workspace unless the user says otherwise.
2. Discover setup context:
   - Use the bundled assets directly.
   - Check which AshieSlashy skills are installed or selected, preferably from installed `SKILL.md` frontmatter under the relevant skill parent. If this cannot be discovered reliably, ask the user or propose hooks only for skills that clearly exist.
   - Default to including all discovered installed AshieSlashy skills and guidance blocks. Before preparing the proposal, list the discovered skills and default guidance blocks, then ask the user to apply all or opt out of specific skills or guidance unless the user already gave that selection.
   - Notice any existing non-Ashie skill hooks, generated blocks, or manually maintained skill instructions in the target `AGENTS.md`; these are merge context to preserve, not material to rewrite.
3. Load bundled assets before proposing:
   - Read `assets/templates/global-architect-agents.md` from this installed skill directory and treat it as the source candidate for Architect methodology.
   - Render the Architect methodology from the bundled template. Do not recreate, paraphrase, or infer this methodology from active session instructions, global `AGENTS.md`, memory, or conversation history.
   - Read `assets/templates/skill-hooks-section.md` from this installed skill directory and treat it as a minimal starter/wrapper for AshieSlashy skill hooks, not an exhaustive source of truth.
   - Read `assets/policies/hook-merge-policy.md` and apply it when generating or refreshing the `ashieslashy-skill-hooks` block.
   - If `$project-memory` is installed and not opted out, read its bundled `assets/snippets/project-memory-methodology.md` and replace `{{PROJECT_MEMORY_METHODOLOGY}}` with that snippet. If `$project-memory` is not installed or was opted out, remove the placeholder.
   - Use an existing target `AGENTS.md`, current/global instructions, and conversation context only as merge context. Do not use them as the source for AshieSlashy's Architect methodology.
   - If active/global instructions contradict the bundled template, prefer the bundled template for Ashie-owned methodology and surface the conflict in the proposal.
   - If the bundled Architect template cannot be read or rendered, stop and report the missing asset. Do not fall back to ambient or global `AGENTS.md` prose.
4. Inspect before proposing:
   - Read the target `AGENTS.md` if it exists.
   - For project/devcontainer scope, inspect repo-local guidance enough to avoid contradicting it.
5. Prepare the skill-hooks proposal:
   - Add or refresh only the `ashieslashy-skill-hooks` block, using `assets/templates/skill-hooks-section.md` as the starter structure.
   - Follow `assets/policies/hook-merge-policy.md` for selection, preservation, pruning, duplicate handling, placeholder replacement, and other skill collections.
   - If the target `AGENTS.md` is missing and the user asked for hooks only, use `assets/templates/minimal-agents.md` as the starter.
   - Preserve all existing user/project instructions.
6. Handle Architect methodology by default:
   - Unless the user explicitly opts out, use `assets/templates/global-architect-agents.md` as part of the proposed setup.
   - If the target `AGENTS.md` is missing or only contains generated skill hooks, propose the rendered Architect template plus the skill-hooks block. Do not compose a fresh methodology from memory.
   - If the target `AGENTS.md` already has meaningful instructions, propose an intelligent merge between the rendered bundled source candidate and the existing target as merge context, rather than a blind replacement.
   - Preserve any `ashieslashy-skill-hooks` block.
   - For project/devcontainer scope, adapt or flag global-only wording instead of copying it blindly.
   - Remove duplicate or contradictory guidance.
   - If the user asks for hooks only, do not add the Architect methodology.
7. Show before writing:
   - For full methodology setup, show the source path used for the Architect methodology and its first non-heading sentence, so the user can verify provenance.
   - The hook source used, the discovered installed AshieSlashy skills, the selected skills/guidance, any opt-outs, and whether an existing hook block was preserved, refreshed, pruned, expanded, or left unchanged.
   - Short semantic summary.
   - Unified diff, or full proposed file if creating a missing file.
   - Any conflicts, assumptions, or questions.
   - If the proposed file matches the target, report that no changes are needed and do not ask to apply.
8. Write only after explicit approval:
   - Back up the existing target first when one exists, using a unique timestamped backup path that will not overwrite an earlier backup.
   - Apply the approved content exactly.
   - Tell the user to restart Codex or reload the workspace if needed.

## Boundaries

- This skill wires installed AshieSlashy skills into `AGENTS.md`; it does not install skills.
- This skill does not create the project docs memory baseline. Use `$project-memory` for that when the target repo wants one.
- Architect methodology adoption is opt-out but review-first; never silently replace or substantially rewrite an existing `AGENTS.md`.
- Canonical instruction prose belongs in assets, not shell scripts.
