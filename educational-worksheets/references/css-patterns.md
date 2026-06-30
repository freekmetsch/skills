# CSS Patterns Reference

## Base CSS Foundation

```css
@page {
    size: A4;   /* portrait default. For a wide sheet — timelines, wide tables, two-up cards —
                   use `size: A4 landscape`; the margin, pagination, and break-chain all hold unchanged. */
    /* Baked-in safe margin, applied to EVERY page (page 2+ included) so margins stay
       symmetric WITHOUT depending on the browser's "Default" dropdown value. This is the
       print safety floor: content reaching the paper edge is the most common print failure,
       and relying on the unset browser default leaves it one dropdown click from breaking.
       Chrome's "Margins: Default" HONOURS this @page margin (verified against Chromium's
       print path — Default keeps CSS margins enabled); "None", "Minimum", and "Custom" all
       override it, with "None" the edge-risk case. Keep the teacher's print step on Default;
       final confirmation belongs in the claude.ai smoke-test on the target build. */
    margin: 12mm;
}

@media print {
    body {
        margin: 0;
        -webkit-print-color-adjust: exact;
        print-color-adjust: exact;
    }
    .worksheet {
        width: 100%;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        /* NO height, NO min-height — let content flow naturally */
        /* NO padding — the @page margin handles all page spacing. Padding can't
           substitute: on a multi-page block it only insets page 1's top and the last
           page's bottom, so inner pages would lose their margin. */
    }
    .print-button { display: none; }

    /* PAGINATION: prevent breaks INSIDE sections, let browser break BETWEEN them */
    .section,
    .skill-section,
    .header,
    .intro-box,
    .reflection-strip,
    .question-block,
    .task-block,
    .principle-box,
    .scenario,
    table {
        break-inside: avoid;
    }

    /* OPT-OUT: long containers that would otherwise be shoved onto a new page.
       Apply .allow-break to any section whose sub-parts are coherent but whose
       total height approaches or exceeds ~250mm. Rely on seam protection below. */
    .section.allow-break,
    .skill-section.allow-break {
        break-inside: auto;
    }

    /* LONG TABLE: a table taller than one page must split, not overflow or leave a gap.
       The global `table { break-inside: avoid }` above traps a tall table on a single
       page. Add .long-table (alongside .data-table) to let it break BETWEEN rows, keep
       each row intact, and repeat the header on every page. */
    table.long-table {
        break-inside: auto;
    }
    table.long-table thead {
        display: table-header-group;
    }
    table.long-table tr {
        break-inside: avoid;
    }

    /* PROTECT WRAPPING META: a multi-line <p> of descriptive text can split
       mid-sentence across a page boundary. Add class names for any
       subtitle/meta paragraph used in the worksheet. */
    .rubric-meta,
    .section-meta {
        break-inside: avoid;
    }

    /* BREAK CHAIN: headers AND framing paragraphs MUST stick to what follows them.
       Every element between a section header and the first response block must be
       in this list or the chain breaks at that point. Framing paragraphs are the
       #1 miss — they look like prose but they are structural. */
    .phase-header,
    .section-title,
    .section-header,
    .theory-box,
    .exercise-label,
    .phase-subtitle,
    .exercise-subtitle,
    /* framing/intro paragraphs — structural, not decorative */
    .phase-framing,
    .section-framing,
    .answer-title,
    .answer-framing,
    .keep-next {
        break-after: avoid;
    }

    /* KEEP-WITH-PREV: a block that must stay with its preceding intro
       one-liner (e.g. a summary/checklist container introduced by a short <p>). */
    .keep-with-prev {
        break-before: avoid;
    }

    /* KEEP-BLOCK: wraps a header + framing + first content block as an atomic unit.
       The browser pushes the entire group to the next page rather than splitting at
       an unpredictable seam. More reliable than the break chain alone when the group
       contains a table, image, or other self-contained content block.
       ONLY safe when the wrapped group fits within ~150mm — never wrap tall sections. */
    .keep-block {
        break-inside: avoid;
    }

    /* NEW-PAGE: a deliberate forced break at a major content boundary
       (Session 1 → 2, Part A → B, a standalone answer key / appendix).
       A design choice, NOT a fix for a broken chain — see rule 13. */
    .new-page {
        break-before: page;
    }
}

@media screen {
    body {
        background: #f0f0f0;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .worksheet {
        background: white;
        width: 210mm;
        padding: 12mm;       /* matches the @page print margin — screen preview == print */
        box-shadow: 0 0 20px rgba(0,0,0,0.1);
        box-sizing: border-box;
        position: relative;
        margin-bottom: 20px;
        /* NO min-height: 297mm — continuous scroll on screen */
    }
    .print-button {
        position: fixed;
        top: 20px;
        right: 20px;
        background: #333;
        color: white;
        padding: 10px 24px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        font-weight: bold;
        z-index: 100;
    }
    .print-button:hover {
        background: #000;
    }
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.45;  /* Standard tier default — see Spacing Tiers section */
    color: #000;
    font-size: 11px;
}
```

