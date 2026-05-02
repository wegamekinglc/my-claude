# C++ Code Style Guide

This is a default style guide. Projects should customize it by placing their own `.claude/rules/code-style.md`.

## Formatting

- Indent: 4 spaces (no tabs)
- Brace style: Attach (opening `{` on same line)
- Pointer/Reference binding: to type (`T*` not `T *`, `T&` not `T &`)
- Column limit: 150 characters (project-configurable)

## Naming Conventions

| Element           | Convention          | Examples                                |
|-------------------|---------------------|-----------------------------------------|
| Classes/Structs   | PascalCase          | `Date`, `ThreadPool`, `BlackScholes`    |
| Template params   | PascalCase or `T`   | `T`, `U`, `Iterator`, `Allocator`       |
| Functions/Methods | PascalCase          | `FromExcel()`, `AddDays()`, `Run()`     |
| Member variables  | camelCase           | `serialNumber`, `spot`, `name`          |
| Local variables   | camelCase           | `numPaths`, `batchSize`, `result`       |
| Constants/Macros  | UPPER_SNAKE_CASE    | `BATCH_SIZE`, `EPSILON`, `MAX_DEPTH`    |
| Files             | lowercase/snake_case | `threadpool.cpp`, `black_scholes.hpp`  |
| Test files        | `test_` prefix      | `test_vector.cpp`, `test_date.cpp`      |
| Namespaces        | lowercase           | `math`, `utils`, `core`                 |

## Header Files

- Always `#pragma once` (preferred over include guards)
- Include order:
  1. Corresponding header (in `.cpp` files) or test header (in test files)
  2. Standard/system headers (`<vector>`, `<string>`, `<cmath>`)
  3. Third-party library headers
  4. Project headers
- Every header should be self-contained (includes everything it uses)
- Avoid unnecessary includes; prefer forward declarations where possible

## Namespace Patterns

- Top-level project namespace (e.g., `namespace myproject { ... }`)
- Nested namespaces for subsystems: `myproject::math`, `myproject::io`
- Anonymous `namespace { }` for file-local helpers
- Always add closing comment on namespace braces: `} // namespace myproject`

## Type Idioms

- `using` over `typedef`: `using Index = std::size_t;`
- `explicit` on all single-argument constructors (unless implicit conversion is intentional)
- `[[nodiscard]]` on pure functions and getters where ignoring the return value is always a bug
- Prefer `constexpr` where compile-time evaluation is possible
- Use `override` on all virtual overrides
- Use `final` on classes not designed for inheritance

## Error Handling

- Use exceptions for recoverable errors, assertions for programming errors
- Prefer `std::runtime_error` or project-specific exception types derived from it
- Include context in error messages: what failed, why, and relevant values
- Use `noexcept` on functions that cannot throw (move constructors, destructors, simple accessors)

## General

- All files must end with a newline
- Use `nullptr` instead of `NULL`
- Use `auto` when the type is obvious from the initializer or excessively verbose
- Use range-based `for` loops when iterating entire containers
- Prefer `const` correctness: mark methods and parameters `const` where possible
- Use scoped enums (`enum class`) over unscoped enums
- Prefer stack allocation over heap allocation
- Use smart pointers (`std::unique_ptr`, `std::shared_ptr`) for heap objects

## Comment Style

- Sparse — code should be self-documenting through good names and clear structure
- Focus on "why" not "what" (the code already shows what it does)
- Single-line `//` for inline notes
- Avoid docstrings or doxygen-style comment blocks unless the project requires them
- Comments are for intent, assumptions, and non-obvious constraints
