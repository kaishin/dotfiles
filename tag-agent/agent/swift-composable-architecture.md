---
description: An overview of the TCA architecture (The Composable Architecture).
alwaysApply: false
---

# TCA Overview

## State Management

- _Reducer Protocol_: Core interface for organizing feature logic
- _ObservableState_: Enables reactivity with SwiftUI views
- _Effect_: Handles side effects and asynchronous operations
- _Store_: Runtime container that coordinates state and actions

### Reducer Protocol

The `Reducer` protocol is the cornerstone of TCA's architecture. It defines how state changes in response to actions and what effects should be executed.

```swift
@Reducer
struct MyFeature {
  struct State { /* ... */ }
  enum Action { /* ... */ }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      // Logic to handle each action
      // Return effects if needed
    }
  }
}
```

The `@Reducer` macro standardizes feature implementation and enables powerful composition through reducer operators like `ifLet`, `forEach`, etc.

### ObservableState

Introduced with the TCA Observation system, `@ObservableState` is a property wrapper that makes state changes automatically propagate to SwiftUI views without verbose observation patterns:

```swift
@Reducer
struct MyFeature {
  @ObservableState
  struct State {
    var count = 0
    var isLoading = false
  }
  // ...
}
```

This allows for cleaner view implementations where changes to state automatically trigger view updates.

### Effect

Effects represent asynchronous operations that can feed data back into the system. The main API for creating effects is `Effect.run`:

```swift
return .run { send in
  let result = try await apiClient.fetchData()
  await send(.dataResponse(result))
}
```

Effects can:

- Make network requests
- Interact with the file system
- Handle timers
- Process user events
- Communicate with system frameworks

They are cancellable, can be scheduled with priorities, and can be composed together.

### Store

The Store is the runtime container that powers features. It:

1. Holds the current state
2. Processes actions through reducers
3. Executes effects
4. Provides state to views

```swift
let store = Store(initialState: MyFeature.State()) {
  MyFeature()
} withDependencies: {
  $0.uuid = .incrementing
  $0.apiClient = .mock
}
```

Stores can be scoped to focus on specific parts of state, making it possible to pass only relevant portions of state to child views:

```swift
let childStore = store.scope(state: \.child, action: \.child)
```

This architecture creates a unidirectional data flow where actions propagate through reducers to produce new state and effects, which can then produce new actions to continue the cycle.

## Feature Composition in TCA

### Scope Operator

The `Scope` reducer transforms a child reducer to work with parent state:

```swift
var body: some ReducerOf<Self> {
  Scope(state: \.child, action: \.child) {
    ChildFeature()
  }
}
```

### Parent-Child Communication

TCA standardizes communication between parent and child features.

Child features can communicate with parents through delegate actions:

```swift
// In child feature
enum Action {
  case delegate(DelegateAction)
  // ...
}

enum DelegateAction {
  case didComplete(Result)
  case didCancel
}

// In parent feature
case child(.delegate(.didComplete(let result))):
  // Handle the result
```

# TCA Dependencies

Dependencies in an application are the types and functions that with outside systems that you do not control. Classic examples of this are API clients that make network requests to servers, but also seemingly innocuous things such as UUID and Date initializers, and even clocks, can be thought of as dependencies.

By controlling the dependencies our features need to do their job we gain the ability to completely alter the execution context a feature runs in. This means in tests and Xcode previews you can provide a mock version of an API client that immediately returns some stubbed data rather than making a live network request to a server.

The dependency management system in the Composable Architecture is driven off of the Dependencies library.

It is possible to change the dependencies for just one particular reducer inside a larger composed reducer. This can be handy when running a feature in a more controlled environment where it may not be appropriate to communicate with the outside world.
For example, suppose you want to teach users how to use your feature through an onboarding experience. In such an experience it may not be appropriate for the user’s actions to cause data to be written to disk, or user defaults to be written, or any number of things. It would be better to use mock versions of those dependencies so that the user can interact with your feature in a fully controlled environment.
To do this you can use the dependency(_:_:) method to override a reducer’s dependency with another value:

```swift
@Reducer
struct Onboarding {
  var body: some Reducer<State, Action> {
    Reduce { state, action in
      // Additional onboarding logic
    }
    Feature()
      .dependency(\.userDefaults, .mock)
      .dependency(\.database, .mock)
  }
}
```

This will cause the Feature reducer to use a mock user defaults and database dependency, as well as any reducer Feature uses under the hood, and any effects produced by Feature.

## Registering dependencies