### Critical Pagination Rules

1. **Never** set `min-height: 297mm` or `height: 100vh` on `.worksheet`
2. **Never** use manual page-break divs (`<div class="page-break"></div>`)
3. **Never** force a page break to fix layout — no `page-break-after: always`, no `break-after: page`, no manual break divs. The single sanctioned forced break is `.new-page` (`break-before: page`) at a real content boundary; see rule 13 for exactly when it's allowed
4. **Always** add `break-inside: avoid` to every section-level class used in the worksheet
5. **Always** add `break-after: avoid` to every header, title, label, theory-box, AND framing/intro paragraph class — all are part of the chain; framing paragraphs are the #1 miss
6. If a worksheet uses custom section class names, add them to the appropriate rule list in `@media print`
7. **TRAP — framing paragraphs break the chain:** Any element inserted between a header and its content (italic framing, a tip-box, a "do this next" cue) also needs `break-after: avoid`. Miss one and the chain is broken at that point.
8. **`keep-block` — the reliable pattern for small groups:** When a phase-header + framing + first content block together fit within ~150mm, wrap them in `<div class="keep-block">`. The browser pushes the whole group to the next page as a unit. This is more reliable than the chain alone when the following content is a table, example-box, or image. **Do NOT use for groups over ~150mm** — the browser silently ignores `break-inside: avoid` on tall containers.
9. **Long-section opt-out:** Sections legitimately over ~250mm should get `.allow-break` (sets `break-inside: auto`) and have only their internal seams protected. Forcing a tall section to stay atomic causes a big white gap where the browser gave up and pushed it to a new page.
10. **Multi-line meta paragraphs** (subtitle / descriptive meta text that wraps to 2+ lines) need their own `break-inside: avoid` — a single `<p>` can split mid-sentence across a page boundary.
11. **Intro-then-block pattern:** a short `<p>` that introduces a following list/table/box needs `.keep-next` (or `break-after: avoid`) to stay glued to what it introduces.
12. **Preceding-intro + following-container pattern:** use `.keep-with-prev` (`break-before: avoid`) on the container so it moves to the next page with its intro instead of leaving the intro stranded above a gap.
13. **The one sanctioned forced break (the exception named in rule 3).** `.new-page` (`break-before: page`) is the *only* permitted forced break, and ONLY on a major content divider a reader would recognise (Session 1 → 2, Part A → B, appendix, standalone answer key). It is a deliberate design choice, never a repair: an orphaned header is a missing `break-after: avoid` in the chain, not a place for `.new-page`. Rules 3 and 13 are one rule — no forced breaks except this one.
14. **Long tables split, with a repeating header.** A table that can exceed one page must NOT be held atomic by the global `table { break-inside: avoid }` — that forces an overflow or a big white gap. Add `.long-table` (alongside `.data-table`): it breaks the table between rows, keeps each individual row intact, and repeats the `<thead>` on every page via `display: table-header-group`. Reach for it on any data or answer table with many rows.

## Diagnosing print breaks (symptom → fix)

Match the symptom in Print Preview to its fix:

- **Header alone at the bottom of a page** → an element between the header and its first content lacks `break-after: avoid`; the chain breaks there. Add it.
- **Header + framing paragraph together at the bottom, main block (table / list / plan) orphaned to the next page** → (1) if the whole group fits within ~150mm, wrap it in `<div class="keep-block">`; (2) if the block is too tall to wrap, add the framing class to the `break-after: avoid` chain. The chain alone is not always honoured when the following block is large or complex.
- **Answer-key title + intro on one page, first answer on the next** → `.answer-title` and `.answer-framing` both need `break-after: avoid`.
- **A paragraph's text cut mid-sentence across pages** → that paragraph's class lacks `break-inside: avoid`.
- **Intro one-liner on page N, the block it introduces on page N+1** → add `.keep-next` (`break-after: avoid`) to the intro, or `.keep-with-prev` (`break-before: avoid`) to the block.
- **Section header + 1–2 lines, then a big white gap, the rest of the section on the next page** → the section has `break-inside: avoid` and is too tall (>~250mm). Give it `.allow-break` and protect only its internal seams.
- **A table taller than a page overflows the bottom, or the whole table is shoved to the next page leaving a gap** → the global `table { break-inside: avoid }` is holding it atomic. Add `.long-table` so it breaks between rows and repeats its header (rule 14).

