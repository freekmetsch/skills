# skills

A few prompts and AI skills I actually use, packaged so you can take them. Each one is free — clone it, paste it, change it.

Each one carries a **suitable-for tag** — what you need to run it, not how it's packaged:

- **Any chatbot** — paste it into any chat assistant (ChatGPT, Copilot, Gemini, Claude). No setup.
- **Add to your AI app** — install it once as a Claude Skill, a ChatGPT GPT, or a Gemini Gem. Claude works best.
- **Needs your files** — runs only where it can read and write your real files: Claude Code or Cowork.

"Prompt" and "skill" describe packaging, not capability — a paste-prompt can also ship a `SKILL.md`, and an installed skill can still need your files. The tag is the part that tells you where it runs.

## What's here

### [grill-me](grill-me/) — a prompt that interviews you
*Any chatbot.* Interviews you about a half-formed idea, one question at a time, until the thing you're trying to do is actually clear. A thinking partner, not a replacement for thinking.

### [grill-with-docs](grill-with-docs/) — grill-me, plus it writes the docs
*Needs your files.* The same relentless interview, but it also keeps your project's glossary and decision records up to date as the answers land. For a codebase that already keeps a `CONTEXT.md` and ADRs.

### [educational-worksheets](educational-worksheets/) — a design partner for worksheets
*Add to your AI app.* Turns Claude into a co-designer for print-ready worksheets. It asks about purpose, audience, and the flow of the page first, offers layout options with trade-offs, and generates the HTML last.

## Installing one

Most of these ship as a folder with a `SKILL.md` at its root. Where you can install one depends on its tag:

- **Claude Code** — put the folder in `.claude/skills/` (one project) or `~/.claude/skills/` (everywhere). Works for any tag.
- **claude.ai / ChatGPT / Gemini** — upload the zip as a Claude Skill, or load `SKILL.md` plus its files into a custom GPT or a Gem. Good for an **Add to your AI app** skill. A **Needs your files** skill can hold its instructions here but can't reach your files — use Claude Code or Cowork for those.

`grill-me` is **Any chatbot** — open [grill-me](grill-me/) and paste it. (It also ships a `SKILL.md`, so you can install it too — that's optional.) `educational-worksheets` ships a prebuilt `educational-worksheets.zip` for the upload paths.

## Credits

`grill-me` and `grill-with-docs` are adapted from **Matt Pocock**'s skills — the relentless-interview-with-a-recommended-answer technique and the docs-updating workflow are his. Source: [github.com/mattpocock/skills](https://github.com/mattpocock/skills) ([grill-me](https://github.com/mattpocock/skills/tree/main/skills/productivity/grill-me) · [grill-with-docs](https://github.com/mattpocock/skills/tree/main/skills/engineering/grill-with-docs)). `educational-worksheets` is mine.

## License

[MIT](LICENSE). The grill skills derive from Matt Pocock's MIT-licensed work; the attribution is in [NOTICE](NOTICE), the credits above, and each skill's README.
