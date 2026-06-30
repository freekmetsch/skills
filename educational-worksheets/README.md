# educational-worksheets

A design partner for teachers building print-ready worksheets. It asks about purpose, audience, and the flow of the page before it generates anything, offers a couple of layout options per section with the trade-offs, and builds the HTML last — so the page reflects your decisions, not a template's defaults.

The output is a print-ready HTML file: clean icons, photocopy-safe styling, page breaks that behave. Open it in a browser and print.

## Install

A skill is a folder with a `SKILL.md` at its root.

- **Claude Code** — put this folder in `.claude/skills/` (one project) or `~/.claude/skills/` (everywhere).
- **claude.ai** — upload the prebuilt [`educational-worksheets.zip`](educational-worksheets.zip) as a Skill (paid plans).
- **ChatGPT** — load `SKILL.md` and the `references/` files as a custom GPT's instructions and knowledge.

Then ask it for a worksheet — "help me build a worksheet on X" — and answer its questions.

## What's inside

- [`SKILL.md`](SKILL.md) — the design loop and the print invariants
- [`references/`](references/) — pedagogy, student-facing voice, and the CSS/print patterns
- [`examples/`](examples/) — annotated worked patterns
- [`assets/base-worksheet.html`](assets/base-worksheet.html) — the print-safe starting template
- [`build-bundle.ps1`](build-bundle.ps1) — rebuilds `educational-worksheets.zip` after you edit the source

## Build the bundle

Edited the source and want a fresh upload zip? Run `build-bundle.ps1` (PowerShell). It stages `SKILL.md`, `assets/`, `references/`, and `examples/curated-patterns.md` into `educational-worksheets.zip`.
