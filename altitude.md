# Altitude — the team-scale lens

This file supplies the lens SKILL.md points to: what actually changes about product
leadership as the operator's scope grows from a single feature to a company. The lens
sits orthogonal to the four modes — it is switched on by naming an altitude, not by
picking `zero-to-one`, `iterate`, `strategy`, or `audit`. It does not own the six-pager's
craft; that discipline belongs to [narratives.md](narratives.md) §4, and this file only
says when the six-pager becomes the required artifact and what travels alongside it.

---

## 1. How the lens works

The pipeline defaults to a single operator with no formal reporting line under the
work — call that the solo case. Nothing about scope changes until the operator names an
altitude out loud: `staff`, `director`, `vp`, or `cpo`. Naming one is a deliberate act,
checked at [gate-checks.md](gate-checks.md) Stage 1 against a closed set — solo, staff,
director, vp, cpo — never inferred from a title, a headcount, or how big a bet feels.

Naming an altitude does two things at once. First, it turns on a set of organizational
artifacts a solo operator has no use for: a plan for aligning people who don't report to
the work, a narrative built to survive a room instead of a single reader, a view that
sequences more than one team's work at once, an instrument for reading someone else's
judgment rather than only your own. Second, it changes which parts of the frame carry
weight — influence and coaching barely register for a solo operator shipping their own
PRD, and become the whole game for someone whose actual leverage runs through other
people's decisions.

Here is the claim this entire file rests on: **altitude does not change what a strong
product leader is good at. It changes the size of the thing that skill gets applied to,
the form the skill has to take to be legible at that size, and the specific way its
absence shows up as a failure.** A leader who can't write a clear sentence fails the same
underlying way whether the reader is one engineer or a board of directors — what changes
is whether that failure surfaces next week or costs a quarter before anyone traces it
back to its source. Everything below is this one claim, worked through five altitudes,
not five separate skill sets bolted together.

---

## 2. The altitude table

| | Senior PM | Staff | Director | VP | CPO |
|---|---|---|---|---|---|
| **Unit of work** | A single product area, carried from problem to shipped result. | A hard problem that spans several teams and isn't formally anyone's to own. | A slate of bets running at once, plus the group of PMs responsible for them. | An entire product function, including how it's structured and how it runs day to day. | How the whole company thinks about product, argued from a chair at the leadership table. |
| **Primary medium** | A PRD, developed together with the designer and engineer already on the team. | A narrative written to earn support from a coalition with no obligation to give it. | The narratives the team produces, held together by one shared set of objectives. | How the org is shaped, who gets hired, and the standard those hires are held to. | What gets said to the board, where capital gets committed, and how the company is positioned. |
| **Influence** | Winning over the designer and engineer sitting beside you. | Winning over peers who have no reason to take your word for it. | Winning over leaders of functions that don't report to you. | Winning over the rest of the executive staff. | Winning over the board, and shaping the terms the market uses to talk about the company. |
| **Decisions** | Nearly everything is reversible, so most calls get made on the spot. | Most calls are still reversible, but part of the job is spotting the one that secretly isn't. | Less about making the call directly, more about setting up who is allowed to make it. | A small number of genuinely irreversible bets, chosen carefully. | Calls that could sink or make the whole company, made where everyone can see them. |
| **Prioritization** | Deciding the order of one team's backlog. | Deciding how one bet gets sequenced across several teams' separate backlogs. | Turning down entire initiatives, not individual line items. | Turning down entire markets, sometimes ones already carrying a budget. | Turning down entire strategies, and deciding where the company's people and money actually go. |
| **Coaching** | Showing a newer person on the team how it's done. | Setting the standard for peers by how you do the work, without any authority to enforce it. | Sitting down with each PM regularly and keeping a written view of where they stand against it. | Coaching the people who manage PMs, and owning the bar those managers hold their teams to. | Owning what the product organization's culture actually is, and who is being grown to lead it next. |
| **Customer contact** | Built into the week, every week. | Still direct, but pointed squarely at whatever problem is hardest right now. | Run on a deliberate schedule, with real effort spent keeping the team's own access from getting squeezed out. | Kept alive on purpose through a ritual chosen for that reason — or given up on knowingly, not by neglect. | Partly ceremonial, partly a habit that's still genuinely kept. |
| **Signature failure** | Sitting back and waiting to be handed instructions instead of arguing for what to build. | Landing on the right answer alone, with nobody around who was brought along to help carry it. | Refusing to actually hand off work that belongs to the team now. | A compelling vision with nothing built underneath it to make it real. | Chasing every move the market makes instead of standing for something specific. |

