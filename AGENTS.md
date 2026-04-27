# AGENTS.md

This file provides guidance to Codex when working with code in this repository.

## Overview

This repo stores Claude Code and Codex skills and configuration. It is not a traditional software project - there is no build system, test suite, or application code.

## Repository structure

- `.claude/skills/` - Custom Claude Code skills. Each skill is a directory containing a `SKILL.md` with YAML frontmatter (`name`, `description`, `user-invocable`).
- `.claude/settings.local.json` - Local Claude permissions configuration (auto-allow rules for this machine only).
- `.codex/skills/` - Custom Codex skills mirrored from the Claude Code skills, adapted only where tool-specific wording or defaults differ.
- `.codex/settings.local.json` - Mirrored local settings information for Codex-facing reference.
- `workspace/` - Git-ignored directory for other repos used as workspace context.

## Skills

Skills are markdown files with frontmatter. The `user-invocable: true` field makes them triggerable via slash command in tools that support user-invocable skills. Skill instructions are written as step-by-step procedures that Codex follows.

## Git conventions

- **Branch naming**: `feature/<description>` for features, `fix/<description>` for bug fixes. Base branch is always `main`.
- **Commit messages**: Imperative summary under 72 chars, blank line, body explaining why. Append `Co-Authored-By: Codex <noreply@openai.com>`.
- **PR titles**: Mandatory category prefix (`feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`, `style:`, `perf:`, `ci:`), under 70 chars, imperative mood.
- **PRs**: Use `gh pr create` / `gh pr edit`. PR body uses `## Summary` and `## Test plan` sections.