`keep-block` wraps a header + framing + first content block as one atomic unit:

```html
<div class="keep-block">
    <div class="phase-header">…</div>
    <p class="phase-framing">…</p>
    <table class="data-table">…</table>
</div>
```

**What the browser does on its own:** fills each page, pushes a section that won't fit to the next page, keeps sections intact, and creates pages as needed with no empties. On screen the worksheet is a continuous scroll — always verify real breaks in Print Preview.

## Component Patterns

### Headers

```css
.header {
    border-bottom: 3px solid #333;
    padding-bottom: 8px;       /* Standard tier */
    margin-bottom: 16px;       /* Standard tier */
}
.title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 2px;
}
.subtitle {
    font-style: italic;
    color: #555;
    font-size: 11px;
}
```

### Section Markers (Left Border)

```css
.section {
    margin-bottom: 16px;       /* Standard tier */
    border-left: 4px solid #333;
    padding-left: 12px;        /* Standard tier */
}
.section-title {
    font-size: 12px;
    font-weight: bold;
    margin-bottom: 8px;        /* Standard tier */
    display: flex;
    align-items: center;
    gap: 5px;
}
/* Phosphor icon sizing inside section titles */
.section-title i[class*="ph-bold"] {
    font-size: 16px;
    color: #000;
}
```

```html
<div class="section">
    <div class="section-title">
        <i class="ph-bold ph-chat-circle-dots"></i>
        <span>Discussion</span>
    </div>
    <!-- section content -->
</div>
```

### Dark Header Bars

**Photocopy-safe usage:** Dark bars are acceptable ONLY for short single-line headers (≤8 words). NEVER use for text-heavy content boxes — these disappear on a standard copier.

```css
.section-header {
    background: #333;
    color: white;
    padding: 6px 10px;         /* Standard tier */
    font-size: 12px;
    font-weight: bold;
    margin-bottom: 10px;       /* Standard tier */
    border-radius: 3px;
}
```

### Reference/Terminology Boxes

**PREFER the light version for any box containing more than a single line of text.** The dark version fails on photocopiers when used for multi-line content.

```css
/* Dark version — short labels only */
.terminology-box-dark {
    background: #333;
    color: white;
    border-radius: 6px;
    padding: 8px;
}

/* Light version — PREFERRED for all text-heavy reference content */
.terminology-box {
    background: #f5f5f5;
    border: 1.5px solid #333;
    border-radius: 4px;
    padding: 8px;
    font-size: 10px;
    color: #000;
}

/* Light info box */
.info-box {
    background: #f5f5f5;
    border: 1px solid #888;
    border-radius: 4px;
    padding: 8px;
    font-size: 10px;
}
```

### Label-Inline Writing Row

Use when a short category label should sit on the same line as the writing line (e.g. "Location ___________"). The label anchors the row; the line fills remaining space. Add a second plain line below for two-line slots.

```css
.labeled-row {
  display: flex;
  align-items: baseline;
  gap: 6px;
  margin-bottom: 4px;
}
.row-label {
  font-weight: bold;
  white-space: nowrap;
  flex-shrink: 0;
  font-size: 10px;
}
.row-line {
  border-bottom: 1px solid #888;
  flex: 1;
  height: 1px;
  margin-bottom: -3px;
}
.row-line-2 {
  border-bottom: 1px solid #bbb;
  height: 14px;
  margin-bottom: 4px;
}
```

```html
<div class="labeled-row">
  <span class="row-label">Location</span>
  <span class="row-line"></span>
</div>
<div class="row-line-2"></div>
```

### Writing Lines

```css
.write-line {
    border-bottom: 1px solid #666;
    height: 22px;              /* Standard tier */
    margin-bottom: 5px;        /* Standard tier */
}

.write-line-tall {
    height: 28px;              /* Spacious tier */
    margin-bottom: 6px;
}
```

### Rating — use the anchored grid

For a self-rating, use `.rating-grid` (in Response-space components below): it names the anchors once
across the top and left-packs the boxes. It supersedes the older free-standing `.rating-box` row —
don't reintroduce a per-row "Strong / Developing / Needs work" that repeats text and shoves the marks
to the page edge.

