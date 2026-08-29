# Gate Checks — stage gates as pass/fail assertions

A quality bar has to be intuited. A checklist has to be applied. This file exists so the
gates in [SKILL.md](SKILL.md) do not depend on the model running the pipeline having good
product taste — it only has to be able to check a condition.

Each gating stage below — 0 through 7 — has two blocks. The two mode paths that do not run
the full stage set, `strategy` and `audit`, have their own blocks after Stage 7, in the
same form. Both blocks:

- **PASS when:** conditions answerable by inspection. If you cannot tell whether a
  condition holds without a judgment call, that condition is wrong; use the discriminating
  test given instead of guessing.
- **FAIL and refuse when:** a trigger, paired with the exact words to say. Say the words,
  name the specific artifact or item they apply to, and stop — do not fill the gap by
  inventing content that would pass the check.

This file checks stages against [mode-gate.md](mode-gate.md) and [bet-ledger.md](bet-ledger.md);
it does not restate their content. Read the owning file before running its stage, per
SKILL.md's "name the file in play" rule.

---

## Stage 0 — MODE

The mode set is [SKILL.md](SKILL.md)'s four. The demand test that separates `zero-to-one`
from `iterate` is checked against [mode-gate.md](mode-gate.md) §2; that file covers those
two only, which is why the conditions below are split.

**PASS when:**
- [ ] Exactly one mode is named, from the closed set of four — `zero-to-one`, `iterate`,
  `strategy`, `audit`. Not "somewhere in between," not "TBD," not a mode inferred from
  tone, and not a name outside the four.
- [ ] The stage set that mode runs is stated in writing as part of the Stage 0 record,
  before whichever stage that mode runs next opens, from the routing table below. A mode
  named without its stage set will drift into running the whole pipeline by habit.
- [ ] The subject is named: for `zero-to-one` and `iterate`, the bet; for `strategy`, the
  symptom that started it; for `audit`, the specific artifact under review.

The remaining conditions in this block apply **only when the declared mode is
`zero-to-one` or `iterate`.** `strategy` and `audit` make no claim about demand, so the
demand-evidence conditions cannot be run against them — their additional gates are the two
blocks after Stage 7.

- [ ] A signal is named as one of the four closed types — retention curve, growth loop,
  fit-survey result, or sustained value-action rate. "We're clearly past product/market
  fit" with no named type does not count; the type has to be one of the four, spelled out.
- [ ] The signal has a stated source (a specific dataset, dashboard, or study) and an
  evidence tier. A tier with no source is unverifiable and stays `E0`.
- [ ] The signal's population is checked against the bet's population: does it come from
  the same users, doing the same job, that this bet is for? If the source describes a
  different product, segment, or job, the mode resolves to `zero-to-one` regardless of
  what is claimed.
- [ ] If the named signal is the sustained value-action rate, the record says why this
  product is episodic — why a user's repeat use would mean the job wasn't finished — so the
  signal is not standing in for a retention curve the product actually owes. A
  value-action-rate claim for a product whose value *is* repeat use fails this check and
  reverts to the retention-curve requirement.
- [ ] When the mode resolved to `zero-to-one` because demand was **unknown** rather than
  absent, the record names the systems searched for pre-existing evidence and what could
  not be reached, per [mode-gate.md](mode-gate.md) §2. An unknown nobody searched is not a
  finding — for a business the operator did not build, the evidence routinely sits in
  systems no one opened. "No signal exists" and "we had no access to their analytics" are
  different verdicts and cannot be recorded as the same one.
- [ ] The closing two-line form exists in the record — mode declared, plus signal, tier,
  source, and segment named.

**Stage routing — which stages the declared mode runs:**

| Declared mode | Stages that run | Gated by |
|---|---|---|
| `zero-to-one` | 0–8 | Stages 0–7 in this file; Stage 8 exempt |
| `iterate` | 0–8 | Stages 0–7 in this file; Stage 8 exempt |
| `strategy` | 0, 1, 4, 8 | Stage 0 here, Stage 1 plus the `strategy` block after Stage 7, Stage 4; Stage 8 exempt |
| `audit` | 0, then the gates of whichever stages the reviewed work claims to have passed | Stage 0 here, plus the `audit` block after Stage 7 |

