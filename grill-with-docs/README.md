# grill-with-docs

**Skill + files** — only works in a tool that can open and edit the files on your own computer (Claude Code or Cowork).

**Use when** you're working on a bigger project over a longer stretch of time, and you want to think a plan through out loud while keeping the important bits written down. grill-with-docs interviews you about your plan — one sharp question at a time, each with a recommended answer — and as the answers land, it writes two things down for you, in plain text files inside your project:

- **A shared word list** (developers call this a *glossary*). When a fuzzy word finally gets pinned to one clear meaning, it records that, so the whole project uses the word the same way. By default it keeps this in a file named `CONTEXT.md`.
- **A decisions log** (these notes are called *ADRs* — short for Architecture Decision Records). When you make a call that would be expensive to undo later, it writes down what you decided and why, so future-you isn't left guessing.

It's built for longer projects you come back to over weeks or months — anything where keeping the shared language and the reasoning behind decisions written down keeps the whole thing consistent as it grows. It doesn't care whether the project is code, a course, or a plan of any other kind.

## What you do

Install it (below), point it at your project folder, and include the files it should know about. Then start talking through a plan and answer its questions. When it spots a word worth pinning down or a decision worth recording, it updates the files for you. You just keep thinking.

## Install

Its whole job is editing the real files in your project, so it needs a tool that can do that:

- **Claude Code** — put this folder in `.claude/skills/` (for one project) or `~/.claude/skills/` (for all of them).
- **Cowork** — load it as a skill with access to your project files.

A Claude Skill, a ChatGPT GPT, or a Gemini Gem can run the interview, but none of them can reach your files — so they can't do the writing-it-down part, which is the whole point.

## Download

[Download grill-with-docs.zip](https://github.com/freekmetsch/skills/raw/main/grill-with-docs/grill-with-docs.zip) — the skill, its two format guides, and the licence. Or [browse the folder](.) on GitHub.

## What's inside

- [`SKILL.md`](SKILL.md) — the interview-and-write-it-down instructions
- [`CONTEXT-FORMAT.md`](CONTEXT-FORMAT.md) — how a word-list entry is written
- [`ADR-FORMAT.md`](ADR-FORMAT.md) — how a decision is written down

## Questions?

Email me — **metschfreek@gmail.com**.

## Credit

Adapted from Matt Pocock's engineering skills: <https://github.com/mattpocock/skills/tree/main/skills/engineering>
