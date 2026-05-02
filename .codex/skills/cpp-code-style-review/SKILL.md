---
name: cpp-code-style-review
description: Review changed C++ code for compliance with project coding standards, unit test conventions, and documentation consistency. Use when the user asks to review code style, check style compliance, lint code, verify naming conventions, review changed files for project conventions, or says "review my changes", "check the style", "does this follow our conventions", or similar.
user-invocable: true
---

# C++ Code Style Review

Review all changed C++ files in the working tree against this project's coding and unit test conventions.

## Steps

1. Check if the project has style guides. Look for them in this order:
   - `.codex/rules/code-style.md` and `.codex/rules/unit-test-style.md`
   - `.claude/rules/code-style.md` and `.claude/rules/unit-test-style.md`
   - If neither exists, use the bundled defaults in `references/code-style.md` and `references/unit-test-style.md`

2. Identify changed files by running:
   ```bash
   git diff --name-only HEAD
   ```
   If there are no uncommitted changes, check the latest commit instead:
   ```bash
   git diff --name-only HEAD~1
   ```

3. Read each changed `.hpp`, `.h`, `.cpp`, `.cxx`, `.cc` file and check for violations against the style rules.

4. Report findings grouped by file, with line numbers and specific violations. If no violations are found, say so.

## What to Check

Review against the rules in the style guides found in step 1. The bundled defaults cover the categories below. If the project has its own style guides, those take precedence.

### Naming
- Types (classes, structs, enums): whatever convention the project uses (typically PascalCase)
- Functions/Methods: whatever convention the project uses (typically PascalCase or camelCase)
- Variables: whatever convention the project uses (typically camelCase for locals, with a project-specific convention for members)
- Constants/Macros: UPPER_SNAKE_CASE
- Files: consistent with project convention (typically lowercase or snake_case)
- Template parameters: consistent with project convention

### Header Files
- Use `#pragma once` (preferred) or consistent include guards
- Include order: relevant test header first (test files) -> standard/system headers -> project headers -> local headers
- Self-contained: each header should include everything it needs

### Test Files
- Follow the project's test framework conventions (Google Test, Catch2, doctest, etc.)
- Consistent suite and test naming
- Appropriate assertion macros for the type of check
- Float comparison with explicit tolerance

### General
- Consistent indentation (spaces, no tabs, consistent width)
- Consistent brace style
- Pointer/Reference binds to type: `T*` not `T *`
- `using` over `typedef`
- `explicit` on single-argument constructors
- `nullptr` instead of `NULL`
- All files end with a newline
- Comments focus on "why" not "what"
- Namespace closing braces have a comment: `} // namespace name`
