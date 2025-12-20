# Slash Command Examples

This file contains real-world examples of slash commands for various use cases.

## Git & Version Control

### Basic Commit

**File:** `commit-basic.md`

```markdown
Create a clear git commit message following conventional commits format for the current staged changes.
```

### Advanced Commit with Context

**File:** `commit-advanced.md`

```markdown
---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*), Bash(git diff:*)
description: Create a detailed git commit
---

## Repository State

- Branch: !`git branch --show-current`
- Status: !`git status --short`
- Staged: !`git diff --cached --stat`

## Task

Create a commit with:

1. Conventional commit prefix (feat/fix/docs/etc.)
2. Clear summary under 50 characters
3. Detailed body explaining what and why
4. Reference any related issues
```

### Branch Cleanup

**File:** `git/cleanup-branches.md`

```markdown
---
allowed-tools: Bash(git branch:*), Bash(git remote:*)
description: Clean up merged branches
---

## Current Branches

!`git branch -a`

## Task

Identify and remove local branches that have been:

- Merged into main/master
- No longer exist on remote
- Safe to delete

Ask for confirmation before deleting.
```

### Create PR

**File:** `git/create-pr.md`

```markdown
---
allowed-tools: Bash(git:*), Bash(gh:*)
argument-hint: [PR title]
description: Create a GitHub pull request
---

## Context

- Current branch: !`git branch --show-current`
- Commits: !`git log origin/main..HEAD --oneline`
- Changes: !`git diff origin/main...HEAD --stat`

## Task

Create a GitHub PR with title: $ARGUMENTS

Include:

- Summary of changes
- Testing performed
- Screenshots if UI changes
- Related issues
```

## Code Review

### Security Review

**File:** `review/security.md`

```markdown
---
allowed-tools: Read, Grep, Glob
description: Security-focused code review
---

Review the code for security vulnerabilities:

1. Input validation issues
2. SQL injection risks
3. XSS vulnerabilities
4. Authentication/authorization flaws
5. Sensitive data exposure
6. Insecure dependencies
7. CORS misconfigurations
8. Cryptography issues

Provide specific line numbers and remediation suggestions.
```

### Performance Review

**File:** `review/performance.md`

```markdown
---
allowed-tools: Read, Grep, Glob
description: Performance-focused code review
---

Analyze code for performance issues:

1. Inefficient algorithms (O(n²) or worse)
2. Unnecessary loops or iterations
3. Memory leaks
4. Redundant calculations
5. Missing caching opportunities
6. Database query optimization
7. Bundle size concerns
8. Render performance (React/Vue)

Suggest specific optimizations with examples.
```

### Accessibility Review

**File:** `review/a11y.md`

```markdown
---
allowed-tools: Read, Grep, Glob
description: Accessibility review
---

Review code for accessibility issues:

1. Missing ARIA labels
2. Keyboard navigation support
3. Color contrast issues
4. Screen reader compatibility
5. Focus management
6. Semantic HTML usage
7. Alt text for images
8. Form labels and error messages

Reference WCAG 2.1 AA standards.
```

## Testing

### Unit Test Generator

**File:** `test/unit.md`

```markdown
---
argument-hint: [file path]
description: Generate unit tests
---

Generate comprehensive unit tests for @$ARGUMENTS

Include:

- Test suite structure
- Happy path tests
- Edge cases
- Error handling
- Mocking strategy
- Test data fixtures

Use the existing test framework in the project.
```

### E2E Test Generator

**File:** `test/e2e.md`

```markdown
---
argument-hint: [feature name]
description: Generate E2E tests
---

Create end-to-end tests for: $ARGUMENTS

Cover:

- User flows from start to finish
- Different user roles/permissions
- Error states and recovery
- Cross-browser compatibility
- Mobile responsiveness

Use Playwright or Cypress (match existing setup).
```

### Test Coverage Analysis

**File:** `test/coverage.md`

```markdown
---
allowed-tools: Bash(npm:*), Bash(yarn:*), Read, Grep
description: Analyze test coverage
---

## Current Coverage

!`npm run test:coverage` or !`yarn test:coverage`

## Task

Analyze test coverage and:

1. Identify untested files
2. Highlight critical paths without tests
3. Suggest high-priority tests to add
4. Recommend coverage improvement strategy
```

## Documentation

### API Documentation

**File:** `docs/api.md`

```markdown
---
argument-hint: [file or function name]
description: Generate API documentation
---

Generate API documentation for @$ARGUMENTS

Include:

- Function/method signature
- Parameters with types
- Return value with type
- Throws/errors
- Usage examples
- Related functions
- Version added/deprecated

Use JSDoc, TSDoc, or existing doc format.
```

### README Generator

**File:** `docs/readme.md`

```markdown
---
allowed-tools: Read, Grep, Glob, Bash(git:*)
description: Generate or update README
---

## Project Analysis

- Package info: !`cat package.json | grep -E '"name"|"description"|"version"'`
- Structure: !`tree -L 2 -I 'node_modules|dist|build'`

## Task

Create/update README.md with:

- Project title and description
- Installation instructions
- Usage examples
- Configuration options
- Development setup
- Contributing guidelines
- License information

Match the project's tone and style.
```

### Changelog Entry

**File:** `docs/changelog.md`