Read a cell against its neighbors, not in isolation — the point of the table is the
progression each row traces, not any single altitude's description on its own.

---

## 3. The three phase changes

Five altitudes, but only three of the boundaries between them are a genuine change in
kind rather than a change in degree. Naming which is which matters, because the other
two boundaries (Senior PM → Staff is itself gradual within some orgs, and Director → VP
often runs through an intermediate Group PM step) are handled by the table above; these
three are handled by rewriting how the operator works.

**Senior PM to Staff.** The job stops being about shipping and starts being about
earning the right call and getting people who don't have to listen actually act on it.
A Senior PM's output is a working feature; a Staff PM's output is a written case that a
room of peers, none of them obligated, chooses to follow. The artifact that carries the
weight changes with it: a PRD assumes a team already committed to the work, and once
persuasion is the actual job, the narrative takes over as the document the room reads
and argues with. What earns credit shifts too — a Staff PM is judged on having called
the right thing to build, not on the mechanics of building it — and the open questions
that used to resolve themselves given enough runway now stay open indefinitely. That is
the new steady state, not a rough patch to get through.

**Staff to Director.** The lever moves from the individual's own output to the combined
output of people who are not the Director. A Staff PM's best work still has their name
on a document; a Director's best work shows up as decisions other PMs made well, because
coaching has become the actual job instead of something squeezed in around it. Work
that used to be worth doing personally — drafting the strategy narrative, taking the
hardest customer call yourself — moves from the productive center of the role to the
part that has to be handed off, since holding onto it is now what's standing between the
team and its own growth. The distinctive way this goes wrong: a Director who still
writes every important document personally, which produces a team of hands executing
someone else's thinking rather than a set of people whose own judgment is improving.

**VP to CPO.** The scope of what's being run changes from a product organization to the
company itself. A VP's strategy narrative has to satisfy the product org and, at most,
the rest of the executive team; a CPO's has to hold up in front of the board and the
market, and it has to keep making sense of thousands of decisions nobody in that room
will ever personally review. What a CPO produces is not a roadmap or an operating plan —
it's a durable point of view: a stated position on where the business is going and why,
solid enough that someone three layers down can make a call in its spirit without
checking back first.

---

## 4. Constants at every altitude

Five things do not change shape as scope grows, even though everything in §2 and §3
does. Treat any of these five going missing at any altitude as the same defect, whether
it shows up in an APM or in a CPO.

- **Clarity of thought expressed in writing.** The size of the room a document has to
  survive changes; the requirement that the writing be checkable — a claim, not a mood —
  does not. A muddled sentence from a CPO costs more to unwind than one from a Senior PM,
  but it is the identical failure, not a worse category of one.
