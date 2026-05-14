# Roadmap

## Near Term

- Review and commit the project install flow.
- Test `scripts/install-project.sh` inside an actual devcontainer or Codespace.
- Decide whether the README removal of the old "First Push" section is intentional.
- Consider adding a tiny smoke-test script for install flows.

## Medium Term

- Harden installer portability if macOS support becomes important.
- Add examples of merge packet prompts and expected Codex output.
- Decide whether generated merge packets should be `.gitignore`d in target projects.
- Consider shared helper functions if install scripts grow further.

## Later / Deferred

- Package this tooling as a plugin if distribution beyond personal repos becomes important.
- Add CI that runs ShellCheck and installer smoke tests.
- Support additional skills beyond `project-memory`.

## Non-Goals

- Do not automate semantic merges of existing `AGENTS.md` files in shell.
- Do not turn this repo into a large framework.
- Do not store secrets, live tokens, or machine-specific credential paths in docs.

## Sequencing Notes

Keep the deterministic script layer separate from the semantic merge layer. Scripts should install files and create packets; Codex and the user should review and approve instruction merges.
