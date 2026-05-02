# Unit Test Style Guide

This is a default style guide. Projects should customize it by placing their own `.claude/rules/unit-test-style.md`.

## Framework

- Use a consistent test framework (Google Test, Catch2, doctest, etc.)
- Tests should compile into one or more test binaries
- Tests should be runnable via a single command (e.g., `ctest`, `make test`)

## File Layout

- One test file per source module: `tests/<module>/test_<name>.cpp`
- Test files live in a dedicated `tests/` directory mirroring the source tree
- Include order: test framework header -> standard/system headers -> project headers -> local headers
- `using` declarations at file scope for frequently used types

## Test Structure

- Use the framework's simplest test registration mechanism (e.g., `TEST()` in Google Test, `TEST_CASE()` in Catch2)
- Avoid test fixtures unless shared setup provides clear value
- Suite/group names: PascalCase matching the module under test
- Test names: descriptive PascalCase or snake_case (be consistent)
- Use scoped blocks `{ }` within a test for sub-cases or isolated sections
- Each test should verify one behavior

## Assertions

- Use the strictest assertion that matches the check (e.g., `ASSERT_*` over `EXPECT_*` in Google Test)
- Exact comparison: use equality assertions for integers, enums, booleans
- Float comparison: always use approximate comparison with an explicit tolerance
  - Tolerance should be appropriate to the computation (typically `1e-8` to `1e-15`)
- Exception testing: use the framework's exception assertion (`ASSERT_THROW`, `REQUIRE_THROWS`, etc.)
- Prefer assertions that fail fast over those that continue after failure

## Data Setup

- Inline simple test data using initializer lists
- Use factory functions or builders for complex test objects
- Construct objects directly when testing the class itself
- Keep setup minimal — only what the test needs

## Patterns

- Test edge cases: empty inputs, boundary values, extreme values, invalid inputs
- Test error paths: verify that invalid inputs produce expected errors
- Test round-trip behavior where applicable (e.g., serialize then deserialize)
- For numerical code: test at known points (knots, boundaries), test interpolation accuracy, test derivative consistency
- Keep tests deterministic: no random values without a fixed seed
- Avoid dependencies between tests; each test should be independently runnable
