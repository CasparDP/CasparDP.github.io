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
- **`*.qmd` files**: Site pages (index, about, papers, teaching, sides). `sides.qmd` lists public GitHub repos as project cards, organized by Teaching / Research tools / Tools & utilities.
- **`custom.scss`**: Quarto SCSS theme (dark palette, Geist font, gold accent `#E8A955`). Uses `scss:defaults` for Bootstrap variable overrides and `scss:rules` for custom styles; no `!important` needed.
- **`my_pubs.bib` / `my_working_papers.bib`**: BibTeX files driving the papers page
- **`journal-of-financial-economics.csl`**: Citation style file for bibliography formatting
- **`config.R`**: Installs required R packages (`Rscript config.R`)
- **`_extensions/`**: Quarto extensions (fontawesome, academicons, multibib)
- **`docs/`**: Built site output served by GitHub Pages

## R Dependency

Only `papers.qmd` uses R code chunks (RefManageR over the `.bib` files). Run `Rscript config.R` to install required packages. R must be available for every render since `_freeze/` is not committed.

## Key Conventions

- The theme uses Quarto's SCSS layering (`scss:defaults` then `scss:rules`), so custom rules load after Bootstrap and `!important` is not needed.
- All page-specific styles are centralized in `custom.scss`; individual `.qmd` files have no inline `<style>` blocks.
- Geist and Geist Mono are self-hosted variable fonts in `fonts/` (declared via `@font-face` in `custom.scss`, copied to output via `project.resources`). Do not reintroduce the Google Fonts CDN import; it was removed for GDPR reasons.
- The `.bib` files are the source of truth for publications; edit those, not the rendered HTML. `doi`/`url` fields drive the citation links on the papers page.
- `about.qmd` and `teaching.qmd` use plain markdown tables (styled by `custom.scss`), not R chunks.
- `index.qmd` landing page layout: profile sidebar (photo + icon links) | intro text, then full-width sections: Open Projects, Research Highlights, News & Teaching (two-column).
- The CV source lives in `~/Github/rub/cv/academic_cv.qmd`; render it there and copy the PDF here as `CV_academic.pdf`.
