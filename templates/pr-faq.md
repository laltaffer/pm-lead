# PR/FAQ — Template

> Fields marked `[REQUIRED]` must be filled before this artifact passes its gate. An
> empty required field is a gate failure — checkable without judgment, by anyone
> (including a model that has not read anything else).

This is the NARRATIVE-stage artifact for `zero-to-one` work. For the full pass/fail
conditions this document is checked against, see [`gate-checks.md`](../gate-checks.md)
Stage 5. For why this document exists, when to write it, and how to find the objection
actually worth answering, see [`narratives.md`](../narratives.md) §2 and §5. This file
only prompts for content — it does not re-teach the method.

---

## Press release

**Headline** **[REQUIRED]**
(The product, in one sentence a customer would actually say.)


**Sub-head** **[REQUIRED]**
(Who it's for and what they get, in one line.)


**Summary** **[REQUIRED]**
(Compressed enough that a reader could stop here and still understand the offer.)


**Problem** **[REQUIRED]**
(The customer's problem today. No reference to the solution.)


**Solution** **[REQUIRED]**
(How this addresses the problem, in the customer's terms, not the org chart's.)


**Internal quote** **[REQUIRED]**
(A named role, not a name.)


**How to get started** **[REQUIRED]**
(The actual first step a customer takes, stated concretely.)


**Customer quote** **[REQUIRED]**
(Specific enough to be falsifiable — not generic praise.)


**Call to action** **[REQUIRED]**
(Where this goes next.)


---

## External / customer FAQ

The questions a prospective customer would actually ask before adopting this: pricing,
what it disrupts in their current workflow, how it compares to what they use today, and
why this instead of what they already use. Draft each from the harshest realistic
skeptic's side of the table, not a friendly colleague's — see `narratives.md` §5.

**Q1** **[REQUIRED]**


**A1** **[REQUIRED]**


**Q2** **[REQUIRED]**


**A2** **[REQUIRED]**


**Q3** **[optional]**


**A3** **[optional]**

(Add rows as needed. At least one answer across this FAQ and the Internal FAQ below must
concede a real cost, limitation, tradeoff, or losing scenario — an FAQ where every answer
reassures fails the gate.)

---

## Internal FAQ

The questions the organization needs answered before committing capacity.

**Unit economics** **[REQUIRED]**
(The assumptions under the numbers, not just the numbers.)


**Sizing** **[REQUIRED]**
(Bottom-up — see `templates/opportunity-assessment.md`. Don't restate a number here that
isn't already tiered and sourced in the bet ledger.)


**Dependencies** **[REQUIRED]**
(On other teams, systems, or vendors.)


**Risks** **[REQUIRED]**
(The specific risks that could sink this — not a category label like "execution risk.")


**What could break** **[REQUIRED]**
(What would have to be true for this to fail.)

---

## Pre-mortem

This is where the PR/FAQ earns its keep as a kill-it-cheaply document, not just a launch
announcement — before committing capacity, decide whether the failure below is one this
is willing to risk.

**[REQUIRED]**
(Stand a year past launch and write the failure as something that already happened,
naming the actual mechanism — not "bad luck" or "poor execution." See
[`narratives.md`](../narratives.md) §6 for the protocol this comes from.)


---

## Worked example

The skeleton above filled in, so the shape is unambiguous. Invented for illustration —
replace entirely with a real launch.

**Headline:** ShiftSplit closes out the tip pool in the time it takes to lock the
register.

**Sub-head:** For restaurant and salon shift leads who split tips by hand every night, an
automatic calculation they can see and trust in under two minutes.

**Summary:** ShiftSplit reads the clock-in/clock-out data and role weights already
sitting in the point-of-sale system, calculates each worker's tip share, and posts it to
the closing checklist — no spreadsheet, no separate login, no recalculating by hand
before anyone can leave.

**Problem:** Every night, a shift lead at an independent restaurant or salon closes out
by manually splitting the tip pool across servers, bussers, and other roles — usually in
a spreadsheet built years ago by someone no longer on staff — and re-checks the math
before anyone goes home.

**Solution:** ShiftSplit reads the numbers already sitting in the point-of-sale system at
close and produces the same split a shift lead would calculate by hand, in a format they
already recognize, without opening a second tool.

**Internal quote:** "Every minute a shift lead spends re-adding a tip pool by hand is a
minute they're not closing the floor. We're not selling a faster spreadsheet — we're
selling back that time." — Head of Product

**How to get started:** A shift lead connects their existing point-of-sale account,
confirms the tip-pool rule already in use, and the first automated split appears at the
next shift close.

**Customer quote:** "I used to stay twenty minutes after close double-checking the split
by hand. Now I check it once a week instead of every night." — Shift lead, independent
restaurant, 14-person staff

**Call to action:** Join the pilot; onboarding starts within one business day of signup.

**External FAQ, Q1:** Our tip-pool rule isn't a simple role-weighted split — the closing
manager also takes a fixed bonus off the top before the rest gets divided. Does
ShiftSplit handle that?
**A1:** Not yet. ShiftSplit calculates flat and role-weighted splits only; a fixed
off-the-top bonus, or any other one-off exception to the base rule, still has to be
pulled out and applied by hand before the remainder runs through ShiftSplit. A shop whose
policy leans on exceptions like this won't see the full time savings until exception
handling ships.

**External FAQ, Q2:** Our point-of-sale system already has a tip-split feature bundled in
— why pay extra for this?
**A2:** The bundled feature splits evenly by hours worked; it doesn't handle role-based
weighting or side-work adjustments, which is what shift leads are actually recalculating
by hand. If a shop's split rule is simple enough for the bundled feature to already cover
it, ShiftSplit has nothing to offer that shop.

**Internal FAQ, Unit economics:** At the pilot's assumed $49/month price and near-zero
marginal compute cost per shop, the current two-person build team breaks even around 40
paying shops. The pilot exists to find out whether 40 is realistic, not to assume it.

**Internal FAQ, Sizing:** ~38,000 target shops bottom-up (see
`templates/opportunity-assessment.md`); at a 2% year-one conversion assumption, that's
roughly 760 paying shops — the conversion rate itself is still `E4`, since no comparable
pilot has run yet.

**Internal FAQ, Dependencies:** A stable read-only export or API connection to at least
one point-of-sale provider before the pilot can start; a second provider before the pilot
can claim results beyond a single vendor's customers.

**Internal FAQ, Risks:** Two risks could actually sink this, not just slow it: a wrong
tip-split output touches payroll-adjacent numbers, which is a trust and liability problem
and not just a bug; and neither pilot point-of-sale provider has a public commitment to
keep third-party export access open.

**Internal FAQ, What could break:** If either pilot point-of-sale provider restricts
export access, or a single miscalculated split reaches a paycheck before being caught, the
pilot stops regardless of what the adoption numbers say.

**Pre-mortem:** One year out, ShiftSplit failed because one of the two pilot
point-of-sale providers narrowed its export terms mid-pilot, cutting off the read access
the automatic split depends on; shops on that provider reverted to the old spreadsheet
mid-shift with no warning, word of the reversion spread faster among the ~38,000 target
shops than the pilot's results did, and the two-person build team spent the quarter
negotiating API access instead of signing the next cohort — the pilot never got past the
40 paying shops needed to break even.

---

## Before you ship this

Re-read the press release cold. If it is boring, kill the idea now — that is this
document working, not failing.