### Tables

```css
.data-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 10px;
}
.data-table th {
    background: #e8e8e8;
    border: 1px solid #999;
    padding: 6px 8px;          /* Standard tier */
    text-align: left;
    font-weight: bold;
}
.data-table td {
    border: 1px solid #999;
    padding: 6px 8px;          /* Standard tier */
    vertical-align: top;
}

/* WRITING-HEIGHT LEVER — the fix for collapsed answer cells. An empty <td> with
   padding only renders ~3.4mm tall: far too short to write in. Add .write-rows to
   any table whose cells are for student writing; tbody cells get a real row height
   (per tier below). Padding alone cannot substitute. */
.data-table.write-rows tbody td {
    height: 16px;              /* placeholder — overridden by mm value per tier */
    height: 16mm;              /* Standard tier writing-table row */
}

/* THE ANSWER COLUMN (.col-input) — the protected writing column of a "2 given + 1 to
   write" table. Mark the header AND every body cell of the answer column .col-input.
   It carries the B3 column rule — three mechanisms, one decision:

   • answer-floor (the CSS safety net) — the answer column keeps a generous writing
     width whatever the given columns hold: a min-width floor it grows past but never
     drops below. This protects the student's space even when a per-sheet width
     estimate is off.
   • agent-fit (the tuned output) — decide the columns first (merge-when-short, below),
     then size each GIVEN column you keep to its real content with an explicit <colgroup>
     (a short column stays narrow; a sentence-length quote gets the width it needs); leave
     the answer column's <col> width-less so it takes the remaining slack. Keep auto
     layout — NEVER table-layout:fixed, which disables the min-width floor and removes the
     safety net. Do NOT also put width:100% on the answer cell: it overrides the colgroup
     and crushes the given columns to one word per line — the floor below is all it needs.
   • ruled lines (not an open box) — the answer cell shows ruled writing lines, so the
     student has a baseline to write on, never a bare box. */
.data-table .col-input {
    min-width: 72mm;           /* the writing floor: ~72mm ≈ one ~12-word handwriting line, the minimum the
                                  answer never drops below; the colgroup gives it the rest of the row (more on a
                                  wide/landscape sheet). Raise it if the answer needs more than a line. */
}

/* RULED ANSWER LINES — paint the answer cell with writing rules at the tier's line
   rhythm (--rule-gap). Each rule sits at the FOOT of its slot so there is writing room
   ABOVE it (same convention as .label-line); the last rule meets the cell's bottom
   border. Size the row height to a whole multiple of --rule-gap so the lines stay even
   (Standard 16mm = 2 lines at 8mm); a taller row simply gets more lines. #999 matches
   the cell border so the table reads as evenly ruled, and is grayscale-safe. */
.data-table.write-rows tbody td.col-input {
    --rule-gap: 8mm;           /* Standard; Compact 6mm, Spacious 10mm — see Spacing Tiers */
    background-image: repeating-linear-gradient(
        to bottom,
        transparent 0,
        transparent calc(var(--rule-gap) - 1px),
        #999 calc(var(--rule-gap) - 1px),
        #999 var(--rule-gap));
}
/* the worked model-answer row reads as plain text — no lines to write on */
.data-table.write-rows tbody tr.worked td.col-input { background-image: none; }

/* MERGE-WHEN-SHORT — a judgment made before sizing: if the 2nd column is a short label
   throughout (1–2 words), prefer to fold it into the 1st (quote bold, label italic
   beneath) and run a tidier two-column table; the answer column still floors and keeps
   its lines. Keep it as its own column when it carries real text (a phrase, not a label). */
.data-table .merged .quote { font-weight: 600; }
.data-table .merged .tech  { display: block; font-style: italic; color: #555; font-size: 9px; margin-top: 2px; }
```

The 2-given-plus-1-input shape — keep three columns here because the 2nd carries real text
(a phrase, not a short label). A `<colgroup>` sizes the given columns to this sheet's
content (agent-fit), the answer column takes the rest, floors at 72mm, and carries ruled
lines (mark its header AND every body cell `.col-input`). A worked first row sets the depth:

```html
<table class="data-table write-rows">
    <colgroup>
        <col style="width:40mm">  <!-- Quotation — sized to the quote length on THIS sheet -->
        <col style="width:48mm">  <!-- What the writer is doing — phrase-length, so wider -->
        <col>                     <!-- Effect — the answer column takes the remaining width -->
    </colgroup>
    <thead><tr><th>Quotation</th><th>What the writer is doing</th><th class="col-input">Effect on the reader</th></tr></thead>
    <tbody>
        <tr class="worked"><td>"a thousand tiny knives"</td><td>an extended metaphor sustained across the stanza</td><td class="col-input">builds the cold into a relentless, deliberate assault</td></tr>
        <tr><td>"the door sighed shut"</td><td>personification of an ordinary object</td><td class="col-input"></td></tr>
    </tbody>
</table>
```

When the 2nd column is only a short label (1–2 words throughout), merge it into the first
(merge-when-short) and run two columns — the answer column still floors and keeps its lines:

```html
<table class="data-table write-rows">
    <colgroup><col style="width:64mm"><col></colgroup>
    <thead><tr><th>Quotation</th><th class="col-input">Effect on the reader</th></tr></thead>
    <tbody>
        <tr class="worked merged"><td><span class="quote">"a thousand tiny knives"</span><span class="tech">hyperbole</span></td><td class="col-input">exaggerates the cold into something that physically attacks</td></tr>
        <tr class="merged"><td><span class="quote">"the door sighed shut"</span><span class="tech">personification</span></td><td class="col-input"></td></tr>
    </tbody>
</table>
```

For a table that can run past one page, add `.long-table` so it splits between rows and repeats its header instead of overflowing or being shoved whole onto the next page (see Pagination Rule 14):

```html
<table class="data-table long-table">
    <thead><tr><th>…</th><th>…</th></tr></thead>
    <tbody><!-- many rows --></tbody>
</table>
```

### Meta/Info Fields

```css
.meta-field {
    display: flex;
    align-items: baseline;
    gap: 4px;
    font-size: 11px;
}
.meta-label {
    font-weight: bold;
    white-space: nowrap;
}
.meta-line {
    border-bottom: 1px solid #333;
    flex: 1;
    min-width: 40px;
    height: 1px;
    margin-bottom: -3px;
}
```

### Checkboxes

```css
.checkbox {
    width: 14px;
    height: 14px;
    border: 1px solid #333;
    flex-shrink: 0;
    margin-top: 1px;
}
```

### Cut-Apart Line (two-up sheets)

For a short form printed two-up (two identical copies on one A4, cut apart for two students). The dashed cut guide shows only on print, so it never clutters the on-screen design. Grayscale-safe (dashed rule + Phosphor scissors icon, no colour).

```css
.cutting-line { display: none; }   /* hidden on screen */

@media print {
    .cutting-line {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 6px;
        border-top: 1px dashed #999;
        margin: 8mm 0;
        padding-top: 3px;
        font-size: 9px;
        color: #555;
    }
}
```

```html
<div class="copy"><!-- the form --></div>
<div class="cutting-line"><i class="ph-bold ph-scissors"></i> cut here</div>
<div class="copy"><!-- an identical second copy --></div>
```

### Tip/Pull-Quote Boxes

Use for tips, reminders, and callout content. Pull-quote style gives these elements visual weight and breathing room — avoid cramming tip text into dense boxes.

```css
.tip-box {
    background: #fff;
    border: none;
    border-left: 5px solid #333;
    border-radius: 0;
    padding: 7px 10px;
    margin-bottom: 8px;
    font-size: 10px;
    line-height: 1.45;
}
```

When a tip contains multiple examples or items, give each one its own line — don't run them together in a single paragraph. Use bold labels with Phosphor icons (e.g. `<strong><i class="ph-bold ph-lightbulb"></i> Theatre or drama?</strong> &rarr; ...`) and line breaks to separate items visually.

### Instruction/Example Boxes

```css
.instruction {
    background: #f5f5f5;
    border: 1px solid #ddd;
    border-radius: 3px;
    padding: 8px 10px;         /* Standard tier */
    margin-bottom: 10px;       /* Standard tier */
    font-size: 10px;
    font-style: italic;
}

.example-box {
    background: #e8e8e8;
    border-left: 3px solid #666;
    padding: 8px 10px;         /* Standard tier */
    margin-bottom: 10px;       /* Standard tier */
    font-size: 10px;
}
```

## Response-space components (input modes)

The ways a worksheet asks for student input, beyond open writing lines. Pick the
mode that fits the answer's shape; `examples/curated-patterns.md` shows each in use.
Two rules cut across all of them:

- **Always something to write on / in** — a line, a grid, a bounded box. Never a bare
  blank where prose is expected.
- **Size the space to the answer** (`~1 ruled line ≈ ~12 words`), erring a touch generous.
  For the bounded spaces, the floors in the Spacing Tiers table are minimums, not targets.

