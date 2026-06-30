# Curated Patterns — annotated worksheet building blocks

Load this for structure: small, correct snippets of the patterns worksheets are built from, each with a note on when to reach for it and what it avoids. **Study these for shape, then design fresh** — never copy a past sheet wholesale. The right pattern is the one that fits *this* worksheet's purpose.

Two rules govern every snippet here:

- **`references/css-patterns.md` is authoritative.** Class names, spacing values, and pagination behaviour come from there. If a snippet below ever drifts from it, css-patterns.md wins. These are illustrations, not the source of truth.
- **Sample prose models the voice contract.** Every line shown here is written the way student-facing text should read: an *instruction* opens on a concrete imperative verb with that verb bolded; a *framing line* is a plain full sentence or a genuine question, not bolded. Either way — concrete, actable, grammatical, no filler. Match that register (`references/voice.md`).

The skill used to ship a set of older full-HTML samples; they were removed (outdated patterns, and most were course-specific to one teacher's classes rather than general examples). The **Anti-patterns** section at the end keeps what they taught us to avoid.

---

## Section skeleton — header, framing, content

Every section is a labelled unit with one job. The framing line tells the student what the section is for; it sits *between* the header and the content, so it is part of the print break-chain (see css-patterns.md — a framing paragraph is the #1 missed `break-after: avoid`).

```html
<div class="section">
  <div class="section-title">
    <i class="ph-bold ph-magnifying-glass"></i>
    <span>Spotting telling, not showing</span>
  </div>
  <p class="section-framing">Which sentences show the feeling through an action, and
    which simply name it?</p>
  <!-- response blocks go here -->
</div>
```

- **Why:** one Phosphor icon matched to the section's function (a magnifying glass for finding/identifying), a visible left border, one focused task. The framing line is a plain question that orients the section — not a bolded command; the doing happens in the response blocks (the instruction, if any, opens on a bolded verb).
- **Reach for it:** as the wrapper for every section. Vary the icon to the function, never for decoration.

---

## Reference patterns — what students consult

### Light terminology box (preferred)

```html
<div class="terminology-box">
  <strong>Telling</strong> names the feeling outright: <em>She was nervous.</em><br>
  <strong>Showing</strong> puts it in what the character does: <em>She kept
  checking the door.</em>
</div>
```

- **Why:** light fill with a dark border survives a grayscale photocopy. Use this for anything longer than a single line.
- **Avoid:** the dark `.terminology-box-dark` for multi-line content — `#333` fill with white text turns to a black smear on a standard copier. Dark bars are for short single-line headers only.

### Worked-example box

```html
<div class="example-box">
  <strong>Worked example.</strong> "He slammed the laptop shut and walked out" —
  the anger is in the action, not in the word <em>angry</em>.
</div>
```

- **Why:** leads with a fully worked case before students attempt their own (the scaffold/gradual-release layout — see `references/pedagogy.md`). On a sheet for a capable class, drop the worked example and start at the guided step.

---

## Response patterns — what students produce

### Open vs. prompted writing lines

```html
<!-- Open: maximum room, minimum steer -->
<div class="write-line"></div>
<div class="write-line"></div>

<!-- Prompted: a label anchors the line when you want a specific kind of answer -->
<div class="labeled-row">
  <span class="row-label">Stronger verb</span>
  <span class="row-line"></span>
</div>
```

- **Why:** open lines suit reflective or creative work where pre-naming the answer would do the thinking for the student; prompted lines suit a targeted response. Match the steer to the task — don't pre-pick the method on an open task.

### Worked → guided → blank progression

```html
<div class="example-box"><strong>Worked.</strong> tired &rarr; "rubbed her eyes and missed the next line"</div>

<div class="labeled-row">
  <span class="row-label">bored &rarr;</span>
  <span class="row-line"></span>
</div>

<p><strong>Choose</strong> your own feeling and show it in one sentence.</p>
<div class="write-line"></div>
```

- **Why:** full → partial → blank fades the support across the section. The prompts thin out and the demand rises — the layout *is* the scaffolding. The closing line directs the blank-stage action, so it is an *instruction* (opens on the bolded verb **Choose**), not a framing line — see the instruction-vs-framing boundary in `references/voice.md`.

### Structured table — 2 given + 1 to write

```html
<table class="data-table write-rows">
  <colgroup>
    <col style="width:40mm">  <!-- Quotation — sized to this sheet's quotes -->
    <col style="width:48mm">  <!-- What the writer is doing — phrase-length, so wider -->
    <col>                     <!-- Effect — the answer column takes the rest -->
  </colgroup>
  <thead>
    <tr><th>Quotation</th><th>What the writer is doing</th><th class="col-input">Effect on the reader</th></tr>
  </thead>
  <tbody>
    <tr class="worked"><td>"a thousand tiny knives"</td><td>an extended metaphor sustained across the stanza</td><td class="col-input">builds the cold into a relentless, deliberate assault</td></tr>
    <tr><td>"the door sighed shut"</td><td>personification of an ordinary object</td><td class="col-input"></td></tr>
  </tbody>
</table>
```

- **Why:** two given columns hand the student something to work from; the third is theirs to write. The answer column is the protected one — it keeps a generous writing width (a 72mm floor) and carries **ruled lines** so the student has a baseline, not an open box; you size the *given* columns to this sheet's real content with the `<colgroup>` (agent-fit, not a rigid third each — the audit's collapsed-cell failure) and mark the answer column header **and its body cells** `.col-input`. `.write-rows` gives every answer cell a real writing height instead of a ~3.4mm hairline. A worked first row sets the depth expected; `#e8e8e8` header fill is grayscale-safe. Three columns here because the 2nd carries real text; when it's just a short label throughout (1–2 words), **prefer to fold it into the first** (quote bold, label italic) and run two columns — the answer still floors (markup: `css-patterns.md` → Tables).
- **Reach for it:** when the response has consistent parts worth separating. Don't use a table when a single open line would do; the grid then just costs space.

### Rating scale (anchored, header grid)

```html
<div class="rating-grid">
  <span></span><span class="rg-head">Strong</span><span class="rg-head">Developing</span><span class="rg-head">Needs work</span>
  <span>Forming the past tense</span><span class="rg-box"></span><span class="rg-box"></span><span class="rg-box"></span>
  <span>Using apostrophes</span><span class="rg-box"></span><span class="rg-box"></span><span class="rg-box"></span>
</div>
```

- **Why:** anchored points (Strong / Developing / Needs work) tell a student what each point means; a bare, unanchored 1–5 scale doesn't. Name the anchors **once** across the top and left-pack the boxes — repeating "Strong / Developing / Needs work" on every row wastes space and shoves the marks to the page edge. A numeric scale is fine when its points are anchored — every number named, or just the endpoints labelled (0 = not yet … 3 = confident) for a continuum, as in the self-diagnostic above. Keep self-rating at the level of the work, never the person.

### Self-diagnostic → matched resource bank

```html
<!-- Step 1 — rate yourself; anchor the scale's endpoints + give a visible instruction -->
<p><strong>Mark</strong> one box in each row: 0 = not yet, 3 = confident.</p>
<table class="data-table">
  <thead><tr><th>Area</th><th>0<br>not yet</th><th>1</th><th>2</th><th>3<br>confident</th></tr></thead>
  <tbody>
    <tr><td>Getting started</td><td></td><td></td><td></td><td></td></tr>
    <tr><td>Staying focused</td><td></td><td></td><td></td><td></td></tr>
  </tbody>
</table>

<!-- Step 2 — a resource bank under the SAME labels -->
<div class="section">
  <div class="section-title"><i class="ph-bold ph-toolbox"></i><span>Getting started</span></div>
  <p class="section-framing">Two things to try when this is the part you find hard.</p>
  <div class="labeled-row"><span class="row-label">Your own idea</span><span class="row-line"></span></div>
</div>
```

- **Why:** the self-rating isn't busywork — it points each student to the matching part of the bank, so one sheet serves a class that needs different help. The "Your own idea" line keeps it open, not prescriptive.
- **Reach for it:** when students differ in where they're stuck (study skills, writing weaknesses, exam prep). Keep the area labels identical between the grid and the bank, or the routing breaks.

### Fill the gaps (cloze), with or without a word bank

```html
<!-- Cloze: the blank sits inside the sentence at the point of difficulty -->
<p class="cloze">Yesterday we <span class="gap short"></span> (go) to the museum and <span class="gap short"></span> (see) the exhibition.</p>

<!-- Word bank: turns recall into choosing between confusable forms -->
<div class="word-bank"><span class="wb-label">Word bank:</span>
  <span class="chip">their</span><span class="chip">there</span><span class="chip">they're</span></div>
<p class="cloze"><span class="gap short"></span> going to leave <span class="gap short"></span> coats over <span class="gap short"></span>.</p>
```

- **Why:** cloze targets one point of difficulty without asking for a whole sentence; size each gap to the word it expects. Add a word bank only when the skill is discriminating between confusable options, not free recall.

### Choose & mark — the mark's shape carries the cardinality

```html
<!-- Choose one: a round mark signals single-select -->
<div class="choice-row"><span class="choice-box one"></span><span>The dog wagged its tail.</span></div>

<!-- Choose all that apply: a square mark; the instruction names the scope ("every") -->
<div class="choice-row"><span class="choice-box"></span><span>The bus was late again.</span></div>

<!-- True/false: two per row so the marks sit by the statement, not flush right -->
<div class="tf-grid">
  <div class="tf-item"><span class="stmt">A noun names a person, place, or thing.</span>
    <span class="tf-pair"><span class="tf-opt">T <span class="choice-box"></span></span><span class="tf-opt">F <span class="choice-box"></span></span></span></div>
</div>
```

- **Why:** round for one, square for many — the mark's shape stops a student ticking two where one is wanted. Pack short items into columns; a full-width row with the mark flush right wastes space.

### Matching, ordering, sorting

```html
<!-- Matching: write the letter (survives a photocopy; faster than a drawn line) -->
<div class="match">
  <div class="match-col">
    <div class="match-item"><span class="match-key">1.</span><span class="letter-box"></span><span>Simile</span></div>
  </div>
  <div class="match-col">
    <div class="match-item"><span class="match-key">A</span><span>Comparison using <em>like</em> or <em>as</em></span></div>
  </div>
</div>

<!-- Ordering: state the range so the set reads as complete -->
<div class="order-row"><span class="order-box"></span><span>The sun heats the surface of the sea.</span></div>

<!-- Sorting: bounded buckets with grayscale-safe headers and real height -->
<div class="sort-grid">
  <div class="sort-bucket"><div class="bk-head">Nouns</div></div>
  <div class="sort-bucket"><div class="bk-head">Verbs</div></div>
</div>
```

- **Why:** each gives structure to a categorising task. Keep the matching columns short; give the sort buckets room to write the items in.

### Mark up given material — annotate, label a diagram

```html
<!-- Annotate: the student marks the text itself; generous line height leaves room -->
<p class="given"><span class="num">1.</span>The cat slept on the warm windowsill all afternoon.</p>

<!-- Label a diagram: the worksheet supplies the label lines (writing room above each rule,
     stacked from the top); source the image separately -->
<div class="diagram">
  <div class="diagram-art"><!-- generated or image-searched diagram --></div>
  <div class="label-lines">
    <div class="label-line"></div>
    <div class="label-line"></div>
  </div>
</div>
```

- **Why:** annotation works on text already on the page — no answer box, just room to mark. For label-a-diagram the image itself isn't HTML: generate it (a clean educational-diagram prompt) or image-search it, or let the teacher add one; the worksheet supplies the label lines, one per part — each a slot with room to write *above* its rule, top-aligned so the first line isn't starved and the last leaves no dead space (see `css-patterns.md` → Label a diagram).

### Open & specialised spaces (bounded, non-prose)

```html
<!-- Maths working — OPT-IN (default: assume a notepad). Dots are the flexible default;
     a squared grid for column arithmetic. A bounded box collects the final answer. -->
<div class="work-area dots"></div>
<div class="answer-row"><span class="lbl">Area:</span><span class="answer-box dual"></span><span class="lbl">Perimeter:</span><span class="answer-box dual"></span></div>

<!-- Word cloud (seed term; lean to pair/group) · sketch area · plain open box -->
<div class="cloud-area"><span class="seed">the sea</span></div>
<div class="sketch-area"></div>
<div class="open-box"></div>
```

- **Why:** bounded blank space is for non-prose only — working, brainstorms, diagrams, plans. The failure mode is too little height: the `min-height` floors in `css-patterns.md` are minimums, err larger. Keep grid/dot rules at `~#a8–#b8` grey for the photocopier. A maths working area is opt-in — add it only when the teacher wants working kept on the sheet. A subject-specific frame (number line, coordinate grid, Venn, timeline) isn't a separate component — a student draws it in an open box.

---

## Flow & self-check patterns

### Tip / pull-quote

```html
<div class="tip-box">
  <strong><i class="ph-bold ph-lightbulb"></i> One favourite word at a time.</strong>
  Every writer leans on a few — <em>very, really, just, suddenly.</em> Once is fine;
  by the third time, the reader notices.
</div>
```

- **Why:** a left-border pull-quote gives a tip weight without a heavy box. When a tip holds several items, give each its own line rather than running them together.

### Success criteria + reflection strip

```html
<div class="reflection-strip">
  <div class="section-title">
    <i class="ph-bold ph-check-square"></i>
    <span>Before you hand this in</span>
  </div>
  <div class="labeled-row"><span class="checkbox"></span><span>Every feeling is shown through an action, not named outright.</span></div>
  <div class="labeled-row"><span class="checkbox"></span><span>You replaced at least three telling sentences.</span></div>
</div>
```

- **Why:** puts the success criteria where the student can check their own work before the teacher sees it (formative self-check — see `references/pedagogy.md`). Criteria describe the *work*, in concrete terms a student can verify alone.

---

## Distribution

### Two-up cut-apart sheet

```html
<div class="worksheet">
  <div class="copy"><!-- the form --></div>
  <div class="cutting-line"><i class="ph-bold ph-scissors"></i> cut here</div>
  <div class="copy"><!-- an identical second copy --></div>
</div>
```

- **Why:** two identical copies of a short form on one A4 — print once, cut the sheet in half for two students. Halves the paper and the printing. The cut guide is print-only (`.cutting-line` — see `references/css-patterns.md`), so the on-screen design stays clean.
- **Reach for it:** short single-page forms only — exit tickets, quick quizzes, half-page reflections. Each copy must fit comfortably in half an A4; never two-up a multi-section worksheet.

---

## Anti-patterns — what the old samples got wrong

The skill once shipped 14 legacy full-HTML worksheets as examples. They were **removed** — they modelled patterns the skill no longer follows, and most were course-specific teaching materials rather than general examples. The lessons survive here; never imitate any of these:

- **`min-height: 297mm` on `.worksheet`** — forces a fixed page height, creating huge white gaps and broken pagination. Never set it; let content flow and the browser paginate.
- **Default Name / Date fields** — added by reflex, cost space, and unneeded for in-class work. Omit administrative fields unless collection, assessment, hand-in, or anonymity actually requires them.
- **Manual page breaks** (`<div class="page-break">`) — fight the browser's pagination instead of using the break-chain. The only deliberate break is `.new-page` at a real content divider; everything else is a missing `break-after: avoid` in the chain.
- **Emoji / mojibake icons** — decorative emoji that render inconsistently and corrupt in print. Use one purposeful Phosphor bold icon per section header, matched to function.
- **Colour-dependent instructions** ("underline in blue") — vanish on a grayscale photocopy. Keep every instruction readable in black and white.
- **Print-dialog alerts telling the user to set margins to "None" or "Minimum"** — these push content to the paper edge. The skill bakes a safe `@page` margin instead; the teacher keeps Margins on **Default**.

If you find yourself reaching for any of these, the fix is in `references/css-patterns.md`.
