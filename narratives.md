# Narratives — the documents that force the thinking

The NARRATIVE stage doesn't produce a status update. It forces the operator to write out,
in full sentences, why this is worth building and what would prove that judgment wrong.
Three artifact types cover the three situations the pipeline runs: the PR/FAQ for a
`zero-to-one` bet with no existing product to describe, the modern PRD one-pager for
`iterate` work on something already shipped, and the six-pager when the team lens is on
and a room full of people has to reach one decision together. Which one applies is set by
the mode, per [mode-gate.md](mode-gate.md) — not by house style or whichever template is
already open.

---

## 1. Why prose

A bullet is a claim with its connective tissue removed. "Improve onboarding" and "reduce
time-to-value" can sit stacked on a slide and look like a plan, but nothing on the slide
asserts that the first causes the second — the arrow between them is implied, not
written, and an implied arrow can't be checked. Writing the same content as a paragraph
removes that escape hatch: a sentence needs a verb, and the verb has to commit to whether
A causes B, merely correlates with B, or just happened near B in time. Most of the actual
thinking in a document lives in the connectors a bulleted list lets a writer skip.

This is also why a narrative exposes a presenter that a deck protects. A fluent speaker
can walk a room through a slide's gaps using tone and pacing, and the room can leave
feeling it followed an argument that was never actually made out loud. Put the same
content in front of the same room as text, read in silence, and the gaps have nowhere
left to go — the reader is alone with the sentences, and a sentence that doesn't hold
together looks exactly as broken on the page as it is.

Bezos made a version of this case directly: pushing an idea into sentence form is what
makes a document's priorities honest, because a writer who hasn't decided which of two
facts matters more cannot finish the sentence that would state it. Relative importance
gets settled in the act of finishing the sentence, not negotiated afterward once everyone
is already in the room.

---

## 2. The PR/FAQ — zero-to-one

For a `zero-to-one` bet, write the announcement before there is anything to announce. The
PR/FAQ is a roughly one-page mock press release plus a two-part FAQ, produced ahead of any
design or engineering work, per the deliverable ordering in [mode-gate.md](mode-gate.md)
§4.

State its purpose before drafting a word of it: **this is the cheapest point in the whole
pipeline to discover that an idea isn't worth building at all.** Most PR/FAQs never clear
the room. Treat that as the practice paying off, not as a project that came up short —
finding this out now costs an afternoon of writing, and finding it out later costs however
much engineering time gets spent before anyone thinks to ask. Bryar and Carr's account of
Amazon's working-backwards discipline treats a rejected PR/FAQ as routine, not as a
setback that needs explaining away. Judge the draft on that basis: a press release that
reads flat and unremarkable is not a copywriting problem waiting on livelier adjectives —
the flatness is itself the finding, and dressing up the language only buries what the
draft is actually reporting. A boring release is the signal to stop, not a draft that
needs punching up.

**The press-release skeleton**, in order:

1. **Headline** — the product, in one sentence a customer would actually say.
2. **Sub-head** — who it's for and what they get, in one line.
3. **Summary paragraph** — the whole release compressed enough that a reader could stop
   here and still understand the offer.
4. **Problem** — the customer's problem today, stated with no reference to the solution.
5. **Solution** — how this addresses it, in the customer's terms, not the org chart's.
6. **Internal quote** — a named role, not a name, explaining why this is worth doing.
7. **How to get started** — the actual first step a customer takes, stated concretely.
8. **Customer quote** — the sentence a satisfied user would say, specific enough to be
   falsifiable — not generic praise.
9. **Call to action** — where this goes next.

**External / customer FAQ.** The questions a prospective customer would actually ask
before adopting this — pricing, what it disrupts in their current workflow, how it
compares to what they use today, why this instead of what they already do. §5 covers how
to find the versions of these questions that could actually change a customer's mind,
rather than the versions that are easy to answer.

**Internal FAQ.** The questions the organization needs answered before committing
capacity: unit economics and the assumptions under them, sizing (bottom-up, per
[frameworks.md](frameworks.md)), dependencies on other teams or systems, the specific
risks that could sink it, and what would have to break for this to fail. Economics and
sizing here draw on the same evidence chain the bet ledger already requires — don't
restate a number here that isn't tiered and sourced there.

---

## 3. The modern PRD one-pager — iterate

For `iterate` work, the artifact is a living document of one to three pages, not a
specification anyone signs off on and files away. Structure, in order:

1. **Problem** — who has it, what the pain actually is, and what evidence says so, tiered
   per [bet-ledger.md](bet-ledger.md) §2. A problem statement carrying no evidence tier is
   an opinion wearing a PRD.
2. **Why now / strategic fit** — why this, why this period, and how it connects to the
   diagnosis from Stage 1.
3. **Goals and success metrics** — one or two numbers, not a checklist of features that
   would count as finished.
4. **Non-goals** — stated explicitly. See [bet-ledger.md](bet-ledger.md) §5 for why an
   unpublished non-goals list is its own gate failure.
5. **Proposed solution** — user-facing behavior and the key flows, described from outside
   the system, not as an architecture diagram.
6. **Open questions and risks** — named plainly, not buried under "TBD," and not resolved
   by inventing an answer nobody has evidence for.
7. **Rollout and measurement plan** — how it ships and how it's measured, feeding into
   [metrics.md](metrics.md).

What changed from the older, heavier PRD format, and why each change earns its place:

- **The problem statement leads, naming no solution.** A PRD that opens with the feature
  has already made the call the document was supposed to justify.
