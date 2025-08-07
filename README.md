# Kaishin's Dotfiles

Personal dotfiles managed with [thoughtbot/rcm](https://github.com/thoughtbot/rcm).

## Quick Start

```bash
# Install configurations for macOS
rcup -t macos

# Or install multiple configurations
rcup -t fish -t git -t macos -t nvim
```

## Available Tags

- `agent` - Coding guidelines and rules
- `claude` - Claude Code configuration
- `fish` - Fish shell configuration
- `git` - Git configuration and aliases
- `ghostty` - Ghostty terminal settings
- `macos` - macOS-specific configurations
- `linux` - Linux-specific configurations
- `nvim` - Neovim configuration
- `repomix` - Repomix tool settings

## Management

```bash
# Preview what would be installed
lsrc -t <tag>

# Remove configurations
rcdn -t <tag>
```

## Adding New Dotfiles

### Bring existing files under RCM management

```bash
# Move existing file to dotfiles and create symlink
mkrc ~/.existing/config/file

# Or manually move and install
mkdir -p ~/.dotfiles/path/to
mv ~/.existing/file ~/.dotfiles/path/to/file
rcup path/to/file
```

### Create tagged configurations

```bash
# Create a new tag directory
mkdir -p ~/.dotfiles/tag-newtool/config/newtool
mv ~/.config/newtool/config ~/.dotfiles/tag-newtool/config/newtool/
rcup -t newtool
```

### Install on new machine

```bash
# Install all dotfiles
rcup

# Install specific file
rcup path/to/file

# Install with specific tags
rcup -t fish -t git -t macos
```