Although the library comes with many controllable dependencies out of the box, there are still times
when you want to register your own dependencies with the library so that you can use them with the
`Dependency` property wrapper. There are a couple ways to achieve this, and the process is quite
similar to registering a value with the environment in SwiftUI.

First you create a `DependencyKey` protocol conformance. The minimum implementation you must
provide is a `DependencyKey/liveValue`, which is the value used when running the app in a
simulator or on device, and so it's appropriate for it to actually make network requests to an
external server. It is usually convenient to conform the type of dependency directly to this
protocol:

```swift
extension APIClient: DependencyKey {
  static let liveValue = APIClient(/*
    Construct the "live" API client that actually makes network
    requests and communicates with the outside world.
  */)
}
```

> Tip: There are two other values you can provide for a dependency. If you implement
> `DependencyKey/testValue` it will be used when running features in tests, and if you
> implement `previewValue` it will be used while running features in an Xcode preview. You don't
> need to worry about those values when you are just getting started, and instead can add them
> later.

With that done you can instantly access your API client dependency from any part of your code base:

```swift
@Reducer
struct Onboarding {
  @Dependency(APIClient.self) var apiClient

  //...
}
```

This will automatically use the live dependency in previews, simulators and devices, and in tests
you can override the dependency to return mock data:

```swift
@MainActor
@Test
func fetchUser() async {
  let store = TestStore(initialState: Onboarding.State()) {
    Onboarding()
  }

  withDependencies {
    $0.apiClient.fetchUser = { _ in User(id: 1, name: "Blob") }
  } operation: {
    await store.loadButtonTapped()

    #expect(
      model.todos == [Todo(id: 1, title: "Get milk")]
    )
  }
}
```

## Test value

The `TestDependencyKey/testValue` static property from the `TestDependencyKey` protocol should
be implemented if you want to provide a specific implementation of your dependency for all tests. At
a bare minimum you should provide an implementation of your dependency that does not reach out to
the real world. This means it should not make network requests, should not sleep for real-world
time, should not touch the file system, etc.

This can guarantee that a whole class of bugs do not happen in your code when running tests. For
example, suppose you have a dependency for tracking user events with your analytics server. If you
allow this dependency to be used in an uncontrolled manner in tests you run the risk of accidentally
tracking events that do not actually correspond to user actions, and therefore will result in bad,
unreliable data.

Another example of a dependency you want to control during tests is access to the file system. If
your feature writes a file to disk during a test, then that file will remain there for subsequent
runs of other tests. This causes testing artifacts to bleed over into other tests, which can cause
confusing failures.

So, providing a `TestDependencyKey/testValue` can be very useful, but even better, we highly
encourage users of TCA to provide what is known as "unimplemented" versions of their
dependencies for their `TestDependencyKey/testValue`. These are implementations that cause a test
failure if any of its endpoints are invoked.

You can use the Issue Reporting library to aid in this, which is
immediately accessible as a transitive dependency. It comes with a function called
`unimplemented` that can return a function of nearly any signature with the
property that if it is invoked it will cause a test failure. For example, the hypothetical analytics
dependency we considered a moment ago can be given such a `testValue` like so:

```swift
struct AnalyticsClient {
  var track: (String, [String: String]) async throws -> Void
}

import Dependencies

extension AnalyticsClient: TestDependencyKey {
  static let testValue = Self(
    track: unimplemented("AnalyticsClient.track")
  )
}
```

This makes it so that if your feature ever makes use of the `track` endpoint on the analytics client
without you specifically overriding it, you will get a test failure. This makes it easy to be
notified if you ever start tracking new events without writing a test for it, which can be
incredibly powerful.

## Preview value

We've now seen that `DependencyKey/liveValue` is an appropriate place to put dependency
implementations that reach out to the outside world, and `TestDependencyKey/testValue` is an
appropriate place to put dependency implementations that refrain from interacting with the outside
world. Even better if the `testValue` actually causes a test failure if any of its endpoints are
accessed.

There's a third kind of implementation that you can provide that sits somewhere between
`DependencyKey/liveValue` and `TestDependencyKey/testValue`: it's called
`TestDependencyKey/previewValue`. It will be used whenever your feature is run in an Xcode
preview.

Xcode previews are similar to tests in that you usually do not want to interact with the outside
world, such as making network requests. In fact, many of Apple's frameworks do not work in previews,
such as Core Location, and so it will be hard to interact with your feature in previews if it
touches those frameworks.

However, Xcode previews are dissimilar to tests in that it's fine for dependencies to return some
mock data. There's no need to deal with "unimplemented" clients for proving which dependencies are
actually used.

