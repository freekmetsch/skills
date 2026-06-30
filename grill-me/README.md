# grill-me

**Any chatbot** — paste it into any chat assistant (ChatGPT, Copilot, Gemini, Claude). No setup.

A prompt that interviews you about a problem instead of answering it. One question at a time, until the thing you're trying to do is actually clear. It doesn't think for you — it makes you think.

## Use it

Paste the prompt below at the start of a chat, then give it your problem.

```
Interview me relentlessly about every aspect of this plan until we reach a shared understanding. Walk down each branch of the design tree, resolving dependencies between decisions one-by-one. For each question, provide your recommended answer.

Always ask questions via the `AskUserQuestion` tool if available — one question per call. Provide concrete and significantly different answer options that are all truly relevant, with your recommended answer first and labelled `(Recommended)`. Wait for the user's selection before moving to the next question.
```

It works in any assistant. It works best somewhere that already has context about you — a coding assistant — and best of all in [Claude](https://claude.ai), which can ask multiple-choice questions so the back-and-forth stays quick. (The `AskUserQuestion` line is for Claude; other assistants ignore it and just ask in plain text.)

## How I use it

1. **Talk it out first.** Record yourself for five to fifteen minutes about the problem, however unstructured.
2. **Drop it in and get grilled.** Put that into a chat with the prompt above and let it interrogate you, one question at a time.
3. **Then do the thing (optional).** You don't need AI for this part — but now the problem and its context are clear, which was the hard bit.

## Credit

Adapted from Matt Pocock's `grill-me`: <https://github.com/mattpocock/skills/tree/main/skills/productivity/grill-me>