- **The document keeps changing after it's written.** Nobody stamps a final version and
  files it away; the team edits it in place whenever what they've learned shifts the
  picture, so the page in front of everyone stays close to current reality instead of
  freezing at whatever was true on the day someone approved it.
- **Success is a metric, not a tally of shipped work.** Counting finished features tells
  you when engineering stopped; it says nothing about whether the bet paid off. A number
  moving in the right direction does.
- **Non-goals are explicit**, not implied by omission — an unstated non-goal reappears
  three weeks later as scope creep wearing an innocent face.
- **Open questions stay written down as open**, instead of the document performing a
  completeness it doesn't have. A PRD with none of these is either a genuinely simple
  problem or a document hiding its own uncertainty.
- **It gets written after discovery has already done its job of cutting value risk**, not
  as a substitute for discovery. A PRD records what was learned; it is not where you go to
  avoid learning it.

---

## 4. The six-pager — team lens

Under the team lens, the artifact for a decision the whole room has to make together is
six pages of prose: no bullets, no slides, and appendices of any length behind it for
whoever wants to go deeper. The meeting opens with everyone reading it in silence for
twenty to thirty minutes before anyone speaks — the read happens in the room, not as
homework beforehand, so nobody arrives having only skimmed it on the way in.

Style rules, each one closing off a specific way a document can look finished while
hiding a hole in it:

- **Complete sentences only.** A fragment never has to commit to a claim; a sentence
  does.
- **One point per paragraph.** A paragraph that needs two topic sentences is two
  paragraphs wearing one.
- **Keep sentences under about 30 words.** Past that length a sentence stops being
  checkable — the reader loses the thread between subject and verb before reaching the
  period, and length becomes a place to bury a claim nobody actually supported.
- **Use numbers, not adjectives.** "Significant improvement" is an opinion; "moved from
  12% to 19%" is a fact the reader can argue with, which is the point.
- **Cut the hedges.** "Some users," "generally," "in most cases" — each one marks a spot
  where a specific, checkable number was available and the writer chose not to look it up.

A document held to this standard rarely survives being written once. Bezos described the
realistic production timeline for a memo like this as running closer to a week than an
afternoon: an early draft goes out to a few colleagues whose job is to find the weak
paragraph, not to be encouraging, and then the draft sits untouched long enough that its
author can come back to it reading as a stranger would, rather than as the person who
already knows what it was supposed to say. Treat the first draft as a discovery draft.
Budgeting an afternoon for a document meant to survive a silent, unfriendly read is how a
six-pager arrives at the meeting still carrying gaps nobody caught in time.

---

## 5. The forced FAQ — finding the strongest objection

Any FAQ can answer the questions that are comfortable to answer. The craft is aiming at
the one nobody in the room particularly wants asked. [gate-checks.md](gate-checks.md)
Stage 5 owns the mechanical pass/fail on the result; this section is about how the
strongest objection gets found in the first place, which the mechanical check cannot do
for you.

How to find it, rather than just checking afterward that something concedes:

- **Draft it from the other side of the table.** Write the question the way the harshest
  realistic skeptic would ask it — a competitor, a customer already happy with what they
  use, an executive who has to defend the budget — not the version a friendly colleague
  would lob.
- **Look for the question that ends the project, not the one that's merely awkward.**
  Something like "is the timeline realistic?" survives almost any answer, because there's
  always a plausible-sounding number to put in the blank. A question like "if the team
  that would build this is also the team the last few planning cycles called
  understaffed, what actually gets cut to make room for it?" can force a genuinely
  different decision, because there may not be a comfortable answer available — that's
  the one worth writing down.
- **Notice which question keeps almost getting cut.** A question that gets drafted and
  then removed before the FAQ goes out is usually the tell that it was the real one — a
  comfortable FAQ has no candidates it flinched away from.
- **Ask what would have to be true to change a skeptical reader's mind, then check whether
  that's actually in the document.** A question whose answer couldn't move the decision
  either way isn't testing anything; it's there to look thorough.

Answer whichever one is found this way honestly, cost and all. A real concession costs
nothing on the page and can save the actual budget; a false reassurance costs nothing on
the page and can cost the actual budget three quarters later, once the objection turns out
to have been the right one all along.

---

## 6. The pre-mortem protocol

The technique is Gary Klein's, published in *Harvard Business Review* (2007) out of his
work on how experts make decisions under uncertainty; the version below is the protocol as
this pipeline runs it, not his article restated.

Run this before the operator commits to the bet, not after work has already started — a
pre-mortem run post-launch is a retro wearing a different name, and by then it can no
longer change anything.

The prompt: stand the room a year past launch and treat the failure as something that
already happened, not something that merely might. Ask what specifically went wrong and
why — not a generic label like "bad luck," "poor leadership," or "internal politics," but
a scenario concrete enough to read as a paragraph, naming the actual mechanism that killed
it.

Run it in this order:

1. **Everyone writes their own failure scenario silently first**, with no discussion
   beforehand. Groupthink and seniority bias both work on whoever speaks first; writing
   before talking removes the chance for one loud, wrong theory to anchor the whole room.
2. **Then share in turn**, reading what was written rather than summarizing it from
   memory.
3. **Look for the scenario more than one person wrote down independently.** A failure
   theory several people reached without prompting is usually pointing at a real risk the
   plan hasn't addressed yet, not at pessimism for its own sake.

A pre-mortem and a bet's kill criterion do different jobs, and a narrative needs both: the
kill criterion is a number and a date that trigger a stop; the pre-mortem is the story of
the mechanism that would make that number happen, surfaced early enough that something can
still be done about it.
