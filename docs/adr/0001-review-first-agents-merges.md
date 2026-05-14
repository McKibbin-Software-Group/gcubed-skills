# ADR 0001: Use Review-First AGENTS.md Merge Packets

Date: 2026-05-14

## Status

Accepted

## Context

The setup skills need to update Codex guidance across WSL, devcontainers, Codespaces, and projects. Existing `AGENTS.md` files can contain personal or project-specific operating instructions. Deterministic tooling cannot safely perform semantic merges of instruction prose without risking duplicate, contradictory, or confusing guidance.

## Decision

Setup skills may propose creating a missing `AGENTS.md` only when the target is clearly empty or absent and the source is appropriate for that target. When an `AGENTS.md` already exists, setup must preserve surrounding guidance and propose a reviewed diff.

The setup flow must ask Codex to show a summary and diff before writing anything, and to wait for explicit user approval before applying changes.

## Consequences

- Existing instruction files are protected from blind rewrites.
- Semantic merge work happens in the agent/user review loop, where contradictions can be resolved.
- Setup stays interactive when instructions already exist.
