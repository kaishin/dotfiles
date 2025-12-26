# Open-Source Code Explorer - Examples

This document provides detailed examples of how to use the opensource-code-explorer skill to research open-source implementations, understand library internals, and find documentation.

## Example 1: Understanding React Hooks Implementation

**User Request:**

```bash
/opensource-code-explorer How does React implement the useState hook internally?
```

**What the skill does:**

1. Uses git-ingest to explore the React repository structure
2. Searches for hook-related implementation files using Grep
3. Uses DeepWiki to find official React hooks documentation
4. Reads the core implementation files (e.g., `ReactHooks.js`, `ReactFiberHooks.js`)
5. Explains the hook implementation with code snippets and file paths

**Expected Output:**

- File paths to hook implementation (e.g., `packages/react-reconciler/src/ReactFiberHooks.js`)
- Code snippets showing the hook queue mechanism
- Explanation of the fiber architecture and hook state management
- Links to official React documentation on hooks
- Discussion of the rules of hooks and why they exist

## Example 2: Comparing Authentication Patterns

**User Request:**

```bash
/opensource-code-explorer Compare how Django and Ruby on Rails handle user authentication
```

**What the skill does:**

1. Explores both Django and Rails repositories using git-ingest
2. Finds authentication-related files in both frameworks
3. Reads implementation files for Django's auth system and Rails' Devise/authentication
4. Uses DeepWiki to find official documentation for both
5. Compares the approaches and highlights differences

**Expected Output:**

- Django auth file paths (e.g., `django/contrib/auth/`)
- Rails auth file paths (e.g., `actionpack/lib/action_controller/metal/authentication.rb`)
- Comparison of session management approaches
- Password hashing strategies
- User model implementations
- Links to official documentation for both frameworks

## Example 3: Finding Design Patterns in Vue.js

**User Request:**

```bash
/opensource-code-explorer Show me how Vue 3 implements the reactivity system with Proxy
```

**What the skill does:**

1. Uses git-ingest to get Vue 3 repository structure
2. Searches for reactivity-related files using Grep (e.g., `reactive`, `ref`, `effect`)
3. Reads core reactivity implementation files
4. Uses DeepWiki to find Vue 3 reactivity guide
5. Explains the Proxy-based reactivity with code examples

**Expected Output:**

- File paths to reactivity core (e.g., `packages/reactivity/src/reactive.ts`)
- Code snippets showing Proxy usage for reactivity
- Explanation of the dependency tracking system
- Comparison with Vue 2's Object.defineProperty approach
- Links to Vue 3 reactivity documentation
- Discussion of reactivity caveats and best practices

## Example 4: Understanding Build Tool Architecture

**User Request:**

```bash
/opensource-code-explorer How does Vite's plugin system work?
```

**What the skill does:**

1. Explores Vite repository using git-ingest
2. Searches for plugin-related code using Grep
3. Reads plugin API implementation files
4. Uses WebSearch to find Vite plugin documentation
5. Explains the plugin architecture with examples

**Expected Output:**

- File paths to plugin implementation (e.g., `packages/vite/src/node/plugin.ts`)
- Code snippets showing plugin hooks and lifecycle
- Explanation of Rollup plugin compatibility
- Examples of common plugin patterns
- Links to official Vite plugin API documentation
- List of popular Vite plugins for reference

## Example 5: Exploring Testing Framework Internals

**User Request:**

```bash
/opensource-code-explorer How does Jest implement test mocking?
```

**What the skill does:**

1. Uses git-ingest to explore Jest repository structure
2. Searches for mocking-related files using Grep
3. Reads mock implementation files (e.g., jest-mock package)
4. Uses DeepWiki to find Jest mocking documentation
5. Explains the mocking system with code examples

**Expected Output:**

- File paths to mocking implementation (e.g., `packages/jest-mock/src/index.ts`)
- Code snippets showing mock function implementation
- Explanation of module mocking vs function mocking
- Discussion of jest.fn(), jest.spyOn(), and jest.mock()
- Links to Jest mocking documentation
- Best practices for testing with mocks

## Example 6: Understanding State Management Libraries

**User Request:**

```bash
/opensource-code-explorer Explain how Redux middleware works internally
```

**What the skill does:**