```markdown
---
allowed-tools: Bash(git:*), Read
argument-hint: [version]
description: Generate changelog entry
---

## Recent Changes

!`git log --oneline --since='1 week ago'`

## Task

Create changelog entry for version $ARGUMENTS following Keep a Changelog format:

- Added (new features)
- Changed (changes in existing functionality)
- Deprecated (soon-to-be removed features)
- Removed (removed features)
- Fixed (bug fixes)
- Security (security fixes)
```

## Refactoring

### Extract Component

**File:** `refactor/extract-component.md`

```markdown
---
argument-hint: [source file]
description: Extract reusable component
---

Analyze @$ARGUMENTS and:

1. Identify reusable component candidates
2. Suggest component interface/props
3. Show before/after code
4. Create the new component file
5. Update the source file to use it
6. Ensure TypeScript types are correct
```

### Simplify Function

**File:** `refactor/simplify.md`

```markdown
---
argument-hint: [file:line or function name]
description: Simplify complex code
---

Refactor $ARGUMENTS to:

1. Reduce cyclomatic complexity
2. Improve readability
3. Extract helper functions if needed
4. Add clarifying comments
5. Maintain existing behavior
6. Preserve test coverage

Show before/after comparison.
```

## Database

### Migration Generator

**File:** `db/migration.md`

```markdown
---
argument-hint: [migration description]
description: Generate database migration
---

Create database migration for: $ARGUMENTS

Include:

- Up migration (apply changes)
- Down migration (rollback)
- Proper indexing
- Foreign key constraints
- Data type validation
- Migration naming convention

Match existing migration framework (Prisma/TypeORM/Knex/etc).
```

### Query Optimizer

**File:** `db/optimize-query.md`

```markdown
---
allowed-tools: Read, Grep
description: Optimize database queries
---

Analyze database queries and suggest optimizations:

1. Add missing indexes
2. Avoid N+1 queries
3. Use eager loading where appropriate
4. Optimize JOIN operations
5. Add query result caching
6. Use database-specific features
7. Show execution plan improvements
```

## Deployment

### Deploy Checklist

**File:** `deploy/checklist.md`

```markdown
---
allowed-tools: Bash(git:*), Read, Grep
description: Pre-deployment checklist
---

## Pre-Deployment Verification

- Current branch: !`git branch --show-current`
- Uncommitted changes: !`git status --short`
- Tests: !`npm test` or !`yarn test`

## Checklist

1. All tests passing?
2. No uncommitted changes?
3. Version bumped appropriately?
4. Changelog updated?
5. Environment variables documented?
6. Database migrations ready?
7. Rollback plan documented?
8. Monitoring alerts configured?

Verify each item before deployment.
```

## Project Setup

### Component Scaffolder

**File:** `setup/new-component.md`

```markdown
---
argument-hint: [component name]
description: Create new component with boilerplate
---

Create component: $ARGUMENTS

Generate:

1. Component file with TypeScript interface
2. Test file with basic tests
3. Storybook story (if using Storybook)
4. CSS/styled-components file
5. Index file for exports

Follow project's component structure and naming conventions.
```

### Feature Setup

**File:** `setup/new-feature.md`

```markdown
---
argument-hint: [feature name]
description: Set up new feature structure
---

Set up feature: $ARGUMENTS

Create:

- Feature directory structure
- Component files
- State management (Redux/Zustand/etc)
- API service layer
- Types/interfaces
- Tests
- Documentation

Follow project architecture patterns.
```

## Swift-Specific (for your dotfiles)

### TCA Feature

**File:** `swift/tca-feature.md`

```markdown
---
argument-hint: [feature name]
description: Create TCA feature with boilerplate
---

Create TCA (The Composable Architecture) feature: $ARGUMENTS

Generate:

1. Feature reducer with @Reducer macro
2. State with @ObservableState
3. Action enum
4. Dependencies with @Dependency
5. SwiftUI view
6. Tests using Swift Testing framework

Follow swift-composable-architecture.md guidelines.
```

### Swift Test

**File:** `swift/test.md`

```markdown
---
argument-hint: [file path]
description: Generate Swift tests
---

Generate Swift tests for @$ARGUMENTS

Use Swift Testing framework:

- @Test macro (not XCTest)
- #expect assertions
- Proper test organization
- @Suite for grouping
- Test data fixtures

Follow swift-code-style.md conventions.
```

## AI/ML

### Prompt Optimizer

**File:** `ai/optimize-prompt.md`

```markdown
Review and optimize this AI prompt for:

1. Clarity and specificity
2. Proper formatting
3. Examples where helpful
4. Constraint definition
5. Output format specification
6. Edge case handling

Provide improved version with explanation.
```

## Miscellaneous

### License Header

**File:** `add-license.md`

```markdown
---
argument-hint: [file path]
description: Add license header to file
---

Add appropriate license header to @$ARGUMENTS based on project LICENSE file.

Include:

- Copyright year and holder
- License type
- SPDX identifier if applicable
```

### Dependency Audit

**File:** `audit-deps.md`

```markdown
---
allowed-tools: Bash(npm:*), Bash(yarn:*), Read
description: Audit project dependencies
---

## Dependency Analysis

!`npm list --depth=0` or !`yarn list --depth=0`

## Security Check

!`npm audit` or !`yarn audit`

## Task

Review dependencies for:

1. Security vulnerabilities
2. Outdated packages
3. Unused dependencies
4. License compatibility
5. Bundle size impact
6. Better alternatives

Suggest specific actions.
```
