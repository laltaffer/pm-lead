# Measurement Plan — Template

> Fields marked `[REQUIRED]` must be filled before this artifact passes its gate. An
> empty required field is a gate failure — checkable without judgment, by anyone
> (including a model that has not read anything else).

This is the MEASURE-stage artifact. For the full pass/fail conditions this document is
checked against, see [`gate-checks.md`](../gate-checks.md) Stage 6. For the method behind
North Star selection, metric trees, guardrails and counter-metrics, hypothesis sizing, and
when *not* to run an experiment, see [`metrics.md`](../metrics.md). This file only prompts
for content — it does not re-teach the method.

---

## North Star

**Stated in words** **[REQUIRED]**
(What durable business result this leads toward, and what the customer actually gets out
of it — before any number appears. See `metrics.md` §1 for the two bars it has to clear.)


**Stated as a metric** **[REQUIRED]**
(The specific, directly-computable number the sentence above resolves to.)


---

## Input-metric tree

**[REQUIRED]**
(3–5 metrics a team can actually move. For each row below the North Star, mark the edge
`Arithmetic` — true by definition, needs auditing not testing — or `Causal` — a claim that
needs a source and an evidence tier, `E0`–`E5` per [`bet-ledger.md`](../bet-ledger.md) §2.
See `metrics.md` §2 for the difference. A tree with metric names but no stated edge fails
this section's gate. The North Star row itself carries no edge type or claim — an edge
describes an input's relationship to the North Star, and the North Star has no such
relationship to itself; leave that row's two columns as an em-dash.)

| Level | Metric | Edge type | Claim / evidence |
|---|---|---|---|
| North Star | | | |
| Input | | | |
| Input | | | |
| Input | | | |


---

## Guardrail metrics

**[REQUIRED]**
(At least one metric that is not allowed to get worse, regardless of what happens to any
bet's primary metric. See `metrics.md` §3.)


## Counter-metrics

**[optional]**
(A metric paired against a primary metric because there's a known way to win the primary
that this would catch. Name the gaming path it's aimed at, not a generic pairing. At least
one entry across Guardrail metrics above and Counter-metrics here is required — a plan
with neither fails the gate.)


---

## Baseline instrumentation

**[REQUIRED]**
(The events, properties, and dashboards already firing that feed the tree above — what
exists today, before any bet-specific instrumentation is added.)


---

## Bet measurement block (copy this per bet)

A plan with one bet or a dozen uses the same block. Every bet carried into the sequence
needs one of these; a bet with no block here has no traced path to the North Star.

### Bet: <name the bet>

- **Primary metric** **[REQUIRED]**
  (The one metric this bet's test is powered on.)

- **Path to North Star** **[REQUIRED]**
  (Which input-tree node above this primary metric is claimed to move, and whether that
  edge is arithmetic or causal. A bet with no line into the tree fails this check.)

- **Bet-specific guardrail** **[optional]**
  (Only if this bet needs one beyond the guardrails already named above.)

- **Bet-specific counter-metric** **[optional]**
  (Only if this bet opens a gaming path the global counter-metrics above don't cover.)

- **New instrumentation for this bet** **[REQUIRED]**
  (Specific events and properties to fire, and where they surface. Naming only the
  outcome metric, with no events, fails this field.)

- **Hypothesis statement** **[REQUIRED]**
  (Every slot filled, not fewer — see `metrics.md` §5. Assemble it as: *Because we
  observed [evidence], we believe [change] for [segment] will move [metric] [direction] by
  at least [magnitude]. The test ends when [metric] clears that bar with the guardrails
  above intact.* The magnitude slot is the one most plans skip — an unsized effect can't be
  designed against.)

- **Minimum detectable effect, traffic, and duration** **[REQUIRED]**
  (Four cases, state which applies: (1) `iterate` with enough triggered traffic to power a
  comparison — give the MDE and the sample/duration it requires; (2) `iterate` where the
  triggered population is too small to power a comparison — say so explicitly and name the
  decision rule used instead, e.g. a fixed threshold evaluated on a stated date, per
  `metrics.md` §6; (3) `zero-to-one` — state explicitly that MDE does not apply yet and
  why, i.e. no traffic exists to power a comparison; (4) `iterate` where this bet is the
  baseline-establishing instrumentation — the value event isn't recorded yet, so no MDE or
  metric threshold can be set; say so, and put a data-sufficiency kill criterion in its place
  (is there enough of the action, over a stated window, to compute a stable rate), per
  `metrics.md` §6. Silence on this field fails the gate regardless of which case applies.)

- **Kill criterion** **[REQUIRED]**
  (Carried forward from the bet ledger with its date and threshold intact — this stage
  verifies the existing criterion is measurable with the instrumentation above; it does not
  invent a new one.)

---

## Worked example

The sections above filled in, so the shape is unambiguous. Invented for illustration —
replace entirely with a real plan. Continues the "Location roll-up" bet from
`templates/prd-one-pager.md`.

**North Star, in words:** Shops trusting ShiftSplit's automated tip-split enough, week
after week, that nobody recalculates or overrides it by hand.

**North Star, as a metric:** Weekly active shops that close at least one shift through
ShiftSplit's automated split with zero manual overrides that week.

**Input-metric tree:**

| Level | Metric | Edge type | Claim / evidence |
|---|---|---|---|
| North Star | Weekly active shops closing override-free | — | — |
| Input | Activation — new shops completing first override-free close within 7 days of connecting a point-of-sale account | Arithmetic | Every newly activated shop adds directly to the North Star count. |
| Input | Override rate — share of automated splits a shift lead edits before accepting | Causal | Lowering override rate raises the odds a shop's week stays override-free. `E3` — 14 pilot shift leads cited distrust in the number as their stated reason for overriding (pilot exit survey). |
| Input | Point-of-sale read reliability — success rate of pulling clock-in/out and role data at close time | Causal | A failed data pull forces a manual split that week, which drops the shop out of the North Star count that week. `E1` — integration test logs against two providers' sandboxes. |
| Input | Retention — share of activated shops still closing override-free at week 8 | Arithmetic | Retained shops keep contributing to the weekly active count; churned shops stop contributing. |

**Guardrail metrics:** Support-contact rate about tip-split accuracy, per 100 active shops
— must not increase regardless of what any bet's primary metric does.

**Counter-metrics:** Self-reported trust in the quarterly shift-lead survey, paired
against override rate — chosen because burying the override control in the interface is a
known way to push override rate down without any shift lead actually trusting the number
more.

**Baseline instrumentation:** `shift_close_completed` (shop id, override boolean, split
method) and `pos_read_result` (shop id, success boolean, provider) already fire on every
close and surface on the ops reliability dashboard.

**Bet: Location roll-up**

- **Primary metric:** Weekly login rate to the roll-up screen among multi-location owners.

- **Path to North Star:** Feeds the Retention input above — a causal edge, `E0`. The bet
  is that an owner who can see every location's close status from one screen keeps more of
  those locations active on ShiftSplit rather than letting a struggling one revert to a
  manual spreadsheet. No direct evidence yet; this is the edge the pilot exists to test.

- **Bet-specific guardrail:** None beyond the global support-contact guardrail above.

- **Bet-specific counter-metric:** Roll-up click-through rate into an individual
  location's detail page when that location shows an override, paired against weekly
  roll-up login rate — catches an owner who opens the roll-up out of habit without it
  ever prompting them to look into the location that actually needs attention.

- **New instrumentation for this bet:** `rollup_viewed` (owner id, location count,
  overridden-location count) and `rollup_detail_opened` (owner id, location id, override
  status), both surfacing on the multi-location owner cohort dashboard.

- **Hypothesis statement:** Because we observed 8 multi-location owners requesting a
  single roll-up view unprompted (support-ticket log, `E3`), we believe the location
  roll-up screen for owners running 2+ shops will move weekly roll-up login rate up by at
  least 65 percentage points over the current ~0% baseline (no roll-up exists yet). The
  test ends when weekly login rate clears 65% with the support-contact guardrail intact.

- **Minimum detectable effect, traffic, and duration:** Case 2 — `iterate`, but the
  triggered population is only the 26 multi-location owners on the paid plan, too small to
  power a controlled comparison at any reasonable magnitude (see `metrics.md` §6).
  Decision rule used instead: a 5-owner canary for two weeks, then a fixed threshold on the
  full 26-owner cohort — hold at 65% weekly login by 2026-10-15 — evaluated as a go/no-go
  rather than a statistical test.

- **Kill criterion:** If weekly roll-up login among multi-location owners is below 45% by
  2026-10-15, kill the roll-up screen and revert multi-location owners to per-shop login
  only.
