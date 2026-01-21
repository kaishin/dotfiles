---
name: obsidian-notes
description: This skill should be used when the user asks to "create a note", "add a note to my vault", "write a note about", "save this to Obsidian", "make a note", "document this in Obsidian", or mentions creating notes in their Obsidian vault. Handles note creation with proper naming, folder organization, and wiki-linking.
---

# Obsidian Notes Skill

Create and organize notes in the user's Obsidian vault with proper naming conventions, folder placement, and wiki-links to related notes.

## Vault Location

The vault path is available via the `$VAULT` environment variable.

## Note Creation Workflow

### 1. Determine Note Title

Convert the topic to **Title Case with spaces**:

- "knowledge graphs" → "Knowledge Graphs.md"
- "the DSR memory model" → "The DSR Memory Model.md"
- "swift 6 concurrency" → "Swift 6 Concurrency.md"

### 2. Select Target Folder

Match the topic to one of these folders based on content:

| Folder         | Subfolders                                              | Topics                                     |
| -------------- | ------------------------------------------------------- | ------------------------------------------ |
| `Development/` | `Swift/`, `Android/`, `Web/`, `Tools/`                  | Programming, frameworks, SDKs              |
| `AI-ML/`       | `Concepts/`, `Techniques/`, `Platforms/`, `Philosophy/` | Machine learning, AI, neural networks      |
| `Finance/`     | `Trading/`, `Investing/`, `Markets/`                    | Trading, investing, markets                |
| `Knowledge/`   | —                                                       | Knowledge management, learning, algorithms |
| `Languages/`   | —                                                       | Natural languages (Chinese, Swedish, etc.) |
| `Life/`        | —                                                       | Health, hobbies, personal development      |
| `Reference/`   | —                                                       | Technical concepts, databases, business    |

**Selection logic:**

- Swift/SwiftUI/visionOS → `Development/Swift/`
- Android/Kotlin/Compose → `Development/Android/`
- Web frameworks → `Development/Web/`
- ML concepts (transformers, neural nets) → `AI-ML/Concepts/`
- ML techniques (RAG, embeddings) → `AI-ML/Techniques/`
- AI tools/platforms → `AI-ML/Platforms/`
- AI ethics/philosophy → `AI-ML/Philosophy/`
- Trading strategies → `Finance/Trading/`
- Investment topics → `Finance/Investing/`
- Market-specific → `Finance/Markets/`
- If unclear, use `Reference/`

### 3. Write Note Content

Use simple markdown format:

```markdown
# Note Title (optional, filename is usually sufficient)

Brief introduction or definition.

## Section Heading

Content with proper formatting:

- Bullet points for lists
- `code` for inline code
- Code blocks with language tags
- **Bold** for emphasis
- [[Wiki Links]] for related concepts

## Glossary (if applicable)

**Term** - Definition of the term.
```

### 4. Find and Add Wiki-Links

Search for related existing notes and add wiki-links:

```bash
# Search for related notes by keyword
grep -ril "keyword" "$VAULT" --include="*.md" | head -10
```

Add links using Obsidian wiki-link syntax: `[[Note Name]]`

Example: A note about "Vector Databases" might link to:

- `[[Embeddings]]`
- `[[Semantic Search]]`
- `[[RAG]]`

### 5. Create the Note

```bash
# Write the note to the appropriate folder
cat > "$VAULT/Folder/Subfolder/Note Title.md" << 'EOF'
Note content here...
EOF
```

## Example: Creating a Note

User request: "Create a note about attention mechanisms in transformers"

**Analysis:**

- Topic: Attention mechanisms (AI/ML concept)
- Title: "Attention Mechanisms.md"
- Folder: `AI-ML/Concepts/`
- Related notes: Search for "transformers", "neural", "deep learning"

**Execution:**

```bash
# Check for related notes
grep -ril "transformer\|attention\|neural" "$VAULT" --include="*.md"

# Create the note
cat > "$VAULT/AI-ML/Concepts/Attention Mechanisms.md" << 'EOF'
The attention mechanism allows models to focus on relevant parts of the input sequence when producing output, rather than relying on a fixed-length context vector.

## Key Concepts

**Self-Attention** - Mechanism where each position in a sequence attends to all positions in the same sequence.

**Multi-Head Attention** - Running multiple attention operations in parallel, allowing the model to attend to information from different representation subspaces.

## How It Works

1. Create Query (Q), Key (K), and Value (V) vectors from input
2. Compute attention scores: $\text{Attention}(Q,K,V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V$
3. Apply softmax to get attention weights
4. Multiply weights by values to get output

## Related

- [[Transformers]]
- [[Neural Networks]]
- [[Deep Learning Notions]]
EOF
```

## Quick Reference

### Naming Rules

- Use Title Case: "Word Word Word.md"
- Include articles: "The DSR Memory Model.md"
- Use spaces, not hyphens or underscores

### Folder Decision Tree

```txt
Is it about programming? → Development/
  Swift/iOS/visionOS? → Development/Swift/
  Android/Kotlin? → Development/Android/
  Web tech? → Development/Web/
  Other tools? → Development/Tools/

Is it about AI/ML? → AI-ML/
  Core concepts? → AI-ML/Concepts/
  Techniques/methods? → AI-ML/Techniques/
  Tools/platforms? → AI-ML/Platforms/
  Ethics/philosophy? → AI-ML/Philosophy/

Is it about money? → Finance/
  Trading? → Finance/Trading/
  Investing? → Finance/Investing/
  Markets? → Finance/Markets/

Is it about learning/knowledge? → Knowledge/
Is it about languages? → Languages/
Is it about life/health/hobbies? → Life/
Otherwise → Reference/
```

### Wiki-Link Tips

- Link to conceptually related notes
- Use exact note names (without .md extension)
- Check that linked notes exist with grep/ls
- Add 2-5 relevant links per note

## Additional Resources

For detailed vault organization, see:

- **`references/vault-structure.md`** - Complete folder structure and categorization rules

### Scripts

- **`scripts/find-related-notes.sh`** - Find related notes by keywords

  ```bash
  # Usage: find-related-notes.sh "keyword1" "keyword2" ...
  ./scripts/find-related-notes.sh "transformer" "attention"
  ```