For example, suppose you have an API client with some endpoints for fetching users. You do not want
to make live, network requests in Swift previews because that will cause previews to run slowly. So,
you can provide a `TestDependencyKey/previewValue` implementation that synchronously and
immediately returns some mock data:

```swift
extension APIClient: TestDependencyKey {
  static let previewValue = Self(
    fetchUsers: {
      [
        User(id: 1, name: "Blob"),
        User(id: 2, name: "Blob Jr."),
        User(id: 3, name: "Blob Sr."),
      ]
    },
    fetchUser: { id in
      User(id: id, name: "Blob, id: \(id)")
    }
  )
}
```

> Note: The `previewValue` implementation must be defined in the same module as the
> `TestDependencyKey` conformance. If you end up separating the interface and implementation of your
> dependency, as shown in <doc:LivePreviewTest#Separating-interface-and-implementation>, then it
> must be defined the interface module, not the implementation module.

Then when running a feature that uses this dependency in an Xcode preview, it will immediately get
data provided to it, making it easier for you to iterate on your feature's logic and styling.

You can also always override dependencies for the preview if you want to test out a specific
configuration of data.

## Feature Composition Patterns

### Nested Features

Complex features can compose multiple child features:

```swift
struct AppFeature {
  struct State {
    var login: LoginFeature.State?
    var dashboard: DashboardFeature.State?
    var settings: SettingsFeature.State?
    // ...
  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      // Core app logic
    }
    .ifLet(\.login, action: \.login) {
      LoginFeature()
    }
    .ifLet(\.dashboard, action: \.dashboard) {
      DashboardFeature()
    }
    .ifLet(\.settings, action: \.settings) {
      SettingsFeature()
    }
  }
}
```

### Reusable Components

TCA encourages creating reusable components that can be integrated into different features:

```swift
// A reusable pagination component
struct PaginationFeature<Element> {
  struct State { /* ... */ }
  enum Action { /* ... */ }

  var body: some ReducerOf<Self> { /* ... */ }
}

// Used in different features
struct UsersFeature {
  struct State {
    var pagination: PaginationFeature<User>.State
    // ...
  }
  // ...
}
```

Feature composition in TCA provides a standardized approach to building complex applications from smaller, testable pieces while maintaining clear boundaries and communication paths.

## Navigation

TCA offers two primary approaches to navigation, each with distinct advantages:

### Tree-Based Navigation

Tree-based navigation uses optionals and enums to model navigation paths, creating a tree-like structure of state.

#### The `@Presents` Macro

The `@Presents` macro marks state that drives presentation:

```swift
@Reducer
struct FeatureA {
  @ObservableState
  struct State {
    @Presents var detailSheet: DetailFeature.State?
    // ...
  }

  enum Action {
    case detailSheet(PresentationAction<DetailFeature.Action>)
    case showDetailButtonTapped
    // ...
  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .showDetailButtonTapped:
        state.detailSheet = DetailFeature.State()
        return .none
      // ...
      }
    }
    .ifLet(\.$detailSheet, action: \.detailSheet) {
      DetailFeature()
    }
  }
}
```

#### Using Enum State for Multiple Destinations

For features with multiple possible destinations, enums provide a cleaner approach:

```swift
@Reducer
struct FeatureA {
  @ObservableState
  struct State {
    @Presents var destination: Destination.State?
    // ...
  }

  enum Action {
    case destination(PresentationAction<Destination.Action>)
    // ...
  }

  @Reducer
  enum Destination {
    case detail(DetailFeature)
    case settings(SettingsFeature)
    case help(HelpFeature)
  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      // ...
    }
    .ifLet(\.$destination, action: \.destination)
  }
}
```

### View Integration

In SwiftUI views, navigation is handled with standard modifiers:

```swift
struct FeatureAView: View {
  @Bindable var store: StoreOf<FeatureA>

  var body: some View {
    List {
      // ...
    }
    .sheet(
      item: $store.scope(state: \.destination?.detail, action: \.destination.detail)
    ) { store in
      DetailView(store: store)
    }
    .popover(
      item: $store.scope(state: \.destination?.settings, action: \.destination.settings)
    ) { store in
      SettingsView(store: store)
    }
  }
}
```

### Stack-Based Navigation

Stack-based navigation uses collections to model navigation paths, suitable for deep or recursive navigation.

#### StackState and StackAction

