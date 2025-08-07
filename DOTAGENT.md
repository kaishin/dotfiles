# Dotagent Workflow Guide

This document explains how dotagent works for managing AI assistant rules across multiple machines and development environments.

## What is Dotagent?

Dotagent is a multi-file AI agent configuration manager that maintains a single source of truth for AI coding assistant rules. It supports Claude Code, VS Code Copilot, Cursor, Cline, Windsurf, Zed, Amazon Q Developer, and more.

## The Problem It Solves

Different AI coding assistants use different file formats and locations for their rules:

- Claude Code: `CLAUDE.md`
- VS Code Copilot: `.github/copilot-instructions.md`
- Cursor: `.cursor/**/*.mdc`
- Cline: `.clinerules`
- Windsurf: `.windsurfrules`
- Zed: `.rules`

Managing rules across these tools manually leads to:

- Duplicated rules
- Inconsistent behavior between tools
- Maintenance overhead
- Rules getting out of sync

## The Unified Solution

Dotagent creates a unified `.agent/` directory structure using Markdown files with YAML frontmatter:

```sh
.agent/
├── global.md           # Global coding rules
├── swift/
│   ├── style.md       # Swift-specific style rules
│   └── tca.md         # TCA architecture rules
├── api/
│   └── safety.md      # API safety guidelines
└── frontend/
    └── components.md  # Frontend component rules
```

Each file follows this format:

```markdown
---
id: swift-style
title: Swift Style Guidelines
alwaysApply: true
priority: high
scope: "**/*.swift"
---

# Swift Style Guidelines

- Sort properties alphabetically
- Use `@ObservableState` for state structs
- Follow TCA patterns
```

## Workflow Across Multiple Machines

### Machine 1 (Development Setup)

1. **Initial Import**: Convert existing rules to unified format

   ```bash
   # Import all existing AI rules from current project
   dotagent import .

   # This creates .agent/ directory with unified rules
   ```

2. **Organize Rules**: Structure rules logically in `.agent/` directory

   ```bash
   .agent/
   ├── global.md
   ├── swift-style.md
   ├── swift-tca.md
   └── api-safety.md
   ```

3. **Export to Tools**: Generate tool-specific formats

   ```bash
   # Export to Claude Code
   dotagent export --format claude

   # Export to VS Code Copilot
   dotagent export --format copilot

   # Export to all supported formats
   dotagent export --formats all
   ```

4. **Version Control**: Commit the `.agent/` directory

   ```bash
   git add .agent/
   git commit -m "Add unified AI assistant rules"
   git push
   ```

### Machine 2 (New Setup)

1. **Clone Repository**: Get the dotfiles with unified rules

   ```bash
   git clone https://github.com/user/dotfiles.git
   cd dotfiles
   ```

2. **Install Dotagent**: Install the tool

   ```bash
   npm install -g dotagent
   ```

3. **Import Existing Rules**: Convert to unified format (if needed)

   ```bash
   dotagent import .
   ```

4. **Export to Local Tools**: Generate formats for tools used on this machine

   ```bash
   # Only export to tools used on this machine
   dotagent export --format claude
   dotagent export --format cursor
   ```

### Machine 3 (CI/CD or Team Member)

1. **Automated Export**: Use in CI/CD pipelines

   ```bash
   # Non-interactive export for automation
   dotagent export --format copilot --no-gitignore
   ```

2. **Team Consistency**: Everyone gets the same rules

   ```bash
   # Pull latest rules
   git pull

   # Re-export to local tools
   dotagent export --formats all
   ```

## Private Rules Management

Dotagent supports private/local rules that don't get shared:

### Private Rule Types

1. **Personal Preferences**: Individual coding style preferences
2. **Client-Specific**: Confidential project requirements
3. **Experimental**: Testing new rule ideas

### Naming Conventions

- `*.local.md` files (e.g., `preferences.local.md`)
- `/private/` subdirectories
- `private: true` in YAML frontmatter

### Example Workflow

```bash
# Create private rule
echo "---
id: my-preferences
private: true
---
# My Personal Coding Preferences
- Use vim keybindings
- Prefer functional programming" > .agent/preferences.local.md

# Export without private rules (default)
dotagent export --format claude

# Export including private rules (when needed)
dotagent export --format claude --include-private
```

## Team Collaboration Workflow

### 1. Team Lead Setup

```bash
# Create unified rules for team
dotagent import .
# Organize in .agent/ directory
# git commit and push
```

### 2. Team Member Onboarding

```bash
# Clone team repo
git clone team-repo
cd team-repo

# Install dotagent
npm install -g dotagent

# Export to their preferred AI tools
dotagent export --format cursor  # If they use Cursor
dotagent export --format claude  # If they use Claude Code
```

### 3. Rule Updates

```bash
# Team lead updates .agent/ rules
# git commit and push

# Team members pull and re-export
git pull
dotagent export --formats all
```

## Integration with RCM (This Repository)

In this dotfiles repository, dotagent complements RCM:

1. **RCM manages**: System configurations, shell setups, tool configs
2. **Dotagent manages**: AI assistant rules and keeps them in sync

### Setup Flow

```bash
# Clone dotfiles
git clone ~/.dotfiles
cd ~/.dotfiles

# Install RCM and apply dotfiles
brew install rcm
rcup -t macos -t fish -t git

# Install dotagent for AI rules
npm install -g dotagent
dotagent import .
dotagent export --format claude
```

## Best Practices

1. **Organize by Domain**: Group rules logically (language, framework, etc.)
2. **Use Descriptive IDs**: Make rule IDs clear and searchable
3. **Set Appropriate Scope**: Use scope patterns to limit rule application
4. **Version Control**: Always commit `.agent/` changes
5. **Regular Sync**: Keep rules in sync across tools and machines
6. **Document Rules**: Include clear descriptions in frontmatter
7. **Test Rules**: Verify rules work as expected in target tools
