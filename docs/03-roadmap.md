# Roadmap

## Near Term

- Validate the `npx skills@latest add ashieslashy/skills` flow once the repo is published or renamed appropriately.
- Review and commit the `setup-agents-md` and `ashie-agents-methodology` skills.
- Test `$setup-agents-md` for global/project/devcontainer skill-hook wiring.
- Test `$ashie-agents-methodology` preview/replace/merge behavior against existing AGENTS.md files.
- Test `scripts/install-project.sh` inside an actual devcontainer or Codespace as a fallback path.
- Consider adding a tiny smoke-test script for install flows.

## Medium Term

- Harden installer portability if macOS support becomes important.
- Add examples of setup prompts and expected Codex output.
- Decide whether generated merge packets should be `.gitignore`d in target projects.
- Consider shared helper functions if install scripts grow further.

## Later / Deferred

- Package this tooling as a plugin if skills-collection distribution is not enough.
- Add CI that runs ShellCheck and installer smoke tests.
- Support additional skills beyond `project-memory`.

## Non-Goals

- Do not automate semantic merges of existing `AGENTS.md` files in shell.
- Do not turn this repo into a large framework.
- Do not store secrets, live tokens, or machine-specific credential paths in docs.

## Sequencing Notes

Keep deterministic installation separate from semantic merge work. The primary path is skills CLI installation followed by `$setup-agents-md`; `$ashie-agents-methodology` is opt-in, and scripts remain fallback helpers.
