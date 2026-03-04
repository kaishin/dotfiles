---
name: install-pfw
description: Install Point-Free Workshop skills as symlinks in the repository's .claude/skills folder. Use when setting up PFW skills for an iOS/Swift project.
allowed-tools: Bash(which:*), Bash(ls:*), Bash(mkdir:*), Bash(ln:*)
---

# Install PFW Skills

This skill creates symlinks to Point-Free Workshop (PFW) skills in the current repository's `.claude/skills` folder. This allows iOS/Swift projects to have project-local PFW skills without polluting the global skill list.

## Instructions

When the user wants to install PFW skills for their iOS project, follow these steps in order:

### Step 1: Check if PFW is installed

```bash
which pfw
```

If PFW is not installed, inform the user they need to install it first:

1. Install via Homebrew:
   ```bash
   brew install pointfreeco/tap/pfw
   ```

2. Login to Point-Free:
   ```bash
   pfw login
   ```

3. Install PFW skills:
   ```bash
   pfw install
   ```

Then proceed to Step 2.

### Step 2: Check if PFW skills folder exists

```bash
ls -la ~/.pfw/skills/
```

If the folder doesn't exist or is empty, run:
```bash
pfw install
```

This will download the PFW skills to `~/.pfw/skills/`.

### Step 3: Create local skills directory

Create the `.claude/skills` directory if it doesn't exist:
```bash
mkdir -p .claude/skills
```

### Step 4: Create symlinks for all PFW skills

```bash
ln -sf $HOME/.pfw/skills/case-paths .claude/skills/pfw-case-paths
ln -sf $HOME/.pfw/skills/composable-architecture .claude/skills/pfw-composable-architecture
ln -sf $HOME/.pfw/skills/custom-dump .claude/skills/pfw-custom-dump
ln -sf $HOME/.pfw/skills/dependencies .claude/skills/pfw-dependencies
ln -sf $HOME/.pfw/skills/identified-collections .claude/skills/pfw-identified-collections
ln -sf $HOME/.pfw/skills/issue-reporting .claude/skills/pfw-issue-reporting
ln -sf $HOME/.pfw/skills/macro-testing .claude/skills/pfw-macro-testing
ln -sf $HOME/.pfw/skills/modern-swiftui .claude/skills/pfw-modern-swiftui
ln -sf $HOME/.pfw/skills/observable-models .claude/skills/pfw-observable-models
ln -sf $HOME/.pfw/skills/perception .claude/skills/pfw-perception
ln -sf $HOME/.pfw/skills/pfw .claude/skills/pfw-pfw
ln -sf $HOME/.pfw/skills/sharing .claude/skills/pfw-sharing
ln -sf $HOME/.pfw/skills/snapshot-testing .claude/skills/pfw-snapshot-testing
ln -sf $HOME/.pfw/skills/spm .claude/skills/pfw-spm
ln -sf $HOME/.pfw/skills/sqlite-data .claude/skills/pfw-sqlite-data
ln -sf $HOME/.pfw/skills/structured-queries .claude/skills/pfw-structured-queries
ln -sf $HOME/.pfw/skills/swift-navigation .claude/skills/pfw-swift-navigation
ln -sf $HOME/.pfw/skills/testing .claude/skills/pfw-testing
```

### Step 5: Verify the installation

```bash
ls -la .claude/skills/
```

## Available PFW Skills

The following skills will be installed:

| Skill | Description |
|-------|-------------|
| `pfw-case-paths` | Case paths for enum key paths |
| `pfw-composable-architecture` | TCA (The Composable Architecture) |
| `pfw-custom-dump` | Custom dump for debugging |
| `pfw-dependencies` | Dependency management |
| `pfw-identified-collections` | Identified collections |
| `pfw-issue-reporting` | Issue reporting utilities |
| `pfw-macro-testing` | Macro testing utilities |
| `pfw-modern-swiftui` | Modern SwiftUI patterns |
| `pfw-observable-models` | Observable models |
| `pfw-perception` | Perception for observable objects |
| `pfw-pfw` | Point-Free Workshop core |
| `pfw-sharing` | State sharing utilities |
| `pfw-snapshot-testing` | Snapshot testing |
| `pfw-spm` | Swift Package Manager utilities |
| `pfw-sqlite-data` | SQLite data management |
| `pfw-structured-queries` | Structured queries |
| `pfw-swift-navigation` | Swift navigation patterns |
| `pfw-testing` | Testing utilities |

## Prerequisites

- PFW must be installed via Homebrew: `brew install pointfreeco/tap/pfw`
- PFW must be logged in: `pfw login`
- PFW skills must be downloaded: `pfw install`
- Run this skill from the root of your iOS/Swift project

## After Installation

After installing the PFW skills:

1. The skills will be automatically loaded when working in this repository
2. Add `.claude/skills/pfw-*` to your `.gitignore` if you don't want to commit the symlinks
3. To remove the skills, simply delete the `pfw-*` symlinks from `.claude/skills/`
