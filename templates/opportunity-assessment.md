# Opportunity Assessment — Template

> Fields marked `[REQUIRED]` must be filled before this artifact passes its gate. An
> empty required field is a gate failure — checkable without judgment, by anyone
> (including a model that has not read anything else). The one exception is a section
> whose heading scopes it to a mode this run is not in; that section is marked
> not applicable, and its fields are not counted empty.

This is the OPPORTUNITY-stage artifact for both build modes, `zero-to-one` and `iterate`.
Two sections below — **The four big risks** and **Idea maze** — are `zero-to-one` only;
each says so at its own heading, and in `iterate` their fields are not applicable rather
than unfilled. Everything else is required in both modes. For the full pass/fail
conditions this document is checked against, see `gate-checks.md` Stage 2. This file only
prompts for content — it does not re-teach the method.

---

## The four questions

**Business objective** **[REQUIRED]**


**How we will know we succeeded** **[REQUIRED]**


**Customer problem** **[REQUIRED]**


**Target market** **[REQUIRED]**


---

## Sizing worksheet

The bottom-up number is the primary figure. A top-down number, if used at all, is a
sanity check only — never the headline.

**Target customers** **[REQUIRED]**
(The count, and where it came from.)


**Price** **[REQUIRED]**
(If nothing will be charged, write `not monetized` here and name the unit this product
produces instead — people reached, hours saved per user per period, filings completed. The
sizing below then runs in that unit. Do not put a notional price here for a product nobody
will be billed for.)


