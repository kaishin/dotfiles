---
allowed-tools: Read, Grep, Glob, Edit, Write
argument-hint: [patch file path]
description: Apply Git patch from another repository
---

## Context

- Patch file to analyze: @$ARGUMENTS
- Current git status: !`git status`
- Current branch: !`git branch --show-current`

## Your task

Read and analyze the patch file at @$ARGUMENTS to understand:

1. **What changes are being made** - Read the patch to see what code is being added, removed, or modified
2. **Why the changes are being made** - Understand the intent and purpose from the commit message and code context
3. **Where to apply the changes** - Find the equivalent locations in this codebase

Then **implement the changes manually** by:

- Using the patch as a reference guide, not applying it mechanically
- Adapting the changes to fit this codebase's structure and patterns
- Making equivalent changes that achieve the same goal
- Following this project's code style and conventions

**Important:** Do not use `git apply` or `git am`. Instead, read the patch file, understand the intent, and implement the changes directly using Edit/Write tools.

If no patch file argument is provided, ask the user which patch file to analyze.
