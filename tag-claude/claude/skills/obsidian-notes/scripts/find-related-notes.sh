#!/bin/bash
# Find related notes in Obsidian vault based on keywords
# Usage: find-related-notes.sh "keyword1" "keyword2" ...
#
# Example:
#   find-related-notes.sh "transformer" "attention" "neural"
#
# Output: List of note paths that match any of the keywords

VAULT="${VAULT:-$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault}"

if [ $# -eq 0 ]; then
    echo "Usage: $0 keyword1 [keyword2] [keyword3] ..."
    echo "Searches the Obsidian vault for notes containing any of the keywords."
    exit 1
fi

# Build grep pattern from arguments
pattern=""
for keyword in "$@"; do
    if [ -z "$pattern" ]; then
        pattern="$keyword"
    else
        pattern="$pattern|$keyword"
    fi
done

# Search for matching notes, excluding hidden files and folders
grep -ril --include="*.md" -E "$pattern" "$VAULT" 2>/dev/null | \
    grep -v "/\." | \
    while read -r file; do
        # Extract just the note name (without path and extension)
        basename "$file" .md
    done | \
    sort -u | \
    head -20