### Fill the gaps (cloze)

An inline blank at the point of difficulty. Give the line height so a handwritten word fits.

```css
.cloze { line-height: 2.7; }              /* room to write between lines */
.gap {
    display: inline-block;
    border-bottom: 1px solid #555;
    min-width: 130px;                      /* size to the expected word */
    margin: 0 3px;
}
.gap.short { min-width: 74px; }
.gap.long  { min-width: 220px; }
```

```html
<p class="cloze">Yesterday we <span class="gap short"></span> (go) to the museum.</p>
```

### Word bank (scaffolded cloze)

A grayscale-safe chip row of the words to choose from, above the gapped text.

```css
.word-bank {
    display: flex; flex-wrap: wrap; gap: 7px; align-items: center;
    border: 1px solid #999; border-radius: 4px; background: #f5f5f5;
    padding: 7px 10px; margin-bottom: 10px; font-size: 10px;
}
.word-bank .wb-label { font-weight: bold; margin-right: 2px; }
.word-bank .chip { border: 1px solid #888; border-radius: 11px; padding: 2px 10px; background: #fff; font-weight: 600; }
```

### Choose & mark — the mark shape signals cardinality

A square box = "tick as many as apply"; a round box = "pick exactly one". Same 14px box,
`border-radius: 50%` for single-select. (This reuses the `.checkbox` box above.)

```css
.choice-row { display: flex; align-items: flex-start; gap: 8px; margin-bottom: 6px; font-size: 11px; }
.choice-box { width: 14px; height: 14px; border: 1px solid #333; flex-shrink: 0; margin-top: 1px; background: #fff; }
.choice-box.one { border-radius: 50%; }    /* single-select reads as a circle */
```

**Pack short selection items into columns** to save vertical space — a full-width row with
the mark flush right leaves a dead gap. True/false is the clearest case:

```css
.tf-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 5px 22px; }   /* two per row */
.tf-item { display: flex; align-items: baseline; gap: 9px; font-size: 10.5px; }
.tf-item .stmt { flex: 1; }
.tf-pair { display: flex; gap: 11px; flex-shrink: 0; }
.tf-opt  { display: flex; align-items: center; gap: 4px; font-weight: bold; font-size: 10px; }
```

### Matching — write the letter

A written letter survives a photocopy where a drawn line gets messy, and marks faster.

```css
.match { display: flex; gap: 24px; }
.match-col { flex: 1; }
.match-item { display: flex; align-items: center; gap: 8px; margin-bottom: 7px; font-size: 10.5px; }
.letter-box { width: 18px; height: 18px; border: 1px solid #333; flex-shrink: 0; }
.match-key  { font-weight: bold; width: 16px; flex-shrink: 0; }
```

### Ordering / sequencing

```css
.order-row { display: flex; align-items: center; gap: 9px; margin-bottom: 7px; font-size: 10.5px; }
.order-box { width: 20px; height: 20px; border: 1px solid #333; flex-shrink: 0; text-align: center; }
```

### Sort into groups

Bounded buckets with grayscale-safe headers; give them real height to write in.

```css
.sort-grid   { display: flex; gap: 10px; }
.sort-bucket { flex: 1; border: 1px solid #888; border-radius: 4px; min-height: 30mm; }
.sort-bucket .bk-head { background: #e8e8e8; border-bottom: 1px solid #888; padding: 4px 7px; font-weight: bold; font-size: 10px; }
```

### Anchored rating — header grid

Anchor the scale, but name the anchors ONCE across the top and left-pack the boxes —
a per-row "Strong / Developing / Needs work" repeats text and shoves the boxes to the edge.
A bare, unanchored 1–5 tells a student nothing; anchor it — either name every point, or label
the endpoints of a numeric continuum (0 = not yet … 3 = confident). Keep self-rating at the
level of the work, never the person.

```css
.rating-grid {
    display: grid;
    grid-template-columns: max-content repeat(3, max-content);
    gap: 7px 18px; justify-content: start; align-items: center; font-size: 10.5px;
}
.rating-grid .rg-head { font-weight: bold; font-size: 9.5px; text-align: center; }
.rating-grid .rg-box  { width: 14px; height: 14px; border: 1px solid #333; justify-self: center; }
```

### Annotate given text

The student marks the text itself (underline / circle). Generous line height leaves room.
Never an instruction that depends on colour ("underline in blue") — it vanishes on a B&W copy.

