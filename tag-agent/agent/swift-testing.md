---
description: How to write Swift Testing tests
alwaysApply: false
---

# Swift Testing

## Setup

Add Swift Testing to your project and import it.

```swift
import Testing
@testable import MyApp
```

## Basic Test

Mark any function with `@Test` to make it a test.

```swift
@Test("Basic assertion")
func basicTest() {
  #expect(2 + 2 == 4)
}
```

## Fail-Fast Requirements

Use `#require` to abort the test if a condition fails.

```swift
@Test func requiresValidInput() throws {
  let user = User(name: nil)
  try #require(user.name != nil)
  #expect(user.isValid)
}
```

## Testing Errors

Use `#expect(throws:)` to test that code throws specific errors.

```swift
@Test func throwsOnInvalidInput() {
  #expect(throws: ValidationError.invalidEmail) {
    try validateEmail("invalid")
  }
}
```

## Test Suites

Group related tests in a struct, class, or actor.

```swift
@Suite("User Tests")
struct UserTests {
  @Test func createsUser() { /* ... */ }
  @Test func validatesEmail() { /* ... */ }
}
```

## Parameterized Tests

Test multiple inputs by passing an array to `arguments`.

```swift
@Test("Valid emails", arguments: ["test@example.com", "user@domain.org"])
func validEmail(_ email: String) throws {
  try #require(isValidEmail(email))
}
```

## Async Tests

All test functions can be async and throwing.

```swift
@Test func fetchesData() async throws {
  let data = try await apiClient.fetchUser(id: 1)
  #expect(data.name == "John")
}
```

## Setup and Teardown

Use `init()` and `deinit` for per-test setup and cleanup.

```swift
final class DatabaseTests {
  var db: Database!

  init() async throws {
    db = try await Database.inMemory()
  }

  deinit {
    db.close()
  }

  @Test func insertsData() async throws {
    try await db.insert("Hello")
    #expect(try await db.read() == "Hello")
  }
}
```

## Test Traits

Use traits to customize test behavior.

```swift
@Test(.tags(.integration), .timeLimit(.minutes(5)))
func slowIntegrationTest() async throws {
  // Test runs serially and fails if it takes > 5 minutes
}

@Suite(.serialized)
struct SerialTests {
  // All tests in this suite run one at a time
}
```

## Conditional Tests

Enable or disable tests based on conditions.

```swift
@Test(.enabled(if: ProcessInfo.processInfo.environment["CI"] != nil))
func ciOnlyTest() {
  // Only runs in CI
}

@Test(.disabled("Flaky test - see issue #123"))
func flakyTest() {
  // Never runs
}
```

## Custom Traits

Create reusable test behaviors with custom traits.

```swift
struct OfflineTrait: TestTrait, TestScoping {
  func provideScope(for test: Test, testCase: Test.Case?,
                    performing body: @Sendable () async throws -> Void) async throws {
    Network.shared.isOffline = true
    defer { Network.shared.isOffline = false }
    try await body()
  }
}

extension Trait where Self == OfflineTrait {
  static var offline: Self { Self() }
}

@Test(.offline)
func cachesWhenOffline() async throws {
  // Test runs with network disabled
}
```

## Migration from XCTest

Convert XCTest patterns to Swift Testing equivalents.

```swift
// XCTest
class MyTests: XCTestCase {
  func testAddition() {
    XCTAssertEqual(2 + 2, 4)
  }
}

// Swift Testing
@Suite("Math Tests")
struct MathTests {
  @Test func addition() {
    #expect(2 + 2 == 4)
  }
}
```

## Common Patterns

### Multiple assertions in one test

```swift
@Test func userValidation() {
  let user = User(name: "John", email: "john@example.com")
  #expect(user.name == "John")
  #expect(user.email == "john@example.com")
  #expect(user.isValid)
}
```

### Testing collections

```swift
@Test func arrayContainsElements() {
  let numbers = [1, 2, 3, 4, 5]
  #expect(numbers.contains(3))
  #expect(numbers.count == 5)
}
```

### Testing optionals

```swift
@Test func optionalHandling() throws {
  let result = findUser(id: 1)
  let user = try #require(result, "User should exist")
  #expect(user.name == "John")
}
```
