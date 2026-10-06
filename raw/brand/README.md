# raw/brand/

Your brand's own words: what you publish, what sounds right, what sounds wrong, and any guides you already have. The Marketing Brain's positioning and voice exercises read this folder. The Campaign Engine reads it only when there is no brand brain in `wiki/brand/` yet, for voice rules and samples.

`/ingest` leaves the files in this folder alone: they are module inputs, not inbox items. Drop something in the top of `raw/` instead, and `/ingest` or the next exercise you run will offer to move it here.

## What goes where

| Path | What to add | Used by |
|---|---|---|
| `urls.md` | 5 to 8 URLs, one per line: your homepage, 3 to 5 blog posts, 2 to 3 social posts | Exercises 2 and 3 |
| `scraped/` | Nothing. The exercises save scraped pages here so they are not fetched twice | Exercises 2 and 3 |
| `on-brand/` | Copy that sounds exactly right: your best emails, ads, landing page sections, posts | Exercise 3 |
| `off-brand/` | Near misses: old copy, AI drafts that felt wrong, competitor lines you would never write. URLs of pages like that go in `off-brand/urls.md` | Exercise 3 |
| `guides/` | Brand, style, or messaging docs you already have, if they are safe to share. Internal or confidential ones go in `raw/strategy/` | Exercises 2 and 3 |

Paste text into Markdown files. Label every sample with where it came from and when.

## What never goes here

This folder is committed to git. **No client material, nothing under NDA, nothing confidential.** If you work at an agency, use your own agency's brand, or the Acme Deals example.

## Example

`example/` is a complete brand set for Acme Deals, the fictional brand from the voice-of-customer example: a voice guide, on-brand ads, and off-brand ads generated for the demo. Use it to practise exercises 2 and 3, or to see what good inputs look like.
