---
name: grill-with-docs
description: An interview for longer projects — it challenges your plan one question at a time and, as decisions land, keeps a shared word list (glossary) and a log of your big decisions (ADRs) current in plain text files, so the project stays consistent. Use when you want to think a plan through out loud and keep your project's language and decisions written down.
---

<what-to-do>

Interview me relentlessly about this plan, one question at a time, until we reach a shared understanding. Walk down each branch of the plan, resolving dependencies between decisions one by one. For every question, give your own recommended answer so I have something to react to.

Always ask via the `AskUserQuestion` tool if available — one question per call, with concrete, genuinely different, all-feasible options, your recommended answer first and labelled `(Recommended)`. Wait for my choice before the next question.

As we talk, keep two plain-text files current inside the project:

1. **A shared word list** (a glossary), by default in `CONTEXT.md`. When a fuzzy or overloaded word gets pinned to one clear meaning, record it there so the whole project uses the word the same way.
2. **A decisions log** (ADRs), by default in `docs/adr/`. When we make a call that would be expensive to undo later, write down what we decided and why.

Read whatever project files I've given you first, so your questions build on what's already written instead of asking me things the material already answers.

</what-to-do>

<supporting-info>

## Before you start

Read the files I've included in the project — notes, plans, an existing `CONTEXT.md` or decision records. Build a quick picture of what the project is and what's already been decided. That's your grounding; don't invent context I didn't give you, and if I say something that contradicts what's written, point it out.

## During the session

### Sharpen fuzzy language

When I use a vague or overloaded word, propose a precise, canonical term. "You're saying 'account' — do you mean the person or the login? Those are different things." When a term is resolved, add it to `CONTEXT.md` right there, in the format in [CONTEXT-FORMAT.md](./CONTEXT-FORMAT.md). Don't batch these up — capture them as they happen.

`CONTEXT.md` is a glossary and nothing else. Don't treat it as a spec, a scratch pad, or a place for implementation detail.

### Challenge against what's written

When I use a term that clashes with the existing word list, or state something that contradicts a file I've been given, call it out immediately. "Your notes define 'cancellation' as X, but you seem to mean Y — which is it?"

### Stress-test with concrete scenarios

When we're working out how things relate, invent specific scenarios that probe the edges and force me to be precise about the boundaries between ideas.

### Offer a decision record sparingly

Only offer to write one when all three are true:

1. **Hard to reverse** — the cost of changing your mind later is meaningful.
2. **Surprising without context** — a future reader will wonder "why did they do it this way?"
3. **The result of a real trade-off** — there were genuine alternatives and you picked one for specific reasons.

If any of the three is missing, skip it. Use the format in [ADR-FORMAT.md](./ADR-FORMAT.md).

## Create files lazily

Only make a file when there's something to write. If no `CONTEXT.md` exists, create it when the first term is resolved. If no `docs/adr/` exists, create it when the first decision is worth recording.

</supporting-info>
