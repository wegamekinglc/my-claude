#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<EOF
Usage: scripts/sync-skills.sh [--dry-run] [--verbose]

Sync repository-local skills into user-level skill folders so they can be used
from any project.

Sources:
  .claude/skills -> ${CLAUDE_HOME:-$HOME/.claude}/skills
  .codex/skills  -> ${CODEX_HOME:-$HOME/.codex}/skills

Options:
  --dry-run   Show what would be synced without changing files.
  --verbose   Print each synced skill.
  -h, --help  Show this help.
EOF
}

dry_run=0
verbose=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      dry_run=1
      ;;
    --verbose)
      verbose=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
  shift
done

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "$script_dir/.." && pwd)"

claude_home="${CLAUDE_HOME:-$HOME/.claude}"
codex_home="${CODEX_HOME:-$HOME/.codex}"

require_rsync() {
  if ! command -v rsync >/dev/null 2>&1; then
    echo "rsync is required to sync skills." >&2
    exit 1
  fi
}

sync_skill_tree() {
  local label="$1"
  local source_root="$2"
  local target_root="$3"

  if [[ ! -d "$source_root" ]]; then
    [[ "$verbose" -eq 1 ]] && echo "Skipping $label: no source at $source_root"
    return
  fi

  if [[ "$dry_run" -eq 0 ]]; then
    mkdir -p "$target_root"
  elif [[ ! -d "$target_root" ]]; then
    echo "Would create $target_root"
  fi

  local count=0
  local skill_path
  while IFS= read -r -d '' skill_path; do
    local skill_name
    skill_name="$(basename "$skill_path")"

    if [[ ! -f "$skill_path/SKILL.md" ]]; then
      [[ "$verbose" -eq 1 ]] && echo "Skipping $label/$skill_name: missing SKILL.md"
      continue
    fi

    local destination="$target_root/$skill_name"
    local args=(-a --delete)
    if [[ "$dry_run" -eq 1 ]]; then
      args+=(--dry-run --itemize-changes)
    fi

    [[ "$verbose" -eq 1 || "$dry_run" -eq 1 ]] && echo "Syncing $label/$skill_name -> $destination"
    rsync "${args[@]}" "$skill_path/" "$destination/"
    count=$((count + 1))
  done < <(find "$source_root" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)

  echo "Synced $count $label skill(s) to $target_root"
}

require_rsync
sync_skill_tree "Claude" "$repo_root/.claude/skills" "$claude_home/skills"
sync_skill_tree "Codex" "$repo_root/.codex/skills" "$codex_home/skills"
