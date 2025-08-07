# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository using thoughtbot's `rcm` (RCM) for managing configuration files across different environments. The repository uses a tag-based system to organize configurations for different tools and platforms.

## RCM Management Commands

### Installation/Sync

```bash
# Install/sync dotfiles with specific tags
rcup -t macos           # macOS-specific configurations
rcup -t fish            # Fish shell configurations
rcup -t git             # Git configurations
rcup -t nvim            # Neovim configurations
rcup -t ghostty         # Ghostty terminal configurations
rcup -t repomix         # Repomix configurations
rcup -t agent           # Agent configurations
rcup -t claude          # Claude Code configuration

# Install multiple tags at once
rcup -t fish -t git -t macos -t nvim
```

### Management

```bash
# List what would be installed
lsrc -t <tag>

# Remove dotfiles
rcdn -t <tag>
```

### Documentation

```bash
# View RCM manual pages
man rcm         # Overview of rcm suite
man rcup        # Installation command
man lsrc        # Listing command  
man rcdn        # Removal command
man mkrc        # Add files to dotfiles
man rcrc        # Configuration file format
```

## Architecture Overview

### Tag-Based Organization

The repository uses a tag-based structure where each `tag-*` directory contains configurations for specific tools or platforms:

- `tag-agent/` - Agent configuration files with global and language-specific rules
- `tag-claude/` - Claude Code configuration and settings
- `tag-fish/` - Fish shell configuration, aliases, functions, and platform-specific settings
- `tag-git/` - Git configuration and global gitignore
- `tag-ghostty/` - Ghostty terminal emulator configuration
- `tag-macos/` - macOS-specific configurations and functions
- `tag-linux/` - Linux-specific configurations
- `tag-nvim/` - Neovim configuration
- `tag-repomix/` - Repomix tool configuration
- `tag-fish-git/` - Fish shell Git integration (custom prompt)

### Platform Detection

Fish shell configuration automatically detects platform and loads appropriate settings:

- Checks for `$FISH/macos/` directory for macOS-specific settings
- Checks for `$FISH/linux/` directory for Linux-specific settings
- Sets up different PATH configurations per platform

### Agent System

The agent configuration provides coding guidelines and rules:

- `global.md` - General coding principles and practices
- `swift-*.md` - Swift-specific guidelines including TCA (The Composable Architecture) patterns
- Uses frontmatter with `alwaysApply: true` to ensure rules are automatically applied

## Key Configuration Details

### Environment Setup

- Uses `mise` for runtime management (activated in fish config)
- Homebrew paths configured for macOS
- Multiple development tool paths (pnpm, Java, Android SDK, Go, Rust)
- Claude CLI aliased to local installation

### Fish Shell Features

- Custom aliases for common operations (`.../`, Docker shortcuts, Git branch cleanup)
- Platform-specific aliases loaded conditionally
- Custom functions for specific tasks (scanitize, vectrace on macOS)
- Fundle plugin manager with bass and ssh-agent plugins

### Git Configuration

- Comprehensive alias set for common Git operations
- Uses Juxta as diff/merge tool
- GPG signing disabled, but LFS enabled
- Rebase on pull by default
- Custom log formatting with colors

### Development Tools

- Repomix configured for code analysis with XML output
- Custom ignore patterns for Swift/iOS projects
- Ghostty terminal with transparency and blur effects
- Neovim as default editor on macOS

## Claude Code Configuration

This repository includes Claude Code-specific configuration in the `claude` tag:

```bash
# Install Claude configuration
rcup -t claude

# Preview Claude configuration
lsrc -t claude
```

## MCP Server Management

- To remove an MCP server from Claude Code: `claude mcp remove <name> --scope user`

## Swift Development Guidelines

When working with Swift code in this environment:

- Follow TCA (The Composable Architecture) patterns from `swift-composable-architecture.md`
- Use Swift Testing framework (`@Test`, `#expect`) instead of XCTest
- Follow the code style guidelines in `swift-code-style.md`
- Sort properties alphabetically, group let/var declarations
- Use `@ObservableState`, `@Dependency`, and `@Reducer` macros appropriately