- **Customer contact.** The cadence and the ritual around it change altitude by altitude
  (§2's row above), but going to zero at any altitude is a failure everywhere it happens,
  not a privilege that seniority earns out of.
- **High-integrity commitments.** Committing rarely, precisely, and then actually hitting
  what was committed to is what makes a person's word worth something at any scale —
  sandbagging to guarantee a win and over-promising to please a room are both
  disqualifying, at an APM's sprint or a CPO's board date alike.
- **Disagree and commit.** Registering real dissent before a decision is made, then
  giving it full, visible support afterward — including defending it to your own
  people — is the same discipline whether the decision is which button copy ships or
  which market the company enters next.
- **Operating at all levels, with no task beneath you.** The willingness to drop from a
  multi-year bet down into one broken detail and back up again in the same conversation,
  treating no piece of the work as too small to look at directly, holds exactly as much
  at the top of the ladder as at the bottom — it is not something a leader graduates out
  of once there are people to delegate to.

Three of those five are named in phrasing that comes from **Amazon's Leadership
Principles**, the sixteen dimensions Amazon publishes as its own evaluation standard
(https://www.amazon.jobs/content/en/our-workplace/leadership-principles): *disagree and
commit*, the high-integrity view of what a commitment is worth, and *operating at all
levels with no task beneath you*. The labels are theirs and are credited as such; the
descriptions under each one, and the claim that these five hold constant across altitudes,
are this file's.

---

## 5. Artifacts added per altitude

Naming an altitude is what turns these four on. None of them exists for the solo
operator, because none of them has an audience until there's an organization around the
work.

- **Stakeholder alignment plan** — appears from `staff` upward, the point at which
  influence starts running through people with no obligation to listen. It names who
  needs to be pre-wired before a decision is asked for in a room, what each of them
  needs to hear stated in their own terms before they'll support it, and where the
  strongest quiet objection is likely to come from — built before the meeting, not
  assembled afterward to explain why it didn't land.
- **Executive narrative** — the six-pager becomes the primary artifact from `staff`
  upward, exactly as the first phase change in §3 describes. What the document has to
  do, and the style rules that keep it honest, are set out in
  [narratives.md](narratives.md) §4 — read the craft there rather than here; this file
  only fixes the point at which that form, instead of a PRD or a slide deck, is what the
  operator is expected to produce.
- **Organizational sequencing** — appears from `director` upward, once there is a
  portfolio of bets and a bench of PMs to sequence across rather than one backlog. It
  extends [SKILL.md](SKILL.md) Stage 4's Now/Next/Later logic across teams instead of
  within one, with the same appetite discipline and the same requirement that non-goals
  be published rather than implied.
- **Two-number coaching gap analysis** — appears from `director` upward, once coaching a
  direct report's judgment, not just reviewing their output, is the job. Rate each
  competency twice on a 0–10 scale for each person being coached: once for where they
  need to be to perform well at their role, once for where they actually are today. The
  difference between the two numbers ranks the gaps; coach the largest ones first, and
  re-rate on a fixed cadence rather than once at hiring and never again. This two-pass
  rating method is the operational core of the coaching assessment described in Cagan's
  SVPG coaching material (https://www.svpg.com/coaching-tools-the-assessment/) —
  described here, not reproduced from there.

---

## 6. Competency reference

Public models for naming what a strong product person is good at do not converge on one
another — each names its own dimensions, its own count, and its own labels. The four
top-level groupings below **follow the four categories of Ravi Mehta's Product Competency
Toolkit** (https://blog.ravi-mehta.com/p/product-competency-toolkit) — that is where the
count of four and the territory each one covers come from. What is this pack's own is the
gloss: each grouping is described here in this file's words and against this pipeline's
stages. His twelve sub-competencies and the leveling matrix that grades them are **not
reproduced here** — go to the source for those. Other public models organize
the same territory differently rather than agreeing with it: Intercom's ladder (cited
below) is built around five distinct dimensions, and Meta's official model (cited below)
uses three — nobody here is converging on four.

- **Execution** is the territory of turning a decided direction into a product that
  actually ships, works, and holds up in a customer's hands; a useful marker is whether
  requirements land clearly enough for a team to act without guessing.
- **Customer insight** is the discipline of knowing the customer well enough to be right
  about them, which shows up in whether data gets read for a real signal rather than a
  comfortable one, and in whether the resulting product reflects what customers actually
  say in their own words.
- **Strategy** is what connects the work in front of a team today to the business outcome
  and company direction it has to serve tomorrow.
- **Influencing people** is getting things done through people who don't report to the
  operator as well as people who do, a range that runs from a single stakeholder
  relationship up through leading and developing a team.

Two public sources are worth reading directly for the fuller shape of this, rather than
having either restated here. **Ravi Mehta's Product Competency Toolkit**
(https://blog.ravi-mehta.com/p/product-competency-toolkit) is the most complete public
account, with its own leveling matrix from APM through VP — go to the source for the
specific competencies and level definitions it lays out; they are not reproduced in this
file. **Intercom's PM career ladder**, published openly under CC BY-SA 4.0 via
progression.fyi (https://progression.fyi/f/intercom), is a second real-company data
point built around its own distinct set of dimensions across its own levels — read it at
the source; its matrix and its named dimensions are not reproduced here either, and any
derivative built directly from that matrix would carry its share-alike terms forward in
a way this MIT-licensed pack cannot.

A sourcing caveat carries through everything above: **neither Google nor Amazon
publishes an official PM competency rubric.** Amazon's only public evaluation dimensions
are its sixteen Leadership Principles; anything more granular circulating for Amazon PM
levels is prep-vendor reconstruction. The same is true of Google — the five or six
dimensions that show up in interview-prep content are secondhand, not a document Google
has published, and should be labeled as such wherever they're mentioned. **Meta is the
exception**: it does officially publish three PM evaluation dimensions — Product Sense,
Analytical Thinking, and Leadership & Drive — at
https://www.metacareers.com/PM-prep-onsite/. Treat that one as citable fact and treat any
other company's level-by-level detail as secondhand until the company itself publishes
it.
