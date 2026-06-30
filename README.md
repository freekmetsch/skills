# skills

A few prompts and Claude skills I actually use, packaged so you can take them. Each one is free — clone it, paste it, change it.

Two kinds of thing live here:

- **Prompts** you paste into any chat assistant (ChatGPT, Copilot, Claude). No setup.
- **Skills** you install once — a `SKILL.md` plus its files — that give Claude a specific job and the steps to do it. They run in Claude Code, as an uploaded Skill on claude.ai, or as a custom GPT.

## What's here

### [grill-me](grill-me/) — a prompt that interviews you
*Prompt · paste-ready.* Interviews you about a half-formed idea, one question at a time, until the thing you're trying to do is actually clear. A thinking partner, not a replacement for thinking.

### [grill-with-docs](grill-with-docs/) — grill-me, plus it writes the docs
*Skill.* The same relentless interview, but it also keeps your project's glossary and decision records up to date as the answers land. For a codebase that already keeps a `CONTEXT.md` and ADRs.

### [educational-worksheets](educational-worksheets/) — a design partner for worksheets
*Skill.* Turns Claude into a co-designer for print-ready worksheets. It asks about purpose, audience, and the flow of the page first, offers layout options with trade-offs, and generates the HTML last.

## Installing a skill

A skill is a folder with a `SKILL.md` at its root. To use one:

- **Claude Code** — put the folder in `.claude/skills/` (one project) or `~/.claude/skills/` (everywhere).
- **claude.ai** — zip the folder and upload it as a Skill (paid plans).
- **ChatGPT** — load `SKILL.md` and its files as a custom GPT's instructions and knowledge.

`grill-me` is a prompt, not a skill — open [grill-me](grill-me/) and paste it. `educational-worksheets` ships a prebuilt `educational-worksheets.zip` for the upload paths.

## Credits

`grill-me` and `grill-with-docs` are adapted from **Matt Pocock**'s skills — the relentless-interview-with-a-recommended-answer technique and the docs-updating workflow are his. Source: [github.com/mattpocock/skills](https://github.com/mattpocock/skills) ([grill-me](https://github.com/mattpocock/skills/tree/main/skills/productivity/grill-me) · [grill-with-docs](https://github.com/mattpocock/skills/tree/main/skills/engineering/grill-with-docs)). `educational-worksheets` is mine.

## License

[MIT](LICENSE). The grill skills derive from Matt Pocock's MIT-licensed work; his attribution is kept in the credits above and in each skill's README.
