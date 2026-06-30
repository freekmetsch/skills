---
name: grill-with-docs
description: Grilling session that challenges your plan against the existing domain model, sharpens terminology, and updates documentation (CONTEXT.md, ADRs) inline as decisions crystallise. Use when user wants to stress-test a plan against their project's language and documented decisions.
---

<what-to-do>

Interview me relentlessly about every aspect of this plan until we reach a shared understanding. Walk down each branch of the design tree, resolving dependencies between decisions one-by-one. For each question, provide your recommended answer.

Always ask questions via the `AskUserQuestion` tool if available — one question per call. Provide concrete and significantly different answer options that are all truly relevant, with your recommended answer first and labelled `(Recommended)`. Wait for the user's selection before moving to the next question.

If a question can be answered by exploring the codebase, explore the codebase instead.

</what-to-do>

<supporting-info>

## Per-repo flavor overlay

If `.claude/grill-flavor.md` exists at the repo root, read it before grilling starts. The overlay carries two things:

1. **YAML frontmatter** — routes glossary writes and decision records to repo-specific locations and formats.
2. **Free-form body** — additional grilling context (audience, tone, vocab hints) injected into the session.

### Frontmatter schema

| Key | Default | Values |
|---|---|---|
| `glossary_path` | `CONTEXT.md` | any path |
| `glossary_format` | `pocock` | `pocock` \| `append-section` \| `custom` |
| `glossary_section` | (n/a) | heading text, required when `glossary_format: append-section` |
| `decision_path` | `docs/adr/` | any path, or `none` |
| `decision_format` | `pocock-adr` | `pocock-adr` \| `wiki-concepts` \| `none` |

### Format behaviors

- `glossary_format: pocock` — standard [CONTEXT-FORMAT.md](./CONTEXT-FORMAT.md). Create file lazily on first term.
- `glossary_format: append-section` — append resolved terms under the named `glossary_section` heading in the existing file. Do NOT overwrite or reformat other sections. Use for rich pre-existing CONTEXT.md files that already host meta-content.
- `glossary_format: custom` — read the overlay body for the exact format the repo wants.
- `decision_format: pocock-adr` — standard [ADR-FORMAT.md](./ADR-FORMAT.md) flow.
- `decision_format: wiki-concepts` — replace the "offer to create an ADR" flow with "offer to create a `<decision_path>/<slug>.md` page". Skip the 3-trigger ADR test; use the repo's own discipline for what becomes a concept page.
- `decision_format: none` (or `decision_path: none`) — never offer decision records in this repo.

If no `.claude/grill-flavor.md` exists, default behavior applies (Pocock-canonical glossary + ADR flow).

## Domain awareness

During codebase exploration, also look for existing documentation:

### File structure

Most repos have a single context:

```
/
├── CONTEXT.md
├── docs/
│   └── adr/
│       ├── 0001-event-sourced-orders.md
│       └── 0002-postgres-for-write-model.md
└── src/
```

If a `CONTEXT-MAP.md` exists at the root, the repo has multiple contexts. The map points to where each one lives:

```
/
├── CONTEXT-MAP.md
├── docs/
│   └── adr/                          ← system-wide decisions
├── src/
│   ├── ordering/
│   │   ├── CONTEXT.md
│   │   └── docs/adr/                 ← context-specific decisions
│   └── billing/
│       ├── CONTEXT.md
│       └── docs/adr/
```

Create files lazily — only when you have something to write. If no `CONTEXT.md` exists, create one when the first term is resolved. If no `docs/adr/` exists, create it when the first ADR is needed.

## During the session

### Challenge against the glossary

When the user uses a term that conflicts with the existing language in `CONTEXT.md`, call it out immediately. "Your glossary defines 'cancellation' as X, but you seem to mean Y — which is it?"

### Sharpen fuzzy language

When the user uses vague or overloaded terms, propose a precise canonical term. "You're saying 'account' — do you mean the Customer or the User? Those are different things."

### Discuss concrete scenarios

When domain relationships are being discussed, stress-test them with specific scenarios. Invent scenarios that probe edge cases and force the user to be precise about the boundaries between concepts.

### Cross-reference with code

When the user states how something works, check whether the code agrees. If you find a contradiction, surface it: "Your code cancels entire Orders, but you just said partial cancellation is possible — which is right?"

### Update CONTEXT.md inline

When a term is resolved, update `CONTEXT.md` right there. Don't batch these up — capture them as they happen. Use the format in [CONTEXT-FORMAT.md](./CONTEXT-FORMAT.md).

`CONTEXT.md` should be totally devoid of implementation details. Do not treat `CONTEXT.md` as a spec, a scratch pad, or a repository for implementation decisions. It is a glossary and nothing else.

### Offer ADRs sparingly

Only offer to create an ADR when all three are true:

1. **Hard to reverse** — the cost of changing your mind later is meaningful
2. **Surprising without context** — a future reader will wonder "why did they do it this way?"
3. **The result of a real trade-off** — there were genuine alternatives and you picked one for specific reasons

If any of the three is missing, skip the ADR. Use the format in [ADR-FORMAT.md](./ADR-FORMAT.md).

</supporting-info>