```swift
@Reducer
struct AppFeature {
  @ObservableState
  struct State {
    var path = StackState<Path.State>()
    var items: IdentifiedArrayOf<Item> = []
  }

  enum Action {
    case path(StackActionOf<Path>)
    case itemTapped(Item.ID)
    // ...
  }

  @Reducer
  enum Path {
    case detail(DetailFeature)
    case edit(EditFeature)
    case settings(SettingsFeature)
  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case let .itemTapped(id):
        guard let item = state.items[id: id] else { return .none }
        state.path.append(.detail(DetailFeature.State(item: item)))
        return .none
      // ...
      }
    }
    .forEach(\.path, action: \.path)
  }
}
```

#### View Integration with NavigationStack

```swift
struct AppView: View {
  @Bindable var store: StoreOf<AppFeature>

  var body: some View {
    NavigationStack(
      path: $store.scope(state: \.path, action: \.path)
    ) {
      List {
        ForEach(store.items) { item in
          Button(item.name) {
            store.send(.itemTapped(item.id))
          }
        }
      }
    } destination: { store in
      switch store.case {
      case .detail(let store):
        DetailView(store: store)
      case .edit(let store):
        EditView(store: store)
      case .settings(let store):
        SettingsView(store: store)
      }
    }
  }
}
```

## Dismissal

TCA provides a built-in dependency for dismissing features without direct parent communication:

```swift
@Reducer
struct DetailFeature {
  // ...
  @Dependency(\.dismiss) var dismiss

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .closeButtonTapped:
        return .run { _ in await self.dismiss() }
      // ...
      }
    }
  }
}
```

## Shared State

The Composable Architecture provides robust tools for sharing state across features while maintaining value semantics and testability.

### The `@Shared` Property Wrapper

`@Shared` is the primary tool for sharing state across features. It creates a reference that multiple features can access:

```swift
@Reducer
struct FeatureA {
  @ObservableState
  struct State {
    @Shared var count: Int // Shared state
    // ...
  }
}

@Reducer
struct FeatureB {
  @ObservableState
  struct State {
    @Shared var count: Int // Same shared state
    // ...
  }
}
```

When passing shared state from parent to child:

```swift
// In parent
state.child = ChildFeature.State(count: state.$count)
```

### Persistence Strategies

TCA offers three built-in persistence strategies:

#### In-Memory (Non-Persisted)

The simplest form, where state is shared but not persisted across app launches:

```swift
@Shared(.inMemory("count")) var count = 0
```

#### App Storage (UserDefaults)

Persists simple values using UserDefaults:

```swift
@Shared(.appStorage("count")) var count = 0
```

#### File Storage

Persists complex `Codable` data to the file system:

```swift
@Shared(.fileStorage(URL(fileURLWithPath: "/path/to/file"))) var users: [User] = []
```

### Thread-Safe Mutations

Because shared state has reference semantics, TCA provides a thread-safe mutation API:

```swift
// Safely mutate shared state
state.$count.withLock { $0 += 1 }
```

### Observing Changes

You can observe changes to shared state:

```swift
return .publisher {
  state.$count.publisher
    .map(Action.countChanged)
}
```

### Type-Safe Keys

For improved type safety, you can define type-safe keys:

```swift
extension SharedReaderKey where Self == AppStorageKey<Int> {
  static var count: Self {
    appStorage("count")
  }
}

// Usage
@Shared(.count) var count = 0
```

### Read-Only Shared State

For state that should be readable but not writable:

```swift
@SharedReader(.remoteConfig) var config
```

---

## Side Effects

Side effects in TCA represent operations that interact with the outside world, such as network requests, file system access, timers, and more. They're one of the most critical aspects of the architecture, as they enable features to have meaningful impact.

### The `Effect` Type

Effects are represented by the `Effect` type, which encapsulates asynchronous work that can produce actions to feed back into the system. The primary way to create effects is through `Effect.run`:

```swift
return .run { send in
  // Perform async work
  let response = try await apiClient.fetchUser(id: userID)
  // Send actions back into the system
  await send(.userResponse(.success(response)))
}
```

#### Key Characteristics of Effects

##### Cancellation

Effects can be cancelled when they're no longer needed:

```swift
enum Action {
  case startTimerButtonTapped
  case stopTimerButtonTapped
  case timerTick
}

var body: some ReducerOf<Self> {
  Reduce { state, action in
    switch action {
    case .startTimerButtonTapped:
      return .run { send in
        for await _ in self.clock.timer(interval: .seconds(1)) {
          await send(.timerTick)
        }
      }
      .cancellable(id: TimerID())

    case .stopTimerButtonTapped:
      return .cancel(id: TimerID())

    case .timerTick:
      state.count += 1
      return .none
    }
  }
}
```

