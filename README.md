# my-claude

Custom [Claude Code](https://claude.ai/code) skills and configuration.

## Skills

| Skill | Description |
|-------|-------------|
| `commit-and-pr` | Stage, commit, push, and create/update a pull request in one workflow |
| `cpp-code-style-review` | Review changed C++ code for coding standards, test conventions, and documentation consistency |

## Getting started

```bash
# Clone and sync skills to your user-level folders
git clone git@github.com:wegamekinglc/my-claude.git
cd my-claude
./scripts/sync-skills.sh
```

After syncing, the skills become available from any project via slash commands (e.g., `/commit-and-pr`, `/cpp-code-style-review`).

Use `./scripts/sync-skills.sh --dry-run` to preview what would be copied.

## Structure

```
.claude/          Claude Code skills and settings
  skills/           Skill definitions (SKILL.md per skill)
scripts/          sync-skills.sh — publish skills to user-level folders
workspace/        Git-ignored scratch space for other repos
```

## Contributing

Branch naming: `feature/<desc>` or `fix/<desc>`. PR titles use a mandatory category prefix (`feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`). See [CLAUDE.md](CLAUDE.md) for full conventions.
