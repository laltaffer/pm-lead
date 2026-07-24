# PRD One-Pager — Template

> Fields marked `[REQUIRED]` must be filled before this artifact passes its gate. An
> empty required field is a gate failure — checkable without judgment, by anyone
> (including a model that has not read anything else).

This is the NARRATIVE-stage artifact for `iterate` work. For the full pass/fail
conditions this document is checked against, see [`gate-checks.md`](../gate-checks.md)
Stage 5. For why the shape below replaced the older, heavier PRD format, see
[`narratives.md`](../narratives.md) §3. This file only prompts for content — it does not
re-teach the method.

Unlike the other artifacts in this pack, this one keeps changing after it's written — edit
it in place as the picture shifts, rather than filing a final version away.

---

## Problem

**Who has it, what the pain is, and what evidence says so** **[REQUIRED]**
(Name the affected user, the pain in their words, and tier the evidence per claim — `E0`
through `E5`, see [`bet-ledger.md`](../bet-ledger.md) §2. A problem statement with no
evidence tier is an opinion wearing a PRD.)


---

## Why now / strategic fit

**[REQUIRED]**
(Why this, why this period, and how it connects to the diagnosis that opened this work.)


---

## Goals and success metrics

**[REQUIRED]**
(One or two numbers this moves. Not a checklist of features that would count as
finished — a metric moving in the right direction, full stop.)


---

## Non-goals

**[REQUIRED]**
(Stated explicitly, not implied by omission. See [`bet-ledger.md`](../bet-ledger.md) §5,
refusal 3 — an unpublished non-goals list is its own gate failure, and an unstated one
reappears later as scope creep wearing an innocent face.)


---

## Proposed solution

**[REQUIRED]**
(User-facing behavior and the key flows, described from outside the system — not an
architecture diagram.)


---

## Open questions and risks

**Open questions** **[optional]**
(What's genuinely still unresolved. A problem simple enough to have none is fine — see
`narratives.md` §3. Do not fill this by inventing an answer nobody has evidence for.)


**Risk that concedes a real cost or limitation** **[REQUIRED]**
(Not a risk category like "execution risk" — the specific cost, tradeoff, or scenario in
which this loses. See `narratives.md` §5 for how to find the one worth writing down
instead of the comfortable one.)


**Pre-mortem** **[REQUIRED]**
(Stand a year past ship and write the failure as something that already happened, naming
the actual mechanism — not "bad luck" or "poor execution." See `narratives.md` §6 for the
protocol this comes from.)


---

## Rollout and measurement plan

**[REQUIRED]**
(How this ships and how it's measured, in enough detail to hand off. Build the full
North Star / guardrail / instrumentation build-out in
[`templates/measurement-plan.md`](measurement-plan.md) — this section restates the
headline metric and rollout shape, it doesn't duplicate that document.)


---

## Worked example

The sections above filled in, so the shape is unambiguous. Invented for illustration —
replace entirely with a real PRD.

**Problem:** Owners running more than one ShiftSplit shop have to open each location's
account separately to see whether last night's close went clean, so they can't tell
without checking every shop by hand whether any shift needed a manual override.
Twenty-six of the roughly 140 shops on the pilot's paid plan now operate two or more
locations (internal billing data, `E2`), and eight of those owners have asked support,
unprompted, for "one screen that shows all my shops" (support-ticket log, `E3`).

**Why now / strategic fit:** The original pilot and PR/FAQ addressed a single shop's
shift lead; multi-location owners are the first expansion cohort the product has, and
losing them to a spreadsheet built for comparing shops undoes the trust the single-shop
product already earned.

**Goals and success metrics:** Cut the "did last night close clean" support-ticket rate
from multi-location owners by half within one quarter, and get weekly login to the new
roll-up screen from at least 65% of multi-location owners.

**Non-goals:** Not building payroll export from the roll-up. Not building a public API.
Not adding a cross-location financial total — the roll-up reports close status, not
dollars.

**Proposed solution:** A single roll-up screen, reachable from the existing account menu,
listing each location's most recent shift close as either "clean" or "overridden," plus
that location's override rate for the trailing seven days. No new login, no separate
tool.

**Open questions:** Whether an owner with more than eight locations needs sorting or
filtering beyond a flat list — not yet tested at that scale.

**Risk that concedes a real cost or limitation:** The roll-up shows *that* a shift was
overridden, not *why* — an owner still has to open the individual shop's account to see
the reason, so the screen only partially replaces the manual checking it targets.

**Pre-mortem:** One year out, the roll-up failed because it told owners a shift had been
overridden without ever telling them why, so owners kept clicking into every shop's
account out of habit to get the reason, the roll-up became a screen that confirmed
nothing, and weekly login on it fell under 20% by the second month.

**Rollout and measurement plan:** Canary to the 5 multi-location owners already on the
pilot's paid plan for two weeks before opening to the full cohort; measured in
`templates/measurement-plan.md` under the "Location roll-up" bet block.
