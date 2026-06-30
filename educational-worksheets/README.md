# Educational Worksheets

**Add to your AI app** — install it once (as a Claude Skill, a ChatGPT GPT, or a Gemini Gem). Claude works best.

**Use when** you're a teacher making a worksheet or handout and you want it to fit your actual lesson, not a generic template. Ask a chatbot for "a worksheet on X" and it picks a structure, fills in plausible content, and quietly makes the design choices you should have made. This does the opposite: it's a design partner, not a template dispenser.

It asks what the worksheet is for, who it's for, and how the page should flow before it makes anything. Then it offers you a few layout options per section, each with its trade-off, and only builds once you've chosen. The page ends up reflecting your decisions, not a default. What you get is a print-ready page: clean icons, photocopy-safe styling, page breaks that fall where they should. Open it in a browser and print.

## What you do

Install it (below), then ask it for a worksheet — "help me build a worksheet on X" — and answer its questions. It surfaces options; you pick; it builds.

## Download & install

[Download educational-worksheets.zip](https://github.com/freekmetsch/skills/raw/main/educational-worksheets/educational-worksheets.zip) — that's the file you upload.

- **Claude (claude.ai or Claude Code)** — upload the zip as a Skill (paid plans), or drop the folder in `.claude/skills/`. **Claude gives the best results** — it follows the design steps most faithfully.
- **ChatGPT** — make a custom GPT and load `SKILL.md` plus the `references/` files as its instructions and knowledge.
- **Gemini** — load the same files into a Gem.

One exception: **Microsoft Copilot's basic tier can't run it well** — it has too little room to work with, so it skips the questions and hands back a template (I tested this at HU).

## What's inside

- [`SKILL.md`](SKILL.md) — the design steps and the print rules
- [`references/`](references/) — the teaching principles, the student-facing writing style, and the print/layout patterns
- [`examples/`](examples/) — worked examples to learn from
- [`assets/base-worksheet.html`](assets/base-worksheet.html) — the print-safe starting page
- [`build-bundle.ps1`](build-bundle.ps1) — rebuilds the zip after you edit the source

## Questions?

Email me — **metschfreek@gmail.com**.