**FAIL and refuse when:**
- A name outside the four is declared → "`<name>` isn't one of the four modes. It's
  `zero-to-one`, `iterate`, `strategy`, or `audit` — tell me which, or describe the work
  and I'll name one and say why."
- A mode is named and the pipeline starts producing an artifact that mode's stage set does
  not include → "`<stage>` isn't in `<mode>`'s stage set — the routing table gives
  `<stages>`. Either that artifact isn't wanted here, or the mode is wrong. Which is it?"
- `strategy` is declared with no symptom, or `audit` with no named artifact → "`<mode>`
  needs a subject. For `strategy` that's the symptom that started this — what's going
  wrong, over what window? For `audit` it's the specific thing being reviewed — point me
  at the roadmap, PRD, or strategy."
- No mode is stated → "I can't start until the mode is named. Name the signal — retention
  curve, growth loop, fit survey, or sustained value-action rate — or I'll record
  `zero-to-one` by default."
- A mode is claimed with no named signal type → "That's a claim, not a signal. Which of
  the four counts here — retention, loop, survey, or value-action rate — and where's the
  number from?"
- The cited evidence describes a different segment or product than this bet → "This
  evidence is about `<other segment>`, not the population this bet is for. For this bet
  that's unknown demand — I'll run `zero-to-one`, or point me at a signal for this
  segment specifically."
- A tier is stated with no source → "A tier with nothing behind it isn't a tier — where
  did this number come from? Until then it's `E0`."
- The sustained value-action rate is claimed for a product where repeat use is the value →
  "Repeat use is the value here, so the signal you owe is the retention curve, not a
  one-action rate. Show the per-cohort curve, or name why this product is actually episodic."

---

## Stage 1 — FRAME

Checked against the kernel and the strategy stack in [strategy.md](strategy.md) §1–§2, and
the Type 1/2 test in [bet-ledger.md](bet-ledger.md) §3.

**PASS when:**
- [ ] A diagnosis sentence exists that names a specific obstacle, blocker, or change — not
  a goal restated as a plan. Discriminating test: "we need to grow faster" is a goal;
  "activation drops because setup requires data the user doesn't have yet" is a diagnosis.
  If the sentence would still be true regardless of what actually happened, it's a goal.
- [ ] A guiding policy sentence responds to that same diagnosis, not to product ambition
  in general. Test: would this policy sentence survive word-for-word if the diagnosis
  said something else entirely? If yes, it's generic and fails this check.
- [ ] The frame names one layer of the pipeline's strategy-stack placement for this work —
  not left unstated, not "strategy" as a bare label.
- [ ] Every decision in the frame is classified `Type 1` or `Type 2`, and the reversal
  cost — what it costs and how long it takes to undo six months out — is written in
  words, not left blank.
- [ ] Every `Type 2` decision carries a revisit date. One with no date is treated as
  unclassified, not as approved.
- [ ] Altitude is named from the closed set (solo, staff, director, vp, cpo), even when
  the answer is solo.
- [ ] The operator's approval of the diagnosis is recorded in writing before Stage 2 opens.

**FAIL and refuse when:**
- The frame states ambition or targets with no diagnosis → "This says where we want to
  end up, not what's in the way. What's the diagnosis — the specific obstacle or change
  this responds to?"
- A decision carries no `Type 1`/`Type 2` classification → "`<decision>` isn't classified.
  I can't carry it forward until it's Type 1 or Type 2, with the reversal cost stated."
- A `Type 2` decision has no revisit date → "`<decision>` is a two-way door with no
  revisit date, which makes it a one-way door by accident. Give me the date it gets
  re-examined."
- The operator has not explicitly approved the diagnosis → "I need an explicit yes on the
  diagnosis before OPPORTUNITY opens — approve it, correct it, or send it back."

---

## Stage 2 — OPPORTUNITY

Checked against Cagan's four questions and, in `zero-to-one` only, both the idea-maze walk
and the four big risks register in [mode-gate.md](mode-gate.md) §4 (deliverables 1 and 2).

