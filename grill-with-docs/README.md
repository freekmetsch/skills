# grill-with-docs

`grill-me` with a second job: while it interviews you, it keeps your project's shared language and decisions written down. When a fuzzy term gets pinned, it updates your `CONTEXT.md` glossary on the spot. When a hard-to-reverse call gets made, it offers to record an ADR. For a codebase that already keeps a glossary and decision records.

## Install

A skill is a folder with a `SKILL.md` at its root.

- **Claude Code** — put this folder in `.claude/skills/` (one project) or `~/.claude/skills/` (everywhere).
- **claude.ai** — zip this folder and upload it as a Skill (paid plans).
- **ChatGPT** — load `SKILL.md`, `CONTEXT-FORMAT.md`, and `ADR-FORMAT.md` as a custom GPT's instructions and knowledge.

## Configure (optional)

A `.claude/grill-flavor.md` at your repo root routes the glossary and decision writes to wherever your repo keeps them — a different glossary path, an append-to-section format, ADRs versus concept pages. Without it, the skill defaults to a `CONTEXT.md` glossary and a `docs/adr/` decision log. The schema is documented in [`SKILL.md`](SKILL.md).

## What's inside

- [`SKILL.md`](SKILL.md) — the interview-and-document loop, plus the flavor-overlay schema
- [`CONTEXT-FORMAT.md`](CONTEXT-FORMAT.md) — the glossary entry format
- [`ADR-FORMAT.md`](ADR-FORMAT.md) — the decision-record format

## Credit

Adapted from Matt Pocock's `grill-with-docs`: <https://github.com/mattpocock/skills/tree/main/skills/engineering/grill-with-docs>
