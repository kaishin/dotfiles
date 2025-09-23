function wclaude -d "Claude with work profile"
    set -x CLAUDE_CONFIG_DIR "$HOME/.claude-work"
    command claude $argv
end