# AshieSlashy Hook Merge Policy

- Default to selecting every discovered installed AshieSlashy skill unless the user opts out of specific skills.
- Generate hook entries only for selected installed AshieSlashy skills.
- Replace hook-entry placeholders with generated entries before proposing changes; do not leave unresolved placeholders.
- If the user opts out of every AshieSlashy skill hook, do not add an empty `ashieslashy-skill-hooks` block; propose removing an existing empty or fully opted-out block instead.
- Preserve valid existing hooks for selected installed AshieSlashy skills, including hooks that are not present in the static starter template.
- Do not downgrade a richer valid `ashieslashy-skill-hooks` block to the minimal bundled starter.
- Prune an AshieSlashy hook only when the referenced skill is clearly not installed, opted out, stale, duplicate, or wrong.
- Remove duplicate old AshieSlashy skill-hook blocks only when they clearly refer to the same purpose.
- Preserve unrelated skill hooks, generated blocks, and manually maintained skill instructions from other skill collections unchanged.
