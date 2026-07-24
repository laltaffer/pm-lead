# Six-Pager — Template

> Fields marked `[REQUIRED]` must be filled before this artifact passes its gate. An
> empty required field is a gate failure — checkable without judgment, by anyone
> (including a model that has not read anything else).

This is the NARRATIVE-stage artifact when the team lens is active — see
[`altitude.md`](../altitude.md) §5 and [`gate-checks.md`](../gate-checks.md) Stage 5 for
the pass/fail conditions. For why this document is prose instead of slides, the style
rules and what each one closes off, and the silent-read protocol the meeting itself runs
on, see [`narratives.md`](../narratives.md) §4 — that craft lives there, not here. This
file only prompts for content and holds the section skeleton.

**Length.** The body below is six pages of prose — no bullets, no slide fragments.
Appendices behind it are unlimited: put supporting detail, data, and diagrams there rather
than trimming a claim out of the body to make room.

---

## Style checklist

Run this against the draft before it goes to the room. See `narratives.md` §4 for what
each rule closes off.

- [ ] Complete sentences only — no fragments.
- [ ] One point per paragraph.
- [ ] Sentences under about 30 words.
- [ ] Numbers, not adjectives, wherever a claim is measurable.
- [ ] No hedges — "some," "generally," "in most cases" removed or replaced with the number
  they were standing in for.

---

## Context

**[REQUIRED]**
(Where this decision sits: what's already been tried, and what changed to put it in front
of this room now, rather than leaving it with whoever already owns it.)


## The problem

**[REQUIRED]**
(Stated with no reference to the proposal below it. Evidence tiered per claim — `E0`
through `E5`, see [`bet-ledger.md`](../bet-ledger.md) §2.)


## What we propose

**[REQUIRED]**
(The decision the room is being asked to make, stated as a decision — not a menu of
options with no recommendation attached.)


## Why now

**[REQUIRED]**
(Why this decision can't wait for the next planning cycle.)


## How we will know

**[REQUIRED]**
(The metric this decision is judged against. Build the full North Star, guardrail, and
instrumentation detail in [`templates/measurement-plan.md`](measurement-plan.md) — this
section states the headline number, it doesn't duplicate that document.)


## What could break

**Real cost or losing scenario** **[REQUIRED]**
(Not a risk category like "execution risk" — the specific cost, tradeoff, or scenario in
which this decision loses. A section where every paragraph reassures fails this check.)


**Pre-mortem** **[REQUIRED]**
(Stand a year past the decision and write the failure as something that already happened,
naming the actual mechanism. See `narratives.md` §6 for the protocol.)


## What we are not doing

**[REQUIRED]**
(Published non-goals — see [`bet-ledger.md`](../bet-ledger.md) §5, refusal 3. An implied
non-goal is a gate failure here, same as anywhere else in this pack.)


---

## Worked example

Condensed to a paragraph per section so the shape is unambiguous — a real six-pager runs
each section to a full page or more of prose. Invented for illustration; replace entirely
with a real decision.

**Context:** ShiftSplit currently reads clock-in/out and role data from a shop's
point-of-sale system and stops there — nothing it produces reaches payroll. Three
independent payroll processors have approached the two-person build team this quarter
proposing a native integration, and the roadmap has no owner for that decision because it
sits above any one team's existing scope.

**The problem:** Forty-one of the roughly 140 shops on the paid plan (29%) still export
ShiftSplit's split as a spreadsheet and re-key it into payroll by hand every pay period
(billing-cohort export logs, `E2`). Nine of those forty-one have said in support tickets,
unprompted, that a wrong re-key has caused a paycheck error at least once (support-ticket
log, `E3`).

**What we propose:** Build one native integration, with the payroll processor already
used by the largest share of the re-keying cohort, rather than continuing to treat
payroll as an export problem each shop solves on its own.

**Why now:** The three inbound processor requests this quarter won't stay open — one has
already given a deadline for a decision before it commits its own integration engineering
elsewhere.

**How we will know:** Re-keying-cohort shops moving off manual export and onto the native
integration within two quarters of launch; see `templates/measurement-plan.md` for the
full metric tree this bet feeds.

**Real cost or losing scenario:** A payroll integration puts ShiftSplit's output directly
into a paycheck for the first time — a defect here is a payroll-accuracy incident, not a
support ticket, and the two-person build team has never operated at that liability bar.

**Pre-mortem:** One year out, the integration shipped, a rounding error in a
role-weighted split reached three paychecks before anyone caught it, the payroll
processor suspended the integration pending review, and the forty-one shops it was meant
to win went back to exporting by hand, now distrusting ShiftSplit's numbers more than
before the integration existed.

**What we are not doing:** Not building integrations with the other two processors this
cycle. Not building two-way sync that lets payroll corrections write back into
ShiftSplit's split history.
