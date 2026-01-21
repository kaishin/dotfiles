---
name: link-previewer
description: Use when the user asks to "preview a link", "get link metadata", "fetch OG tags", "get social graph data", "extract title and description from URL", or needs to analyze URLs for their social sharing metadata. Handles single URLs and batch processing.
---

# Link Previewer

Extract social graph metadata (Open Graph, Twitter Cards, title, description, tags) from URLs using a Python script.

## Requirements

Requires `uv` (dependencies auto-install on first run via PEP 723 inline script metadata).

## Usage

### Single URL

```bash
./scripts/fetch-metadata.py https://example.com
```

### Multiple URLs

```bash
./scripts/fetch-metadata.py https://example.com https://another.com
```

### Batch from File

```bash
cat urls.txt | ./scripts/fetch-metadata.py
```

### JSON Output

```bash
./scripts/fetch-metadata.py --json https://example.com
```

## Output Fields

| Field | Source Priority |
|-------|-----------------|
| **title** | og:title > twitter:title > `<title>` |
| **description** | og:description > twitter:description > meta description |
| **tags** | keywords meta, article:tag, news_keywords |
| **og** | All `og:*` meta properties |
| **twitter** | All `twitter:*` meta properties |

## Example Output

**Text format:**

```
URL: https://github.com

Title: GitHub: Let's build from here
Description: GitHub is where over 100 million developers shape the future of software...
Tags: code, development, git, github, programming

Open Graph:
  type: website
  image: https://github.githubassets.com/images/modules/site/social-cards/campaign-social.png
  site_name: GitHub

Twitter Card:
  card: summary_large_image
  site: @github
```

**JSON format (--json):**

```json
{
  "url": "https://github.com",
  "title": "GitHub: Let's build from here",
  "description": "GitHub is where over 100 million developers...",
  "tags": ["code", "development", "git"],
  "og": {
    "title": "GitHub",
    "type": "website",
    "image": "https://..."
  },
  "twitter": {
    "card": "summary_large_image",
    "site": "@github"
  },
  "error": null
}
```

## Script Options

| Option | Default | Description |
|--------|---------|-------------|
| `--json` | false | Output as JSON |
| `--timeout` | 10 | Request timeout in seconds |
| `--workers` | 5 | Max concurrent requests for batch |

## Post-Processing: Rewrite Descriptions

The raw OG/meta descriptions are often marketing copy. After fetching metadata, **rewrite the description** to be factual and useful:

### Guidelines

1. **Strip marketing language** - Remove superlatives, buzzwords, and promotional fluff
2. **State what it actually is** - Product, service, tool, article, etc.
3. **Be specific** - What does it do? Who is it for?
4. **Keep it brief** - 1-2 sentences max

### Examples

| Raw Description | Rewritten |
|-----------------|-----------|
| "GitHub is where over 100 million developers shape the future of software, together." | "Code hosting platform for version control and collaboration using Git." |
| "Discover the innovative world of Apple and shop everything iPhone, iPad..." | "Consumer electronics company. Manufacturer of iPhone, iPad, Mac, and related software." |
| "Anthropic is an AI safety company working to build reliable, interpretable, and steerable AI systems." | "AI research company focused on AI safety. Creator of Claude." |

### Output Format

After rewriting, present results as:

```markdown
**Title:** [cleaned title without site name suffix]
**Description:** [rewritten factual description]
**Tags:** [comma-separated relevant tags]
```

For batch URLs, use a markdown table:

| URL | Title | Description | Tags |
| --- | ----- | ----------- | ---- |
| ... | ...   | ...         | ...  |

## Common Use Cases

1. **Generate link previews** for a list of bookmarks
2. **Audit OG tags** before sharing on social media
3. **Extract metadata** for content aggregation
4. **Validate social cards** are properly configured
