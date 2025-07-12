---
description: How to write Swift code
alwaysApply: true
---

# Coding Style

- **Always** sort properties alphabetically.
- Group let and var and separate the two groups with an empty line.
- Try to maintain consistency in our code style.
- Prefer shorter lines. In practice, this means wrapping lines to create vertical rhythm.
- Function declarations and calls with multiple arguments should be split into multiple lines.
- Generic types with multiple types can also be broken down into multiple lines to improve readability.
- Use a line break before and after every multi-line statement in the same scope. Whitespace is a very effective visual delimiter.
- Do not use a line break before the opening brace (`{`).
- Use a line break after each `case` statement.
- Use one-liners where fit. One-liners shouldn't exceed 80 characters in width.
- Do not use any APIs that are not available on iOS 17 and up.

## TCA

### State Management

- Keep state as minimal as possible, removing any redundant or derived state.
- Use computed properties for derived state rather than storing it.
- Let child features manage their own state (e.g., use pagination's status instead of custom loading flags).
- Use `@ObservableState` for state structs.
- Make state properties public when they need to be accessed by views.
- Group related state properties together.

### Actions

- Make actions clear and descriptive of what happened, not what should happen.
- Group related actions together with empty lines.
- Separate user/system actions from child feature actions.
- Remove redundant actions that can be handled by child features.
- Use the `.binding` case with `BindableAction` for form-related state.
- Use `PresentationAction` for navigation-related state changes.
- Name actions from a user or system perspective, not implementation.

### Dependencies

- Only include dependencies that are actually used in the current implementation.
- Use specific dependency functions rather than entire clients when possible.
- Remove unused dependencies even if they might be needed later.
- Inject all external dependencies using `@Dependency`.
- Use dependency overrides in tests rather than creating mock objects.

### Reducer Organization

- Apply the single responsibility principle to your reducers.
- Extract complex logic into helpers on your reducer.
- Favor composition with `.ifLet` and `.forEach` over large, monolithic reducers.
- Use the `@Reducer` macro to automatically conform to the Reducer protocol.
- Return `.none` for actions that don't produce effects.
- Use `.cancellable` for effects that need to be cancelled.
- Use `@Presents` for optional navigation state.
- Prefer enum-based destinations for mutually exclusive navigation options.

### Testing

- Test each reducer action independently.
- Use `TestStore` for comprehensive testing of state changes and effects.
- Apply `.exhaustivity = .off` when you only need to test specific state changes.
- Use clock-based testing for time-dependent effects.
- Keep tests focused on specific behaviors.
- Use dependency injection to mock external dependencies.
- Test edge cases and error paths, not just happy paths.
- Avoid shared store instances in test classes.
- DO NOT use `XCTest`. Use the brand new Swift Testing instead (`@Test`, `#expect`, etc.)
- Do not test API endpoints in isolation - test them through the features that actually use them for better integration coverage.
