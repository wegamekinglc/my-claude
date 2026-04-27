# Codex Notes For This Repository

This directory contains Codex-facing mirrors of the reusable project guidance that also exists under `.claude`.

Keep the mirrored guidance semantically aligned across both trees. The only intentional differences should be tool-specific metadata or defaults, such as assistant-specific co-author trailers and Claude-only local permission settings.

Use the root `CLAUDE.md` and `AGENTS.md` as the high-level repo overview.

## How To Use These Files

- Use `skills/commit-and-pr/SKILL.md` for "ship it", "commit and PR", "push and create PR", "send this up for review", "wrap this up", or similar commit + push + PR requests.
- Treat `settings.local.json` as a mirror of the local settings information from `.claude/settings.local.json`; Codex may not consume the Claude permissions schema directly.
- Run `../scripts/sync-skills.sh` after changing skills to publish `.claude/skills` and `.codex/skills` into user-level skill folders.

## Local Workflow Skills

The folders under `skills/` use Codex-compatible `SKILL.md` frontmatter. If a user request matches one of these workflows, read the matching file and follow it.
