# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal academic website for Caspar David Peter (Associate Professor, Rotterdam School of Management). Built with Quarto and deployed to GitHub Pages.

## Build & Preview

```bash
quarto preview          # Local dev server with hot reload
quarto render           # Full site build (output to docs/)
quarto render file.qmd  # Render a single page
```

The site output goes to `docs/` (configured in `_quarto.yml`), which is served by GitHub Pages.

**Deploy**: `quarto render && git add docs/ && git commit && git push` (GitHub Pages serves from `docs/` on main).

## Architecture

- **`_quarto.yml`**: Site configuration (navbar, metadata, footer, format options)
- **`*.qmd` files**: Site pages (index, about, papers, teaching)
- **`custom.scss`**: Quarto SCSS theme (dark palette, Geist font, gold accent `#E8A955`). Uses `scss:defaults` for Bootstrap variable overrides and `scss:rules` for custom styles; no `!important` needed.
- **`my_pubs.bib` / `my_working_papers.bib`**: BibTeX files driving the papers page
- **`journal-of-financial-economics.csl`**: Citation style file for bibliography formatting
- **`config.R`**: Installs required R packages (`Rscript config.R`)
- **`_extensions/`**: Quarto extensions (fontawesome, academicons, multibib)
- **`docs/`**: Built site output served by GitHub Pages

## R Dependency

Multiple pages use R code chunks (papers.qmd, about.qmd, teaching.qmd). Run `Rscript config.R` to install required packages. R must be available for every render since `_freeze/` is not committed.

## Key Conventions

- The theme uses Quarto's SCSS layering (`scss:defaults` then `scss:rules`), so custom rules load after Bootstrap and `!important` is not needed, except for table cells where kableExtra injects inline styles.
- All page-specific styles are centralized in `custom.scss`; individual `.qmd` files have no inline `<style>` blocks.
- The `.bib` files are the source of truth for publications; edit those, not the rendered HTML.
- `about.qmd` hardcodes accent colors in R `row_spec()` calls; update those if the palette changes.
- kableExtra's `kable_styling(font_size=...)` injects inline `style` attributes that override SCSS. The theme uses targeted `!important` overrides on `.table td[style]` / `.table th[style]` selectors to enforce font consistency.
- `index.qmd` landing page layout: profile sidebar (photo + icon links) | intro text, then full-width sections: Open Projects, Research Highlights, News & Teaching (two-column).
