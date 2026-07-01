# grill-me

**Basic Prompt** — paste it into any chat assistant (ChatGPT, Copilot, Gemini, Claude). No setup.

**Use when** you have a half-formed idea or a project that you need to think through — a lesson to prepare, a presentation, a decision, a design of some kind, etc. *(Any chatbot.)* AI chatbots tend to assume a lot of things, but with this skill the AI bot becomes a critical interviewer, asking you one question at a time. It asks you to explore and understand all aspects of your plan, until the thing you're trying to think through is clear in your head.

## Use it

Paste this at the start of a chat, then give it your problem:

```
Interview me relentlessly about every aspect of this plan until we reach a shared understanding. Walk down each branch of the design tree, resolving dependencies between decisions one-by-one. For each question, provide your recommended answer.

Always ask questions via the `AskUserQuestion` tool if available — one question per call. Provide concrete and significantly different answer options that are all truly relevant, with your recommended answer first and labelled `(Recommended)`. Wait for the user's selection before moving to the next question.
```

It works in any assistant. It works best somewhere that already knows a little about you — a coding assistant — and best of all in [Claude](https://claude.ai), which can ask you multiple-choice questions so the back-and-forth stays quick. (That last paragraph is for Claude; other assistants ignore it and just ask in plain text.)

## How I use it

1. **Talk it out first.** Record yourself for five to fifteen minutes about the problem, however messy. Just think out loud.
2. **Drop it in and get grilled.** Paste that into a chat with the prompt above, and let it question you one step at a time.
3. **Then do the thing (optional).** You don't need AI for this part — but now the problem and what surrounds it are clear, which was the hard bit.

## Download

It's one block of text, so the quickest way is to copy the prompt above. Prefer the files? [Download grill-me.zip](https://github.com/freekmetsch/skills/raw/main/grill-me/grill-me.zip) — the prompt as a ready-to-install skill, plus the licence.

## Questions?

Email me — **metschfreek@gmail.com**.

## Credit

Adapted from Matt Pocock's productivity skills: <https://github.com/mattpocock/skills/tree/main/skills/productivity>
