# grill-with-docs

**Needs your files** — runs only where it can read and write your real files: Claude Code or Cowork.

`grill-me` with a second job: while it interviews you, it keeps your project's shared language and decisions written down. When a fuzzy term gets pinned, it updates your `CONTEXT.md` glossary on the spot. When a hard-to-reverse call gets made, it offers to record an ADR. For a codebase that already keeps a glossary and decision records.

## Install

This skill's whole job is editing files in your repo — your `CONTEXT.md` glossary, your decision records — so it needs a tool that can read and write your real files:

- **Claude Code** — put this folder in `.claude/skills/` (one project) or `~/.claude/skills/` (everywhere).
- **Cowork** — load it as a skill with access to your project files.

A claude.ai Skill, a ChatGPT GPT, or a Gemini Gem can hold the interview, but none of them can write to your files — so they can't do the part that makes this different from `grill-me`.

## Configure (optional)

A `.claude/grill-flavor.md` at your repo root routes the glossary and decision writes to wherever your repo keeps them — a different glossary path, an append-to-section format, ADRs versus concept pages. Without it, the skill defaults to a `CONTEXT.md` glossary and a `docs/adr/` decision log. The schema is documented in [`SKILL.md`](SKILL.md).

## What's inside

- [`SKILL.md`](SKILL.md) — the interview-and-document loop, plus the flavor-overlay schema
- [`CONTEXT-FORMAT.md`](CONTEXT-FORMAT.md) — the glossary entry format
- [`ADR-FORMAT.md`](ADR-FORMAT.md) — the decision-record format

## Credit

Adapted from Matt Pocock's `grill-with-docs`: <https://github.com/mattpocock/skills/tree/main/skills/engineering/grill-with-docs>