##### Task Priorities

Effects can specify their execution priority:

```swift
return .run(priority: .userInitiated) { send in
  // High-priority work
}
```

##### Error Handling

Effects provide structured error handling:

```swift
return .run { send in
  do {
    let response = try await apiClient.fetchUser(id: userID)
    await send(.userResponse(.success(response)))
  } catch {
    await send(.userResponse(.failure(error)))
  }
}
```

#### Common Effect Patterns

#### Debouncing

```swift
@Reducer
struct SearchFeature {
  @Dependency(\.continuousClock) var clock

  enum CancelID { case search }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case let .searchQueryChanged(query):
        state.query = query

        // Debounce by cancelling previous search and starting a new one
        return .run { send in
          try await clock.sleep(for: .milliseconds(300))
          await send(.searchResponse(query))
        }
        .cancellable(id: CancelID.search, cancelInFlight: true)
      }
    }
  }
}
```

#### Sequence of Operations

```swift
return .run { send in
  await send(.step1Started)
  try await step1()

  await send(.step2Started)
  let result = try await step2()

  await send(.step3Started(result))
  try await step3(result)

  await send(.sequenceCompleted)
}
```

#### Concurrent Operations

```swift
return .run { send in
  async let result1 = operation1()
  async let result2 = operation2()
  async let result3 = operation3()

  let (r1, r2, r3) = try await (result1, result2, result3)
  await send(.allOperationsCompleted(r1, r2, r3))
}
```

# Testing in The Composable Architecture (TCA)

TCA provides robust tools for testing your features in a comprehensive way. Here's how to effectively test your TCA applications:

## Basic State Testing

The key tool for testing is `TestStore`, which lets you verify state changes and effects:

```swift
@MainActor
struct CounterTests {
  @Test
  func basicIncrement() async {
    let store = TestStore(initialState: CounterFeature.State(count: 0)) {
      CounterFeature()
    }

    await store.send(.incrementButtonTapped) {
      $0.count = 1
    }
  }
}
```

## Testing Effects

For effects, use `receive` to assert on actions sent back to the store:

```swift
@Test
func loadOnAppear() async {
  let store = TestStore(initialState: FeatureState()) {
    Feature()
  } withDependencies: {
    $0.dataClient = .mock(
      fetch: { "Test Data" }
    )
  }

  await store.send(.onAppear)
  await store.receive(\.dataResponse) {
    $0.data = "Test Data"
  }
}
```

## Long-Running Effects

For time-based effects, use controllable clocks instead of real time:

```swift
@Test
func timerTest() async {
  let store = TestStore(initialState: TimerFeature.State()) {
    TimerFeature()
  }

  let testQueue = DispatchQueue.test

  withDependencies {
    $0.mainQueue = testQueue
  } operation: {
    await store.send(.startButtonTapped)
    await testQueue.advance(by: .milliseconds(300))

    await store.receive(\.timerTick) {
      $0.count = 1
    }
  }
}
```

## Testing Shared State

When testing features with shared state:

```swift
// Feature
@Reducer
struct Feature {
  struct State: Equatable {
    @Shared var count: Int
  }

  enum Action {
    case incrementButtonTapped
  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .incrementButtonTapped:
        state.$count.withLock { $0 += 1 }
        return .none
      }
    }
  }
}

// Test
@Test
func increment() async {
  let store = TestStore(initialState: Feature.State(count: Shared(0))) {
    Feature()
  }

  await store.send(.incrementButtonTapped) {
    $0.$count.withLock { $0 = 1 }
  }
}
```

## Non-Exhaustive Testing

For complex features or integration tests, you can use non-exhaustive testing:

```swift
@Test
func integrationTest() async {
  let store = TestStore(initialState: ParentFeature.State()) {
    ParentFeature()
  }

  store.exhaustivity = .off

  // Only assert on the parts you care about
  await store.send(\.child.buttonTapped)
  await store.receive(\.child.delegate.didComplete) {
    $0.isComplete = true
  }
}
```

## Testing Navigation

For testing navigation flows:

```swift
@Test
func navigationTest() async {
  let store = TestStore(initialState: RootFeature.State()) {
    RootFeature()
  }

  await store.send(.showDetailButtonTapped) {
    $0.destination = .detail(DetailFeature.State())
  }

  await store.send(\.destination.detail.closeButtonTapped)
  await store.receive(\.destination.dismiss) {
    $0.destination = nil
  }
}
```
