# ADR Format

ADRs live in `docs/adr/` and use sequential numbering: `0001-slug.md`, `0002-slug.md`, etc.

Create the `docs/adr/` directory lazily — only when the first ADR is needed.

## Template

```md
# {Short title of the decision}

{1-3 sentences: what's the context, what did we decide, and why.}
```

That's it. An ADR can be a single paragraph. The value is in recording *that* a decision was made and *why* — not in filling out sections.

## Optional sections

Only include these when they add genuine value. Most ADRs won't need them.

- **Status** frontmatter (`proposed | accepted | deprecated | superseded by ADR-NNNN`) — useful when decisions are revisited
- **Considered Options** — only when the rejected alternatives are worth remembering
- **Consequences** — only when non-obvious downstream effects need to be called out

## Numbering

Scan `docs/adr/` for the highest existing number and increment by one.

## When to offer an ADR

All three of these must be true:

1. **Hard to reverse** — the cost of changing your mind later is meaningful
2. **Surprising without context** — a future reader will look back and wonder "why on earth did they do it this way?"
3. **The result of a real trade-off** — there were genuine alternatives and you picked one for specific reasons

If a decision is easy to reverse, skip it — you'll just reverse it. If it's not surprising, nobody will wonder why. If there was no real alternative, there's nothing to record beyond "we did the obvious thing."

### What qualifies

- **The overall shape of the project.** "The course is built around one running case study, not a series of unrelated exercises." "The tool is a single page, not a multi-step wizard."
- **How the parts fit together.** "Each module stands alone so people can take them in any order." Boundaries and scope — the explicit no-s are as valuable as the yes-s.
- **Choices that carry lock-in.** A platform, a supplier, a format that would be expensive to switch away from. Not every small choice — just the ones that would take real effort to undo.
- **Deliberate deviations from the obvious path.** "We're doing X by hand instead of automating it, because Y." Anything where a reasonable person would assume the opposite. These stop the next person from "fixing" something that was deliberate.
- **Constraints that aren't obvious from the outside.** "We can't use tool X because of a privacy requirement." "It has to fit on one printed page because of how it's used in class."
- **Rejected alternatives when the rejection is non-obvious.** If you weighed two approaches and picked one for subtle reasons, record it — otherwise someone will suggest the other one again in six months.