**Conversion rate** **[REQUIRED]**
(And what it's based on — a comparable, a pilot result, or a stated assumption.)


**Bottom-up estimate** **[REQUIRED]**
(Target customers × price × conversion rate — or, where Price is `not monetized`, target
customers × conversion rate × the unit named above. Show the arithmetic, not just the
result.)


**Top-down sanity check** **[optional]**
(An industry or market-size figure, explicitly labeled a sanity check.)


If a top-down figure is given and it diverges from the bottom-up estimate by more than
roughly 15–20%, investigate why before proceeding. Don't average the two numbers or
default to whichever one is larger.

---

## Competitive alternatives

What the target customer uses today. This list fails the gate if it only names
competitors — it must also name the manual workaround and the option of doing nothing.

**Named competitors** **[REQUIRED]**


**Manual / workaround process** **[REQUIRED]**


**Doing nothing** **[REQUIRED]**


---

## The four big risks — `zero-to-one` only

**Scope.** This register is `zero-to-one`'s and it lives here, at Stage 2 — Stage 3 ranks
the assumptions sitting under it rather than registering them again. In `iterate`, write
`n/a — iterate` once under this heading and leave the fields below unfilled; they are not
applicable in that mode, so the empty-required-field rule does not fire on them.

Cagan's four (method in `mode-gate.md` §4, deliverable 2). Each needs an owner and its
current evidence tier (`E1`–`E5` or `E0` — see `bet-ledger.md` §2) — not a description of
the risk in the abstract.

### Value — will they use or buy it

- **Owner** **[REQUIRED]**
- **Current evidence tier** **[REQUIRED]**

### Usability — can they succeed at it

- **Owner** **[REQUIRED]**
- **Current evidence tier** **[REQUIRED]**

### Feasibility — can we build it

- **Owner** **[REQUIRED]**
- **Current evidence tier** **[REQUIRED]**

### Business viability — does the business, legal, brand, and support surface survive it

- **Owner** **[REQUIRED]**
- **Current evidence tier** **[REQUIRED]**

---

## Pursue / kill decision

**[REQUIRED]**
Pursue, kill, or park with an explicit revisit date. "Park it" with no date is a kill
wearing a maybe.


---

## Idea maze — `zero-to-one` only

**Scope.** Same rule as the four big risks above: in `iterate`, write `n/a — iterate` once
under this heading and leave the four fields unfilled. See `mode-gate.md` §4, deliverable
1, for the method. Four short paragraphs, not a checklist.

**History** **[REQUIRED]**
(Name a specific prior attempt — a company, a product, a shipped feature — and what
happened to it. "No one has tried this" with nothing behind it fails this field.)


**Analogy** **[REQUIRED]**
(How the same maze played out in an adjacent market or category.)


**Theory** **[REQUIRED]**
(What the underlying economics or technology predict, and why.)


**Direct experience** **[REQUIRED]**
(What we have personally seen or built that others have not.)

---

## Worked example

The sections above filled in, so the shape is unambiguous. Invented for illustration —
replace entirely with a real assessment. This one is a `zero-to-one` assessment of a
monetized product, so every section is filled; an `iterate` run would carry
`n/a — iterate` under the four big risks and the idea maze, and an unmonetized product
would carry `not monetized` at Price and size in its own unit.

**Business objective:** Grow paid, active shops using automated tip-split, as a wedge
into becoming the shift-close system of record for independent restaurants and salons.

**How we will know we succeeded:** At least 60% of pilot shops keep using the automated
split (no revert to manual) past the fourth week, and at least 3 of the pilot shops
convert to a paid plan by 2026-10-01.

**Customer problem:** Shift leads at independent restaurants and salons spend 15–30
minutes after every close manually splitting the tip pool across staff in a spreadsheet,
and re-check the math before anyone can leave.

**Target market:** Independent, non-franchise, full-service restaurants and salons with
8–25 tipped staff and an existing tip-pool policy, in markets where minimum staffing makes
a manual nightly split time-consuming.

**Target customers:** ~38,000 independent full-service restaurants in the target size
band (industry association count, filtered to non-franchise; `E4`).

**Price:** $49/month per shop.

**Conversion rate:** 2% of target customers convert within year one, based on comparable
point-of-sale add-on attach rates (`E4`).

**Bottom-up estimate:** 38,000 × $49 × 2% ≈ $37,200/month at full penetration of the
year-one target.

**Top-down sanity check:** A published estimate of restaurant back-office software spend
is far larger than the bottom-up figure; used only as a ceiling check, not the headline
(`E4`).

**Named competitors:** Two point-of-sale-native tip-pool modules, bundled into existing
point-of-sale suites rather than sold standalone.

**Manual / workaround process:** A shared spreadsheet template, usually built by a shift
lead or manager no longer on staff, re-copied every quarter.

**Doing nothing:** Splitting tips by hand from memory and a printed clock-in report — no
spreadsheet at all — common in smaller shops.

**Value — Owner:** Head of Product. **Current evidence tier:** `E3` — 22 sourced
complaints about manual tip-split time in a public restaurant-manager forum thread.

**Usability — Owner:** Design lead. **Current evidence tier:** `E0` — no direct
observation yet of a shift lead completing a close with the automated flow.

**Feasibility — Owner:** Eng lead. **Current evidence tier:** `E1` — point-of-sale export
integration already tested against two providers' sandbox data.

**Business viability — Owner:** Head of Product. **Current evidence tier:** `E0` —
support and liability exposure if an automated split is wrong on a payroll-adjacent number
has not been reviewed.

**Pursue / kill decision:** Pursue — proceed to the bet ledger and a 5-shop paper pilot
(see the worked example in `templates/bet-ledger.md`).

**History:** A point-of-sale add-on called RailSplit tried standalone automated tip-pool
calculation in 2019 and shut down within 18 months — pilot shops kept a parallel
spreadsheet running because RailSplit had no way to explain a split once a worker left
mid-shift, and shift leads never trusted the number enough to drop the spreadsheet.

**Analogy:** Automated expense-report tools hit the same fork in an adjacent market:
tools that hid the underlying calculation stalled at adoption, while tools that showed
the line-by-line math next to the total won trust within a quarter.

**Theory:** Point-of-sale systems already capture the clock-in/out and role data a split
needs; the marginal cost of computing a correct split approaches zero once that data is
read directly instead of re-keyed, the same shift that made automated payroll-tax
withholding viable once time-clock data became structured.

**Direct experience:** In three unpaid pilot walkthroughs watching shift leads run their
current manual process, every shop's actual split diverged in some small way from what
its printed policy sheet said — that quiet discrepancy is what a spreadsheet absorbs
without anyone noticing, and what an automated tool will have to surface before anyone
trusts it.