1. Explores Redux repository using git-ingest
2. Searches for middleware-related code using Grep
3. Reads middleware implementation in Redux core
4. Uses DeepWiki to find Redux middleware documentation
5. Explains the middleware pipeline with examples

**Expected Output:**

- File paths to middleware implementation (e.g., `src/applyMiddleware.ts`)
- Code snippets showing the middleware chain composition
- Explanation of the store enhancer pattern
- Examples of popular middleware (redux-thunk, redux-saga)
- Links to Redux middleware documentation
- Diagram or explanation of middleware execution flow

## Example 7: Researching GraphQL Server Implementation

**User Request:**

```bash
/opensource-code-explorer How does Apollo Server handle schema stitching?
```

**What the skill does:**

1. Uses git-ingest to explore Apollo Server repository
2. Searches for schema stitching related code
3. Reads relevant implementation files
4. Uses WebSearch to find Apollo schema stitching documentation
5. Explains the schema stitching mechanism

**Expected Output:**

- File paths to schema stitching implementation
- Code snippets showing schema merging and delegation
- Explanation of the gateway pattern
- Discussion of schema stitching vs federation
- Links to Apollo documentation
- Migration guide from stitching to federation (if relevant)

## Example 8: Understanding Database ORM Internals

**User Request:**

```bash
/opensource-code-explorer How does Prisma generate TypeScript types from the schema?
```

**What the skill does:**

1. Explores Prisma repository using git-ingest
2. Searches for type generation code using Grep
3. Reads the Prisma generator implementation
4. Uses DeepWiki to find Prisma generator documentation
5. Explains the code generation process

**Expected Output:**

- File paths to generator implementation
- Code snippets showing schema parsing and type generation
- Explanation of the AST transformation process
- Discussion of runtime vs generated types
- Links to Prisma generator documentation
- Information about custom generator creation

## Example 9: Multi-Framework Comparison

**User Request:**

```bash
/opensource-code-explorer Compare routing implementations in React Router, Vue Router, and Angular Router
```

**What the skill does:**

1. Uses git-ingest to explore all three router repositories
2. Identifies routing core files in each framework
3. Compares route matching algorithms
4. Uses DeepWiki to find documentation for each
5. Presents a comprehensive comparison

**Expected Output:**

- File paths for each router implementation
- Side-by-side comparison of route definition syntax
- Comparison of navigation guards/middleware
- Discussion of lazy loading approaches
- Comparison of history management strategies
- Links to official documentation for all three
- Recommendation table showing trade-offs

## Example 10: Understanding Package Manager Architecture

**User Request:**

```bash
/opensource-code-explorer How does pnpm achieve faster installs than npm?
```

**What the skill does:**

1. Explores pnpm repository using git-ingest
2. Searches for dependency resolution and linking code
3. Reads implementation of the content-addressable store
4. Uses WebSearch to find pnpm architecture documentation
5. Explains the hard-linking strategy

**Expected Output:**

- File paths to store implementation
- Code snippets showing symlink creation
- Explanation of the content-addressable file system
- Comparison with npm's node_modules structure
- Disk space savings analysis
- Links to pnpm documentation
- Performance benchmarks and architecture diagrams

## Tips for Effective Usage

### Be Specific

Instead of:

```bash
/opensource-code-explorer Tell me about React
```

Try:

```bash
/opensource-code-explorer How does React's concurrent rendering work?
```

### Focus on Implementation Details

Instead of:

```bash
/opensource-code-explorer What is Next.js?
```

Try:

```bash
/opensource-code-explorer How does Next.js implement server-side rendering?
```

### Compare When Useful

```bash
/opensource-code-explorer Compare dependency injection in Angular vs NestJS
```

### Ask About Specific Features

```bash
/opensource-code-explorer How does Webpack's hot module replacement work?
```

## When to Use This Skill vs Regular Search

**Use this skill when:**

- You need to understand internal implementation details
- You want to see actual source code and file paths
- You're comparing implementations across projects
- You need architectural explanations with code examples
- You want to learn from production-quality code

**Use regular web search when:**

- You need tutorials or getting-started guides
- You're looking for blog posts or community discussions
- You want to find third-party packages or tools
- You need troubleshooting help for errors
