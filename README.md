# Freek's prompts & AI skills

A few prompts and AI skills I use in my teaching and design work.

## What's a "prompt"? What's a "skill"?

A **prompt** is just instructions in the form of 'raw' text that you paste into any chat assistant (ChatGPT, Copilot, Gemini, Claude). A **skill** is a prompt that you can call repeatedly using your **AI agent**. It can just be a prompt, but some skills consist of a few extra files bundled together, so an assistant can do a more involved job the same way every time. Some skills are meant to be used in a **file system** — they read and write to a folder of files you give it access to, usually in a tool like Claude Code, Cowork, or Codex.

## Types of skills

- **Basic Prompt - Any chatbot** — paste it into any chat assistant. No setup. Can also be used as a repeatable skill.
- **Skill - advanced AI app** — install it once (as a Claude Skill, a ChatGPT GPT, or a Gemini Gem). Claude works best as it's the company that designed the 'skill' concept.
- **Skill + files** — install it in a tool that can open and edit files on your computer (Claude Code, Codex, Cowork, or any IDE).

## What's here

### [grill-me](grill-me/) — a thinking partner that interviews you
**Use when** you have a half-formed idea or a project that you need to think through — a lesson to prepare, a presentation, a decision, a design of some kind, etc. *(Any chatbot.)* AI chatbots tend to assume a lot of things, but this skill asks you one question at a time, exploring all aspects of it, until the thing you're trying to think through is clear in your head.

### [educational-worksheets](educational-worksheets/) — a design partner for worksheets
**Use when** you want to design a worksheet or handout. The AI agent will gather context - what the worksheet is for, who it's for, and how the page should flow before it makes anything, offers you a few layout options with the trade-offs. It uses HTML to design the worksheet/handout which you can directly print and/or save to PDF. I recommend you use it with /grill-me or /grill-with-docs to give the agent as much context as you can. More context allows the agent to suggest better activities which generally results in higher quality worksheets. 

### [grill-with-docs](grill-with-docs/) — grill-me that also keeps your notes up to date
**Use when** you are working on larger projects over a longer period of time. The AI agent will relentlessly interview you one question at a time which will clarify your thinking. By keeping a glossary in txt files with key terminology it's able to manage the project more effectively avoiding any misunderstandings. The skill requires a *file system* to work in in order to write and read those text files. Include all relevant project files in that file system so it has all the context for your project. It will also keep track of any foundational decisions you make as you're working in the project, so design decisions are always considered.

## Get the files

- **Everything at once** — click the green **Code** button near the top of [this page](https://github.com/freekmetsch/skills) and choose **Download ZIP** ([or use this direct link](https://github.com/freekmetsch/skills/archive/refs/heads/main.zip)).
- **Just one skill** — [grill-me.zip](https://github.com/freekmetsch/skills/raw/main/grill-me/grill-me.zip) · [educational-worksheets.zip](https://github.com/freekmetsch/skills/raw/main/educational-worksheets/educational-worksheets.zip) · [grill-with-docs.zip](https://github.com/freekmetsch/skills/raw/main/grill-with-docs/grill-with-docs.zip)

Each skill's own page (linked above under "What's here") has step-by-step instructions for where the files go.

## Questions?

Email me — **metschfreek@gmail.com**. 

## Credits

`grill-me` and `grill-with-docs` are adapted from **Matt Pocock**'s skills — the relentless-interview-with-a-recommended-answer technique and the keep-the-docs-current workflow are his. Source: [github.com/mattpocock/skills](https://github.com/mattpocock/skills) ([productivity](https://github.com/mattpocock/skills/tree/main/skills/productivity) · [engineering](https://github.com/mattpocock/skills/tree/main/skills/engineering)). `educational-worksheets` is mine.

## License

[MIT](LICENSE) — free to use, change, and share. The grill skills build on Matt Pocock's MIT-licensed work; the attribution is in [NOTICE](NOTICE) and each skill's page.
