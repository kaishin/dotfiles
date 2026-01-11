---
allowed-tools: Bash
argument-hint: <search query>
description: Search documentation in Dash for libraries and SDKs
---

## Context

- Search query: $ARGUMENTS
- Dash API base URL: http://127.0.0.1:63512

## Dash API Reference

The Dash documentation viewer exposes a local HTTP API:

- `GET /docsets/list` - List all installed docsets with their identifiers
- `GET /search?query=<query>&docset_identifiers=<ids>&max_results=<n>` - Search documentation
- Results contain `load_url` to fetch actual documentation content

## Your Task

Search the Dash documentation for the query provided by the user. Follow these steps:

### 1. List Available Docsets

First, fetch the list of installed docsets:

```bash
curl -s "http://127.0.0.1:63512/docsets/list"
```

This returns docsets with their `identifier` (needed for searching) and `name`.

### 2. Search Documentation

Based on the query, determine which docset(s) are most relevant and search them:

```bash
curl -s "http://127.0.0.1:63512/search?query=<query>&docset_identifiers=<id1>,<id2>&max_results=10"
```

If the user specifies a particular library/SDK (e.g., "React hooks", "Swift UIView"), filter to the relevant docset.
If the query is general, search across all docsets by listing all identifiers.

### 3. Fetch Documentation Content

For the most relevant results, fetch the actual documentation using the `load_url` from search results:

```bash
curl -s "<load_url>"
```

The response is HTML. Extract the meaningful content (text, code examples, API signatures) and present it clearly.

### 4. Present Results

Summarize the documentation findings:

- Explain what the API/class/function does
- Include relevant code examples if present in the documentation
- Note important parameters, return types, or usage patterns
- Mention related APIs if relevant

## Important Notes

- The Dash server port may vary; the base URL is typically http://127.0.0.1:63512
- If the server is not responding, inform the user that Dash may not be running
- Parse HTML content to extract text and code, ignoring CSS/styling
- Focus on answering the user's specific question rather than dumping raw documentation