**PASS when:**
- [ ] All four Cagan questions carry an actual answer, not a restatement of the question
  or a placeholder: business objective, success metric, customer problem, target
  customer.
- [ ] In `zero-to-one`, the idea-maze walk covers all four angles — history, analogy,
  theory, direct experience — each non-empty. The history angle names at least one
  specific prior attempt (a company, a product, an outcome); "no one has tried this" with
  nothing behind it fails this check — a maze walk with no history section is an
  entrance, not a walk.
- [ ] Sizing leads with a bottom-up number presented as the primary figure. Where the
  product is monetized that number is customers × price × conversion. Where nothing will
  be charged, the same arithmetic runs in the unit the product actually produces —
  customers × conversion × the unit delivered per customer per period (people reached,
  hours saved, filings completed) — with the missing price said out loud rather than
  filled with a notional one. A revenue figure nobody will ever be billed for fails this
  check. Any top-down industry number present is explicitly labeled a sanity check, not
  the headline.
- [ ] In `zero-to-one`, all four of the big risks — value, usability, feasibility,
  business viability ([mode-gate.md](mode-gate.md) §4, deliverable 2) — are registered
  here, each with an owner named by role and a current evidence tier. This register is
  Stage 2's; Stage 3 ranks the assumptions sitting under it and does not restate it. A
  risk with no owner, or with no tier, fails this check, and "the team" is not an owner.
- [ ] A list of current alternatives exists and includes, literally, a manual-process
  option and a doing-nothing option — not just named competitors.
- [ ] A pursue/kill decision is recorded explicitly. "Park it" is written with a specific
  revisit date, not left open-ended.

**FAIL and refuse when:**
- Sizing leads with a top-down industry figure and no bottom-up number → "This leans on a
  market-size figure, not a bottom-up one. Give me customers × price × conversion — or, if
  nothing is charged, customers × conversion × what each one gets — and keep the industry
  number as a footnote."
- Nothing is charged and the sizing invents a price anyway → "Nobody pays for this, so a
  revenue number is fiction with arithmetic around it. Size it in what the product
  actually delivers — people reached, or hours saved per user per period — and say that
  there is no price."
- One of the four big risks has no owner or no evidence tier in `zero-to-one` →
  "`<risk>` has no `<owner / evidence tier>`. The four risks are a register, not four
  headings — give me the role that owns it and the tier its evidence sits at today."
- The idea-maze walk has no history section, or the history section names nothing
  specific → "This maze walk has no history in it — that makes it an entrance, not a
  walk. Who has tried this before, and what happened to them?"
- No pursue/kill decision is recorded → "I can't move to BETS without a decision — is
  this a pursue or a kill?"
- "Park it" appears with no revisit date → "Parking with no date is a kill wearing a
  maybe. Give me the date this gets revisited, or call it a kill now."
- The alternatives list omits doing nothing or the manual workaround → "This list is
  missing what people actually do today — name the manual workaround and the option of
  doing nothing."

---

## Stage 3 — BETS

Checked against the five required fields, the evidence ladder, and the `Type 1`/`Type 2`
evidence floor in [bet-ledger.md](bet-ledger.md) §1–§3.

**PASS when:**
- [ ] Every bet carries all five required fields — Outcome, Assumption, Evidence tier,
  Cheapest killing test, Kill criterion — and none is blank, "TBD," or a copy of the field
  name.
- [ ] Every Kill criterion contains both an absolute date and a threshold. Mechanical
  check: is there a calendar date on the page, and a number or condition next to it? "Next
  quarter" and "when we see traction" both fail this check regardless of how the rest of
  the bet reads.
- [ ] Every Evidence tier names a source. Where the chain draws on more than one piece of
  evidence, the weakest link is visibly marked, not folded into a single confident-sounding
  tier.
- [ ] Each bet carries exactly one Assumption. Discriminating test: if the assumption
  text joins two claims that could be falsified independently — typically joined by
  "and," "as well as," or a semicolon — it is two assumptions and must be split, even if
  it reads as one sentence. Contrast: "Users will pay for premium and will renew after 90
  days" is two assumptions — pricing could hold while renewal fails, or the reverse — and
  must be split. "Users who abandon checkout will complete it if shipping cost is shown
  earlier" is one assumption — the two clauses describe a single cause and its claimed
  effect, not two claims that could be falsified separately.
