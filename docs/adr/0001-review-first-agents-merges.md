# ADR 0001: Use Review-First AGENTS.md Merge Packets

Date: 2026-05-14

## Status

Accepted

## Context

The install scripts need to update Codex setup across WSL, devcontainers, Codespaces, and projects. Existing `AGENTS.md` files can contain personal or project-specific operating instructions. A shell script cannot safely perform semantic merges of instruction prose without risking duplicate, contradictory, or confusing guidance.

## Decision

Install scripts may create a missing `AGENTS.md` only when the target is clearly empty or absent and the source is appropriate for that target. When an `AGENTS.md` already exists, scripts must leave it unchanged and write a merge packet that asks Codex to propose a reviewed merge.

The merge packet must ask Codex to show a summary and diff before writing anything, and to wait for explicit user approval before applying changes.

## Consequences

- Existing instruction files are protected from blind rewrites.
- Semantic merge work happens in the agent/user review loop, where contradictions can be resolved.
- Installation becomes a two-step process when instructions already exist.
- Scripts stay simpler and more predictable.
