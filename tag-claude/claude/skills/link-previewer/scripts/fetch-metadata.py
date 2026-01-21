#!/usr/bin/env -S uv run
# /// script
# requires-python = ">=3.10"
# dependencies = [
#     "requests",
#     "beautifulsoup4",
# ]
# ///
"""
Fetch social graph metadata (OG, Twitter, title, description) from URLs.

Usage:
    # Single URL (auto-installs deps with uv)
    ./fetch-metadata.py https://example.com

    # Multiple URLs
    ./fetch-metadata.py https://example.com https://another.com

    # Batch from stdin (one URL per line)
    cat urls.txt | ./fetch-metadata.py

    # Output format (default: text, or --json)
    ./fetch-metadata.py --json https://example.com
"""

import argparse
import json
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from urllib.parse import urlparse

import requests
from bs4 import BeautifulSoup


def fetch_metadata(url: str, timeout: int = 10) -> dict:
    """Fetch and parse metadata from a URL."""
    result = {
        "url": url,
        "title": None,
        "description": None,
        "tags": [],
        "og": {},
        "twitter": {},
        "error": None,
    }

    try:
        # Validate URL
        parsed = urlparse(url)
        if not parsed.scheme:
            url = f"https://{url}"

        headers = {
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"
        }

        response = requests.get(url, headers=headers, timeout=timeout, allow_redirects=True)
        response.raise_for_status()

        soup = BeautifulSoup(response.text, "html.parser")

        # Title: prioritize og:title > twitter:title > <title>
        og_title = soup.find("meta", property="og:title")
        twitter_title = soup.find("meta", attrs={"name": "twitter:title"})
        html_title = soup.find("title")

        result["title"] = (
            og_title.get("content") if og_title else
            twitter_title.get("content") if twitter_title else
            html_title.get_text(strip=True) if html_title else None
        )

        # Description: prioritize og:description > twitter:description > meta description
        og_desc = soup.find("meta", property="og:description")
        twitter_desc = soup.find("meta", attrs={"name": "twitter:description"})
        meta_desc = soup.find("meta", attrs={"name": "description"})

        result["description"] = (
            og_desc.get("content") if og_desc else
            twitter_desc.get("content") if twitter_desc else
            meta_desc.get("content") if meta_desc else None
        )

        # Collect all OG tags
        for tag in soup.find_all("meta", property=lambda x: x and x.startswith("og:")):
            prop = tag.get("property", "").replace("og:", "")
            result["og"][prop] = tag.get("content")

        # Collect all Twitter card tags
        for tag in soup.find_all("meta", attrs={"name": lambda x: x and x.startswith("twitter:")}):
            name = tag.get("name", "").replace("twitter:", "")
            result["twitter"][name] = tag.get("content")

        # Collect tags from various sources
        tags = set()

        # Keywords meta tag
        keywords = soup.find("meta", attrs={"name": "keywords"})
        if keywords and keywords.get("content"):
            tags.update(k.strip() for k in keywords.get("content").split(",") if k.strip())

        # article:tag (common on blogs)
        for tag in soup.find_all("meta", property="article:tag"):
            if tag.get("content"):
                tags.add(tag.get("content"))

        # news_keywords
        news_kw = soup.find("meta", attrs={"name": "news_keywords"})
        if news_kw and news_kw.get("content"):
            tags.update(k.strip() for k in news_kw.get("content").split(",") if k.strip())

        result["tags"] = sorted(tags)

    except requests.exceptions.RequestException as e:
        result["error"] = str(e)
    except Exception as e:
        result["error"] = f"Parse error: {str(e)}"

    return result


def format_text(data: dict) -> str:
    """Format metadata as readable text."""
    lines = [f"URL: {data['url']}", ""]

    if data.get("error"):
        lines.append(f"Error: {data['error']}")
        return "\n".join(lines)

    if data.get("title"):
        lines.append(f"Title: {data['title']}")

    if data.get("description"):
        lines.append(f"Description: {data['description']}")

    if data.get("tags"):
        lines.append(f"Tags: {', '.join(data['tags'])}")

    # Additional OG data (excluding already shown)
    og_extra = {k: v for k, v in data.get("og", {}).items() if k not in ("title", "description")}
    if og_extra:
        lines.append("")
        lines.append("Open Graph:")
        for k, v in og_extra.items():
            lines.append(f"  {k}: {v}")

    # Additional Twitter data (excluding already shown)
    tw_extra = {k: v for k, v in data.get("twitter", {}).items() if k not in ("title", "description")}
    if tw_extra:
        lines.append("")
        lines.append("Twitter Card:")
        for k, v in tw_extra.items():
            lines.append(f"  {k}: {v}")

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(
        description="Fetch social graph metadata from URLs",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )
    parser.add_argument("urls", nargs="*", help="URLs to fetch")
    parser.add_argument("--json", action="store_true", help="Output as JSON")
    parser.add_argument("--timeout", type=int, default=10, help="Request timeout in seconds")
    parser.add_argument("--workers", type=int, default=5, help="Max concurrent requests for batch")

    args = parser.parse_args()

    # Collect URLs from arguments or stdin
    urls = args.urls
    if not urls and not sys.stdin.isatty():
        urls = [line.strip() for line in sys.stdin if line.strip()]

    if not urls:
        parser.print_help()
        sys.exit(1)

    # Fetch metadata
    results = []
    if len(urls) == 1:
        results = [fetch_metadata(urls[0], args.timeout)]
    else:
        # Batch fetch with thread pool
        with ThreadPoolExecutor(max_workers=args.workers) as executor:
            future_to_url = {
                executor.submit(fetch_metadata, url, args.timeout): url
                for url in urls
            }
            for future in as_completed(future_to_url):
                results.append(future.result())

        # Sort results by original URL order
        url_order = {url: i for i, url in enumerate(urls)}
        results.sort(key=lambda x: url_order.get(x["url"], 999))

    # Output
    if args.json:
        if len(results) == 1:
            print(json.dumps(results[0], indent=2))
        else:
            print(json.dumps(results, indent=2))
    else:
        for i, data in enumerate(results):
            if i > 0:
                print("\n" + "=" * 60 + "\n")
            print(format_text(data))


if __name__ == "__main__":
    main()
