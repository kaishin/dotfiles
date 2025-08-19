function claude -d "Claude with personal profile (default)"
    set -x CLAUDE_CONFIG_DIR "$HOME/.claude"
    command claude $argv
end