- [ ] Each bet has a named owner by role. "The team" fails this check.
- [ ] No bet's Evidence tier is `E5` or `E0` while the write-up treats the question as
  closed — "proven," "beyond debate," "just how it is." This floor is universal: it holds
  the same way whether the bet is classified `Type 1` or `Type 2`. Confidence in the prose
  does not substitute for the tier.
- [ ] Each bet is classified `Type 1` or `Type 2` per Stage 1, and a `Type 1` bet's
  Evidence tier is `E1`, `E2`, or `E3` — the stricter floor bet-ledger.md §3 rule 1 sets
  for one-way doors. `E4` desk research fails this check on a `Type 1` bet exactly like
  `E5` or `E0` does; `E4` is acceptable evidence only on a `Type 2` bet.
- [ ] The Cheapest killing test, if it passed, could only produce a result — not the
  finished feature. Discriminating test: if passing this test *is* shipping the thing,
  it's not a test.
- [ ] In `zero-to-one`, a ranked assumption stack exists — every assumption the bet needs
  to be true, ordered by cost-if-wrong × uncertainty ([bet-ledger.md](bet-ledger.md)
  §4) — and the top of that stack is what the bet's `Assumption` field carries. Mechanical
  check: is the ordering visible on the page, with the two axes scored per assumption? An
  unordered list, or one ordered by when each item occurred to someone, fails this check.
  The four big risks it draws on are registered at Stage 2, not re-listed here.
- [ ] In `zero-to-one`, a RAT plan exists for the top assumption: the smallest thing that
  could falsify it, and the result that counts as falsification, both written before the
  test runs rather than after the result is in.
- [ ] In `iterate`, an opportunity solution tree exists with exactly one outcome at the
  root, and at least three solutions compared under the selected opportunity
  ([mode-gate.md](mode-gate.md) §5, deliverable 2). Mechanical check: count the roots, then
  count the solutions under the opportunity that was selected. Two roots is two trees; one
  solution is a decision already made wearing a tree.
- [ ] The operator has explicitly approved the top-ranked assumption and its killing test.

**FAIL and refuse when:**
- A required field is empty → "`<bet>` is missing `<field>`. I can't rank it until that's
  filled — that's not a judgment call, it's an empty box."
- A Kill criterion has no date, no threshold, or both → "`<bet>`'s kill criterion has no
  date (or no threshold) — 'eventually' and 'traction' don't count. Give me both."
- A killing test would itself deliver the finished feature → "Passing this builds the
  thing — it's not a test, it's the build wearing a test's clothes. What's the smallest
  version that can only succeed or fail, not ship?"
- `E5`/`E0` evidence on any bet — `Type 1` or `Type 2` — is written up as settled → "`<bet>`'s
  evidence is `<tier>`, and it reads like it's settled. Saying it with more conviction
  doesn't move `E5`/`E0` up the ladder — tag it, keep it quarantined, and test it up to
  `E1`–`E3` before it funds anything."
- A `Type 1` bet's Evidence tier is `E4`, `E5`, or `E0` → "This is a one-way door funded
  on `<tier>` evidence, and the `Type 1` floor is `E1`–`E3` — `E4` desk research doesn't
  clear it either. Test it up to `E1`–`E3` first, or reclassify it `Type 2` with a stated
  conversion mechanism."
- A bet needs two independent claims to hold → "`<bet>` actually rests on two separate
  assumptions. Split it and rank each on its own."
- `zero-to-one` bets arrive with no ranked stack, or with a stack whose ranking is not
  shown → "These bets name assumptions but nothing ranks them, so I can't tell which one
  is top of stack. Score each on cost if wrong and on uncertainty, sort, and tell me which
  one the first bet is actually about."
- `zero-to-one` reaches the gate with a ranked stack and no RAT plan for its top
  assumption → "The stack says `<assumption>` is the riskiest thing here and there's no
  test against it. What's the smallest thing that could falsify it, and what result counts
  as falsification? Write both before it runs."
