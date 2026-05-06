# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repo stores Claude Code skills and configuration. It is not a traditional software project — there is no build system, test suite, or application code.

## Repository structure

- `.claude/skills/` — Custom Claude Code skills. Each skill is a directory containing a `SKILL.md` with YAML frontmatter (`name`, `description`, `user-invocable`).
- `.claude/settings.local.json` — Local permissions configuration (auto-allow rules for this machine only).
- `scripts/sync-skills.sh` — Syncs repo-local skills into user-level `~/.claude/skills` so they are available from any project.
- `workspace/` — Git-ignored directory for other repos used as workspace context.

## Skills

Skills are markdown files with frontmatter. The `user-invocable: true` field makes them triggerable via slash command. Skill instructions are written as step-by-step procedures that Claude Code follows.

Run `scripts/sync-skills.sh` after changing skills to publish them into user-level skill folders.

## Git conventions

- **Branch naming**: `feature/<description>` for features, `fix/<description>` for bug fixes. Base branch is always `main`.
- **Commit messages**: Imperative summary under 72 chars, blank line, body explaining why. Append `Co-Authored-By: Claude Opus 4.7 <noreply@anthropic.com>`.
- **PR titles**: Mandatory category prefix (`feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`, `style:`, `perf:`, `ci:`), under 70 chars, imperative mood.
- **PRs**: Use `gh pr create` / `gh pr edit`. PR body uses `## Summary` and `## Test plan` sections.
