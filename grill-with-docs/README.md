# grill-with-docs

**Needs your files** — only works in a tool that can open and edit the files on your own computer (Claude Code or Cowork).

**Use when** you keep a project's shared definitions and big decisions in text files, and you want them to stay up to date while you think a plan through out loud. grill-with-docs interviews you about your plan — one sharp question at a time, each with a recommended answer — and as the answers land, it writes the important bits down for you in two places:

- **A shared word list** (developers call this a *glossary*). When a fuzzy word finally gets pinned to one precise meaning, it records that, so the whole project uses the word the same way. By default it keeps this in a file named `CONTEXT.md`.
- **A decisions log** (these notes are called *ADRs* — short for Architecture Decision Records). When you make a call that would be expensive to undo later, it writes down what you decided and why, so future-you isn't left guessing. By default these go in a `docs/adr/` folder.

It's built for people who work inside a project folder — developers, mostly — where keeping the shared language and the reasoning behind decisions written down actually pays off.

## What you do

Install it (below), then start talking through a plan and answer its questions. When it spots a word worth pinning down or a decision worth recording, it updates the files for you. You just keep thinking.

## Install

Its whole job is editing the real files in your project, so it needs a tool that can do that:

- **Claude Code** — put this folder in `.claude/skills/` (for one project) or `~/.claude/skills/` (for all of them).
- **Cowork** — load it as a skill with access to your project files.

A Claude Skill, a ChatGPT GPT, or a Gemini Gem can run the interview, but none of them can reach your files — so they can't do the writing-it-down part, which is the whole point.

## Download

[Download grill-with-docs.zip](https://github.com/freekmetsch/skills/raw/main/grill-with-docs/grill-with-docs.zip) — the skill, its two format guides, and the licence. Or [browse the folder](.) on GitHub.

## Make it fit your project (optional)

If your project keeps its word list or its decisions somewhere other than the defaults, a small `.claude/grill-flavor.md` file at the top of your project can point grill-with-docs at the right spot. The settings are listed in [`SKILL.md`](SKILL.md).

## What's inside

- [`SKILL.md`](SKILL.md) — the interview-and-write-it-down instructions
- [`CONTEXT-FORMAT.md`](CONTEXT-FORMAT.md) — how a word-list entry is written
- [`ADR-FORMAT.md`](ADR-FORMAT.md) — how a decision is written down

## Questions?

Email me — **metschfreek@gmail.com**.

## Credit

Adapted from Matt Pocock's engineering skills: <https://github.com/mattpocock/skills/tree/main/skills/engineering>