- `iterate` bets arrive with no opportunity solution tree, or with a tree carrying two
  roots or a single solution under the selected opportunity → "The bets are here but the
  tree they came out of isn't — `<what's missing: the tree / one outcome at the root /
  at least three compared solutions>`. Without it I can't tell whether these were chosen
  or already decided."

---

## Stage 4 — SEQUENCE

Checked against the non-goals and altitude rules in [bet-ledger.md](bet-ledger.md) §5, and
the non-goals craft in [strategy.md](strategy.md) §4.

**PASS when:**
- [ ] Every sequenced item is a bet carrying all five fields from bet-ledger.md.
- [ ] A published non-goals list exists, carrying at least as many non-goals as
  [bet-ledger.md](bet-ledger.md) §5 (refusal 3) asks for. That file owns the number; this
  one does not carry a second one.
- [ ] Every published non-goal passes all three of [strategy.md](strategy.md) §4.2's
  tests, each answered on the artifact rather than in conversation. **Advocate:** a named
  party loses by this being declined — a role, a customer, a deal, a channel, or the
  operator's own preference. **Expectation:** a competent outsider reading only the
  diagnosis and the goals would have expected this on the plan. **Forfeit:** the currency
  and the amount given up are named. Mechanical check: read the non-goal and look for who
  loses and what is forfeited. If neither is on the page, it is a strawman — nobody
  proposed it, so declining it costs nothing.
- [ ] Items are grouped Now / Next / Later, and "Later" items carry no **delivery**
  dates — no ship date, no target quarter, no committed window. This is not an exemption
  from the dated kill criterion below: a delivery date is a claim about when something
  will be finished, a kill-criterion date is the date the bet gets re-decided, and every
  item carries the second at every horizon, Later included.
- [ ] No single scoring table mixes items of different altitude.
- [ ] In `iterate`, the plan states an expected win rate rather than assuming every item
  lands — the base rate and its source are in [mode-gate.md](mode-gate.md) §5
  (deliverable 3). This condition does not apply in `zero-to-one` or `strategy`: neither
  runs an experiment program for a base rate to be taken from, and importing one there
  would be a borrowed number dressed as a forecast.

**FAIL and refuse when:**
- No non-goals are published → fire [bet-ledger.md](bet-ledger.md) §5's refusal 3 and say
  its words, including the count it asks for.
- A published non-goal names no advocate and no forfeit → "`<non-goal>` doesn't cost
  anything — nobody asked for it, so declining it decides nothing. Who loses by this being
  off the list, and what are we giving up, or should it come off the list?"
- An item has no dated kill criterion → "`<item>` is missing a dated kill criterion, and
  nothing undated earns a slot in Now/Next/Later. Attach the threshold and the calendar
  date it applies to before this moves forward."
- A RICE table mixes a platform migration with a UI tweak → "`<big item>` and `<small
  item>` sit at different altitudes, so no single scale ranks them fairly. Which decision
  is actually being made here? Judge `<big item>` against other bets its size, and `<small
  item>` against other bets its size — not against each other."

---

## Stage 5 — NARRATIVE

Checked against the forced-FAQ and pre-mortem discipline named in SKILL.md's Stage 5.

**PASS when:**
- [ ] The artifact type matches the declared mode: PR/FAQ for `zero-to-one`, one-pager PRD
  for `iterate`, six-pager when the team lens is active. A mismatch fails this check
  regardless of the writing quality.
- [ ] At least one FAQ answer concedes something — a real cost, a limitation, a tradeoff
  accepted, or a scenario in which the bet loses. Mechanical check: scan the answers, not
  the questions — an FAQ in which every answer reassures fails this check regardless of
  how skeptical the questions sound. Illustration, not the test itself: "will this be
  hard to build?" is a softball nobody outside the room is actually asking; "why would
  someone paying nothing today switch to a paid tool that does less than their
  spreadsheet?" is the kind of question a real concession answers.
- [ ] A pre-mortem section exists, written as if the effort already failed, naming at
  least one specific way it failed. A bare list of risk categories ("execution, market,
  timing") with no scenario attached fails this check.
- [ ] For `zero-to-one`, the narrative is allowed to conclude the effort should not
  proceed — approval is not assumed as the default outcome of writing the document.

**FAIL and refuse when:**
- No FAQ section exists → "There's no FAQ, so there's nothing here a skeptic's objection
  could land on. Write the strongest objection you can think of, and answer it."
- Every FAQ answer reassures and none concedes a cost, limitation, tradeoff, or losing
  scenario → "Every answer here reassures — find the one that should concede something
  real. What's the actual cost, limitation, or way this loses, and which answer should
  say so?"
- No pre-mortem exists → "There's no pre-mortem here. One sentence: if this fails in six
  months, what's the reason?"
- The artifact type doesn't match the declared mode → "This is a `<artifact>` but the
  mode is `<mode>` — those don't pair. Which one is actually correct?"

---

## Stage 6 — MEASURE

Checked against the North Star / input-metric tree and instrumentation requirements named
in SKILL.md's Stage 6.

**PASS when:**
- [ ] One North Star metric is named, and the input-metric tree below it states, for each
  edge, which input metric is claimed to move which parent metric — not just a list of
  metric names with no causal claim between them.
- [ ] Every bet carried into the sequence traces an explicit path up to the North Star
  through the tree. A bet with no line into the tree fails this check.
- [ ] At least one guardrail or counter-metric is named — a metric that could regress even
  while the target metric improves.
- [ ] The instrumentation plan names specific events and properties to be fired, and where
  they surface (a dashboard). A plan that names only the outcome metric, with no events,
  fails this check.
- [ ] For `iterate`, the minimum-detectable-effect field resolves into one of the cases in
  [metrics.md](metrics.md) §6 and [templates/measurement-plan.md](templates/measurement-plan.md):
  an MDE with the traffic and duration to reach it where traffic can power a comparison; a
  named decision rule where the triggered population is too small; or, where this bet is the
  instrumentation that first records the event, MDE deferred with the reason stated and a
  data-sufficiency kill criterion in its place. For `zero-to-one`, the plan states explicitly
  that MDE does not apply yet and why. Silence on the field fails regardless of case.
- [ ] Every bet's Kill criterion from Stage 3 is present here with its date intact — this
  stage verifies the existing criteria are measurable, it does not invent new ones.

**FAIL and refuse when:**
- A bet has no path in the metric tree → "`<bet>` doesn't connect to the North Star
  anywhere in this tree. Which input metric does it move, and how?"
- Only the outcome metric is named, with no events or properties → "This says what we'd
  measure but not how it gets recorded. Name the specific events and properties, and
  where they'll show up."
- No guardrail metric is named → "Nothing here could catch a regression if the target
  metric moved for the wrong reason. Name at least one guardrail."
- A bet's kill criterion has lost its date or threshold by the time it reaches this stage
  → "`<bet>`'s kill criterion is missing its date here. I can't close MEASURE until it's
  restored."

---

## Stage 7 — HANDOFF

Checked against SKILL.md's Stage 7 boundary rule: adjacent functions are named by role,
and a missing one never blocks the gate.

**PASS when:**
- [ ] The package contains every artifact from stages 1–6 — frame, bet ledger, sequence
  with non-goals, narrative, measurement plan — attached or linked, not summarized from
  memory.
- [ ] Every open question has a named owner by role. An open question with no owner fails
  this check the same way an unowned bet does.
- [ ] Any handoff to an adjacent function is written role-first: what has to happen and
  who owns it, named as a function (build, research, positioning), not as a specific
  tool. This line is written whether or not a named companion exists in this environment —
  a missing tool is never the reason a question goes unassigned.
- [ ] Where a bet's assumption still needs evidence from real people, the open question
  says so explicitly rather than being closed out with invented evidence.

**FAIL and refuse when:**
- A stage's artifact is missing from the package → "`<artifact>` isn't in this package —
  pull it in before calling HANDOFF done."
- An open question has no owner → "`<question>` has no owner. Who decides this, by role?"
- No build, research, or positioning function is wired up in this environment, and the
  response is to drop the question rather than name it → "There's no function wired up
  here for this, but the question doesn't go away — write down what has to happen next
  and who owns it, even if that's the operator."
- A question that needs real evidence is answered with invented content instead of being
  left open → "This reads like a filled-in answer to something we don't have evidence for.
  Tag it and leave it open, or get a real source."

---

## Mode path — `strategy` (stages 0, 1, 4, 8)

Additional to Stage 1 and Stage 4 above, which both still apply in full. Checked against
[strategy.md](strategy.md) §1–§4.

**PASS when:**
- [ ] The symptom that started the run is written as an observation with a window, a
  source, and an evidence tier. A symptom carrying no tier, or `E0`, does not open the
  walk — it opens the work of getting the symptom to `E1`–`E3` first.
- [ ] The diagnosis carries all three parts — an observation, a locus, and a mechanism
  stated as a *because*. Mechanical check: find the word *because* or its equivalent and
  read what follows it. If the sentence stops at what was observed, the mechanism is
  missing and the diagnosis is a symptom restated.
- [ ] The diagnosis survives the negation test: its negation is a position a competent
  person could have held about this product last month. A negation nobody would ever
  assert means the sentence was a goal.
- [ ] The guiding policy names at least one currently wanted thing that adopting it rules
  out, and that thing is written down. A policy that excludes nothing is an aspiration and
  fails this check regardless of how specific it sounds.
- [ ] The walk is recorded: which layer the symptom sat on, which explanation questions
  were run, and which one failed. A diagnosis presented with no walk behind it has skipped
  the only thing this mode does.
- [ ] If every explanation question held, the run says so and stops there. A `strategy` run
  that reaches the top of the stack intact and still returns a strategy problem fails this
  check.
- [ ] Every coherent action carried into Stage 4 is a bet in the five-field form
  ([bet-ledger.md](bet-ledger.md) §1) with a `Type 1`/`Type 2` classification. Stage 3 does
  not run in this mode, so its branch deliverables are not expected — the five fields and
  the classification still are.
- [ ] Stage 3's **per-bet field conditions all still apply** to those coherent actions and
  are run against them here — the kill-criterion, evidence-tier, one-assumption,
  named-owner, settled-language, `Type 1` floor, and killing-test conditions in Stage 3's
  PASS block, read as written there. Only Stage 3's **discovery branch** is excluded — the
  ranked assumption stack, the RAT plan, the opportunity solution tree — because that stage
  does not run. The `Type 1` floor is the one that bites hardest in this mode:
  [bet-ledger.md](bet-ledger.md) §3 classifies market choice, pricing, packaging, and brand
  as `Type 1` by definition, which is most of what a `strategy` run produces, so nearly
  every bet leaving this block owes `E1`–`E3` evidence.
- [ ] None of the artifacts the absent stages own was produced: no opportunity assessment,
  no ranked assumption stack or opportunity solution tree, no narrative (PR/FAQ, PRD
  one-pager, or six-pager), no measurement plan, no handoff package. The five-field bets
  required by the condition above are Stage 4's input in this mode, not Stage 3 running
  under another name — what is excluded is Stage 3's discovery branch, not the bet form.
  Any of the listed artifacts appearing means the mode was wrong or was abandoned mid-run.
- [ ] Stage 1's approval condition reads against the next stage this mode actually runs:
  the operator's explicit approval of the diagnosis is recorded before **Stage 4** opens,
  since OPPORTUNITY does not open at all here.

**FAIL and refuse when:**
- The diagnosis has no mechanism → "This says what we're seeing, not why it happens.
  Finish the sentence: `<observation>` happens because — what?"
- The negation of the diagnosis is something nobody would assert → "The opposite of this
  isn't a position anyone holds, which means it isn't making a claim. What's the specific
  obstacle, in a sentence that could turn out to be wrong?"
- The guiding policy rules nothing out → "Name one thing we currently want that this
  policy forbids. If everything on the list survives it, the policy didn't decide
  anything."
- The guiding policy responds to the symptom rather than to the located layer → "The walk
  put the break at `<layer>`, but this policy answers `<symptom>`. Write the policy at the
  layer that failed, or tell me the walk was wrong."
- The walk is missing and a diagnosis appears anyway → "Where did this come from? Show me
  the symptom, the layer it sat on, and the explanation question that failed — otherwise
  this is the layer someone was already unhappy with."
- A specific feature or scope arrives out of this mode → "That's a thing to build, and
  `strategy` doesn't scope one. Start a fresh run in `zero-to-one` or `iterate` with its
  own demand evidence."

---

## Mode path — `audit` (stage 0, then applied gates)

`audit` produces a findings list, not artifacts. Checked against
[bet-ledger.md](bet-ledger.md) §5 and the stage blocks above, applied to work that already
exists.

**PASS when:**
- [ ] Every finding cites a **named rule** by file and identifier — a refusal number in
  bet-ledger.md §5, a specific PASS condition or FAIL trigger from a stage block in this
  file, or a named test in a reference file. Mechanical check: read each finding and look
  for the citation. A finding with none is an opinion; either re-file it as a suggestion
  and label it as one, or drop it.
- [ ] Every finding names the specific item it applies to — the row, the field, the
  sentence — not the artifact as a whole. "The roadmap is weak" is not a finding.
- [ ] Every finding states what the cited rule requires and what is there instead. Both
  halves, so the operator can check the call without re-reading the rule.
- [ ] Which stages' gates were applied is stated up front, and it matches what the reviewed
  work claims to have passed. Applying Stage 6's gate to a document that never claimed a
  measurement plan produces noise, not findings.
- [ ] Inside a stage block that was applied, only its **artifact** conditions are evaluated
  as findings; its **process-record** conditions are recorded as *not assessable from the
  artifact* instead. Tell the two apart by what the condition asserts: an artifact
  condition asserts something is present in the document (a dated kill criterion, an owner
  by role, a published non-goals list, a sourced tier); a process-record condition asserts
  something happened during a pipeline run (an approval recorded in writing before a stage
  opened, a decision taken explicitly at a gate, one field written before another). Work
  produced outside this pipeline cannot satisfy the second kind however good it is, so
  filing one as a finding produces a true statement with nothing behind it. If the operator
  wants the process record built going forward, that is new work, not an audit finding.
- [ ] A missing artifact is recorded as a finding, not supplied — **unless the operator asks
  for it**. An audit that fills a gap on its own initiative has stopped being an audit; a
  gap the operator asks to have closed after it was reported is the **fixed** disposition
  below, and the finding stays on the list either way.
- [ ] Every finding ends in one of three recorded dispositions: **fixed**, **deferred**
  with a reason and a revisit date, or **rejected by the operator**. None is left open at
  the end of the run.
- [ ] Nothing outside the findings was rewritten. Mechanical check: for each change made,
  point at the finding it closes. A change with no finding behind it is scope the operator
  did not ask for.

**FAIL and refuse when:**
- A finding cites no rule → "`<finding>` is my opinion, not a rule this pack holds. Either
  I name the rule it breaks or I drop it — which do you want?"
- A finding names no specific item → "`<finding>` is about the whole document, so there's
  nothing to fix. Which row, field, or sentence?"
- A gate is applied to work that never claimed that stage → "This is a `<artifact>`; it
  never claimed a `<stage>` output, so that gate has nothing to check. Should it have one —
  or should I drop that finding?"
- A finding is left with no disposition → "`<finding>` is still open. Fixed, deferred with
  a reason and a date, or rejected — pick one; I can't close the audit with it hanging."
- A gap is filled rather than reported → "I nearly wrote the missing `<artifact>` here, and
  that would have made the audit pass by supplying its own evidence. It stays a finding —
  do you want it fixed in this session or deferred?"
- A rewrite goes beyond the findings → "This change doesn't close any finding. Do you want
  it, or should I revert it and keep the audit inside its scope?"

---

## A closing note on RETRO (Stage 8 — exempt)

Stage 8 has no gate — SKILL.md states this directly. This file checks stages 0–7 and the
two mode paths above; RETRO is left outside all of them, for that reason: it is optional
and cheap to skip, and writing a pass/fail check for it would give the pipeline something
to refuse over that the pipeline itself says can be skipped freely. If a retro runs, judge
it only by whether the note exists beside the bet ledger — not by content, and not by this
file.