```css
.given { font-size: 12px; line-height: 2.4; margin-bottom: 4px; }
.given .num { font-weight: bold; margin-right: 5px; }
```

### Label a diagram

Simple line art can be authored **inline as `<svg>`** — vector, so it prints crisp, and
grayscale-safe with black strokes on white; reach for that first for a diagram you can draw
yourself (a water cycle, a labelled cell, a circuit). A photographic or raster-generated image
is NOT inline HTML — it needs hosting or a base64 data-URI to embed (a bare external URL may not
survive on a claude.ai artifact), so source it with image generation or image search, or leave
the sized box for the teacher to drop one in. **Size the diagram to the task:** the
`48mm` below is a floor for a simple shape — a diagram with several parts to identify needs more
(often 70–90mm+) so the parts stay legible at print scale. A postage-stamp diagram a student
can't read defeats the exercise; size it to the detail and the labelling demand. The worksheet
supplies the label lines. Each label line is a writing *slot* — the rule sits at the bottom of
the slot so the word has room *above* it — and the slots stack from the top with even gaps.
Top-align them (do NOT `justify-content: space-between` against the diagram height: it
over-spreads the gaps, starves the first line of writing room, and leaves dead space under the
last line). Size the slot height and the number of slots to the parts being labelled.

```css
.diagram { display: flex; gap: 18px; align-items: flex-start; }
.diagram-art { width: 48mm; min-height: 48mm; border: 1px solid #888; border-radius: 6px; flex-shrink: 0; }
/* 48mm is a FLOOR — enlarge width + min-height for a detailed or multi-part diagram so it reads */
.label-lines { flex: 1; display: flex; flex-direction: column; gap: 4mm; padding-top: 3mm; }
.label-line { height: 8mm; border-bottom: 1px solid #777; }   /* writing room sits ABOVE the rule */
```

### Maths working area (opt-in)

**Default: assume students have a notepad — only put a working area on the sheet when the
teacher asks for one.** When you do: a 5mm dot grid is the flexible default (carries a sum
and a sketch); a 5mm squared grid is for column arithmetic where digits must align. A bounded
answer box collects the final result. Keep grid/dot rules at `~#a8–#b8` grey — lighter vanishes
on a photocopy, much darker fights the writing.

```css
.work-area { border: 1px solid #888; border-radius: 4px; min-height: 48mm; }   /* floor — err larger */
.work-area.dots { background-image: radial-gradient(#9a9a9a 1.1px, transparent 1.4px);
    background-size: 5mm 5mm; background-position: 2.5mm 2.5mm; }
.work-area.grid { background-image: linear-gradient(#b0b0b0 1px, transparent 1px),
    linear-gradient(90deg, #b0b0b0 1px, transparent 1px); background-size: 5mm 5mm; }
.answer-row { display: flex; align-items: center; gap: 9px; margin-top: 8px; }
.answer-row .lbl { font-weight: bold; font-size: 11px; white-space: nowrap; }
.answer-box { border: 1.5px solid #333; border-radius: 3px; min-height: 9mm; flex: 0 0 52mm; }
.answer-box.dual { flex: 0 0 38mm; }    /* two answers side by side */
```

### Open & creative spaces — the pitfall is height

For non-prose input with no fixed shape: a word cloud (open word field with a seed term),
a sketch/diagram area (faint dots steady a drawing without forcing a grid), or a plain open
box (a plan, a mind-map, a student-drawn number line). **The failure mode is too little
vertical space** — these `min-height` values are floors; err generous, and lean a brainstorm
toward pair or group work where volume is the point.

```css
.cloud-area { border: 1px solid #999; border-radius: 6px; min-height: 74mm; position: relative; }
.cloud-area .seed { position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%);
    font-size: 13px; font-weight: bold; color: #333; border: 1.5px solid #333; border-radius: 20px; padding: 4px 14px; }
.sketch-area { border: 1px solid #999; border-radius: 6px; min-height: 80mm;
    background-image: radial-gradient(#b0b0b0 1px, transparent 1.4px); background-size: 6mm 6mm; background-position: 3mm 3mm; }
.open-box { border: 1px solid #999; border-radius: 6px; min-height: 80mm; }  /* match the sketch area — a plan/mind-map needs the room */
```

## Grayscale Safety Quick Reference

**FAIL — NEVER use for text-heavy content:**
- `background: #333; color: white` (except short single-line headers)
- `background: rgba(...)` transparent overlays
- `color: #aaa` or lighter on white background

