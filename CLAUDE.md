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
- **`styles.css`**: Custom dark theme (Battlestar Galactica inspired). Uses Space Mono (headings) and Work Sans (body) fonts. Primary accent color: `#ff9e45`. All CSS uses `!important` overrides on Bootstrap/Quarto defaults.
- **`my_pubs.bib` / `my_working_papers.bib`**: BibTeX files driving the papers page
- **`journal-of-financial-economics.csl`**: Citation style file for bibliography formatting
- **`config.R`**: Installs required R packages (`Rscript config.R`)
- **`_extensions/`**: Quarto extensions (fontawesome, academicons, multibib)
- **`docs/`**: Built site output served by GitHub Pages

## R Dependency

Multiple pages use R code chunks (papers.qmd, about.qmd, teaching.qmd). Run `Rscript config.R` to install required packages. R must be available for every render since `_freeze/` is not committed.

## Key Conventions

- The CSS theme is aggressive with `!important` on nearly everything; new styles must follow the same pattern to take effect.
- Several `.qmd` files (index, papers, about) contain inline `<style>` blocks for page-specific CSS in addition to `styles.css`.
- The `.bib` files are the source of truth for publications; edit those, not the rendered HTML.
