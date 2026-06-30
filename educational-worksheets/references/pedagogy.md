# Worksheet Pedagogy — design grounding

Read this while surfacing design options (SKILL.md → "Design lenses"). Each lens below: the mechanism behind it, and **what it changes on the page.** These are decision-support, not a rulebook — ignoring a principle for a stated reason is fine; the value is being able to say what you're trading away.

---

## The lenses

### One outcome, every task earns its place.

Constructive alignment: state one learning outcome; every task earns its place against it. Core tasks carry the outcome's verb (recall / apply / analyse / evaluate / create); warm-up, retrieval, and setup tasks serve the outcome without sharing its verb, and a worked example scaffolds the tasks rather than being a task itself.

**On the page:** before a task goes on the sheet, ask what it does for the outcome. A task carrying the outcome's verb is core; a warm-up or scaffold earns its place by setting that work up. A task that does neither — three recall-and-copy items under an "analyse" outcome with nothing analytical to feed — is misaligned: it changes, or the outcome was overclaimed. This is the test that justifies *cutting* a task, not just adding one.

### Match the support to the learner.

The expertise-reversal effect: scaffolds that help a novice actively slow down someone who already has the skill — the worked example they no longer need becomes text to wade through. This lens governs the next three.

**On the page:** for a class new to the skill, keep the worked example and guided steps; for a capable class, strip them — fewer prompts, more open space, higher starting demand. One rule keyed to who's actually using the sheet, not two warring ones.

### Ease them in, then build up.

The worked-example effect and gradual release: lead with a fully worked example, then a guided (partial) attempt, then independent work, thinning the prompts and sequencing demand low → high.

**On the page:** the full → partial → blank progression is a layout decision — worked box at the top, half-filled version next, blank lines last. Calibrate the first item so most students get it right; early failure kills momentum more than early ease wastes it.

### Open by activating what they already know.

The retrieval-practice (testing) effect: a short, low-stakes recall of prior material at the start strengthens memory and surfaces gaps before new work lands on top.

**On the page:** budget a small opening block — two or three quick recall prompts on last lesson's material, no marks attached — before the new content. (Returning to an earlier topic later in the *same* sheet is interleaving, a distinct benefit — don't sell it as spacing, which needs time between sittings.)

### Chunk into clear, single-focus sections.

Segmenting and element interactivity: break material into labelled units that each carry one sub-skill, with visible boundaries, so working memory isn't asked to hold several things at once.

**On the page:** one section = one thing, each with a heading and a visible border (the left-border `.section` pattern). If a section is doing two jobs, split it. A wall of mixed tasks under one heading is the failure mode.

### Keep the answer space with the thinking.

Avoid split attention: when a student has to hold a question in mind while hunting for where to answer, or carry a label across the page to a diagram, that search is wasted load.

**On the page:** put the response right beside or under its question; put explanatory text against the diagram it describes, not in a separate block. Two columns that force the eye to ping-pong across the sheet are the anti-pattern.

### Cut anything that doesn't help the task.

Redundancy and coherence: extra material that restates what's already clear, or decorates without informing, *adds* load rather than reinforcing. More is not safer.

**On the page:** no prose paragraph restating a self-explanatory diagram; no clip-art; no label the layout already implies (an "Example / Your turn" header above a two-column split that already shows which is which). Cutting these is a design win, not a gap.

### Build in a way to self-check.

Formative assessment and effective feedback: students learn more when success criteria are visible up front and they can check their own work — provided the feedback targets the task and the process, never the student's self.

**On the page:** show success criteria before the task; include an answer key or worked solution where it fits; add a short "where to next" or self-rating. Keep self-checks at the level of the work ("did your sentence name the action?"), never the person ("are you a good writer?").

---

## Two principles that shape layout

- **Pair a visual with its text, and cue attention deliberately.** Words and pictures together beat either alone, and arrows / bold / numbering guide the eye to what matters. Where a diagram and an explanation belong together, place and cue them as a pair; don't add a decorative image that carries no information. (This is about paired channels for *everyone* — not a basis for "visual learners"; see Myths.)
- **Offer more than one way in and out; make relevance visible; leave white space.** Multiple means of representation (text + diagram + example) and of response (lines, table, checkboxes), a brief "why this matters" only where it changes how students work, and genuine breathing room. Licence to vary response formats and leave space — not a mandate to offer every format every time.

---

## Sizing the response space

How much room an answer gets is a design decision in its own right — too little and the student can't write; too much and the sheet wastes paper and reads as "I must have missed something." The full set of response modes and their CSS live in `references/css-patterns.md` (Response-space components); this is the judgment behind choosing and sizing them.

- **Size the space to the expected answer.** Estimate how long the answer should be and fit the space to it — roughly **one ruled line ≈ twelve words** of handwriting. A one-word check gets one line; a short paragraph gets three or four. Err a touch generous, not max-blindly: a second line under a one-sentence answer reads as a gap the student failed to fill. This justifies *cutting* a line as much as adding one.
- **Always give something to write on.** A ruled line for prose, a grid or dots for maths, a bounded box for non-prose. Never a bare blank where writing is expected — handwriting needs a baseline. Bounded boxes are for non-prose only (diagrams, word clouds, plans, maths working); prose gets lines.
- **Open and creative spaces fail from too little height.** A word cloud, a sketch area, a planning box — the pitfall is always vertical room, not width. Treat the `min-height` floors as minimums and err larger; a cramped brainstorm dies on the page. Brainstorms also run better in pairs or groups, where volume is the point — frame them that way when the task allows.
- **A maths working area is opt-in.** Students usually have a notepad or rough book, so a printed working grid often just costs space. Default to assuming a notepad and leave it off — add a dot- or squared-grid working area only when the teacher asks for the working to stay on the sheet.
- **Pack short selection items into columns.** True/false, short multiple-choice, and rating rows waste vertical space when each sits on its own full-width line with the mark flush right, leaving a dead gap. Two (or more) per row — or a header-anchored grid for ratings, anchors named once — is tighter and easier to scan. Reach for it whenever the items are short.

---

## Myths — never encode these

Not supported by the evidence. Never bake one into a worksheet or cite it as a reason for a design.

- **Learning styles / VAK** ("she's a visual learner, he's kinaesthetic"). Don't design "a version for visual learners" — dual-coding (above) is paired channels for everyone, not learner types.
- **The "learning pyramid" / retention percentages** ("we remember 10% of what we read, 90% of what we teach"). Never put a retention-percentage justification on a sheet.
- **"We only use 10% of our brain."** Not a design input.
- **Left-brain / right-brain learners** ("he's a right-brained type"). Not a design input.