**SAFE — use these:**
- `background: #fff; border: 1.5px solid #333; color: #000` — outlined elements
- `background: #f5f5f5; border: 1px solid #999` — light reference boxes
- `background: #e8e8e8` — table headers, subtle fills

## Required `<head>` Includes

Always include the Phosphor Icons bold CSS in the `<head>`:

```html
<link rel="stylesheet" href="https://unpkg.com/@phosphor-icons/web@2.1.1/src/bold/style.css">
```

## Print Button HTML

Always include in the worksheet:

```html
<button class="print-button" onclick="window.print()"><i class="ph-bold ph-printer"></i> Print to PDF</button>
```

## Worksheet Structure

Worksheets are a flat flow of section blocks inside a single container. The browser paginates automatically, breaking between sections as needed.

```html
<button class="print-button" onclick="window.print()"><i class="ph-bold ph-printer"></i> Print to PDF</button>

<div class="worksheet">
    <div class="header">
        <!-- Title, subtitle, meta fields -->
    </div>

    <div class="intro-box">
        <!-- Introduction text -->
    </div>

    <div class="section">
        <!-- Section 1 content -->
    </div>

    <div class="section">
        <!-- Section 2 content -->
    </div>

    <!-- More sections as needed — browser breaks between them -->

    <div class="reflection-strip">
        <!-- Final reflection -->
    </div>
</div>
```

## Spacing Tiers

Three spacing tiers control density across the worksheet. **Standard is the default** — use it unless the content or audience calls for something different. All component patterns above show Standard tier values.

### When to use each tier

| Tier | Use when |
|---|---|
| **Compact** | Lots of content that needs to fit on fewer pages — dense reference sheets, checklists, observation forms |
| **Standard** | Most worksheets. **This is the default.** |
| **Spacious** | Worksheets with substantial handwriting space, or when the content benefits from more breathing room |

### Tier values reference

Apply these values consistently across all components when building a worksheet. The component patterns above use Standard values — adjust to the table below for Compact or Spacious.

| Property | Compact | Standard (default) | Spacious |
|---|---|---|---|
| **Body** | | | |
| `font-size` | 10px | 11px | 12px |
| `line-height` | 1.35 | 1.45 | 1.55 |
| **Header** | | | |
| `.header` padding-bottom | 6px | 8px | 10px |
| `.header` margin-bottom | 12px | 16px | 20px |
| **Sections** | | | |
| `.section` margin-bottom | 10px | 16px | 20px |
| `.section` padding-left | 10px | 12px | 14px |
| `.section-title` margin-bottom | 4px | 8px | 10px |
| `.section-header` padding | 4px 8px | 6px 10px | 8px 12px |
| `.section-header` margin-bottom | 6px | 10px | 14px |
| **Writing lines** | | | |
| `.write-line` height | 16px | 22px | 28px |
| `.write-line` margin-bottom | 3px | 5px | 6px |
| **Tables** | | | |
| `th` / `td` padding | 4px 6px | 6px 8px | 8px 10px |
| `.write-rows` td height (writing cell) | 12mm | 16mm | 20mm |
| `.col-input` `--rule-gap` (answer-line rhythm) | 6mm | 8mm | 10mm |
| **Response-space floors** (`min-height`, err generous) | | | |
| maths `.work-area` | 40mm | 48mm | 56mm |
| `.cloud-area` (word cloud) | 64mm | 74mm | 84mm |
| `.sketch-area` | 70mm | 80mm | 92mm |
| `.open-box` | 70mm | 80mm | 92mm |
| `.sort-bucket` | 24mm | 30mm | 36mm |
| **Boxes** (instruction, example, tip, info) | | | |
| padding | 6px 8px | 8px 10px | 10px 12px |
| margin-bottom | 6px | 10px | 14px |
| **Gaps** (flex gaps, label gaps) | | | |
| general gap | 4px | 6px | 8px |

### How to apply

Pick one tier for the entire worksheet — do not mix tiers within a single worksheet. During the design phase, confirm the tier with the user based on content density and audience needs.

**Page economy beats the floor when a page is at stake.** The `min-height` floors and the tier values above are minimums for the *answer space* — not a quota to fill the paper. If a sheet spills a few mm onto a near-empty extra page, prefer trimming discretionary white space, tightening gaps, or stepping the whole sheet down one tier to pull it back, rather than holding a height religiously and shipping a page that carries two lines. **Exception: open & creative spaces** (`.cloud-area`, `.sketch-area`, `.open-box`) exist *because* they need room — trim those last, after every other lever, since cramping them defeats their purpose (the v1→v2 audit's root cause).
