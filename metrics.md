# Metrics — North Star, guardrails, and experiment reality

This file supplies the method behind Stage 6 — MEASURE. It is where the North Star and its
input tree get built, where guardrails and counter-metrics get chosen, where an experiment
gets sized, and where the judgment call about *not* running an experiment gets made. The
pass/fail check on the resulting plan lives in [gate-checks.md](gate-checks.md) Stage 6;
read that file to know when a measurement plan is done. This file is for building it in the
first place.

---

## 1. North Star and the metrics that feed it

A North Star metric has to clear two bars at once: it has to lead toward a durable business
result, and it has to represent something the customer actually got out of the product.
Either one alone is not enough — a number can move because the business is doing well while
customers are getting nothing new, or a number can reflect real customer delight in a corner
of the product too small to matter to the business. Amplitude's framing of this bar (Cutler)
is the standard reference for picking one; this section is about what happens after it's
picked.

**The directly-movable test.** Before a candidate metric earns the North Star label, ask
whether one team could move it on its own — without going through anything beneath it in the
tree, by relabeling a segment, changing how the metric is computed, or running a promotion
that pulls the number without changing what anyone actually did. If a team can move the
number that way, the number is too easy to satisfy, and it will get satisfied that way. The
fix isn't to police the metric harder; it's to demote it into the input layer and look one
level up for something that only responds when the whole tree beneath it actually moves. A
number nobody can move except by making every input behave differently is the one worth
putting at the top.

**Failure modes this test is meant to catch:**

- **Revenue as North Star.** Revenue is the number that already gets reported every week, so
  it's the default candidate — but it's a lagging consequence of decisions made several
  quarters earlier, and by the time it moves there's no way to trace the change back to a
  specific team's work. What's left underneath it is a price change or a sales push, which is
  the directly-movable failure above wearing a different name.
- **Vanity metrics.** A number that climbs regardless of whether the customer got anything —
  downloads, page views, raw signups with no correction for who came back — measures reach,
  not value. Optimizing it produces a wider top of the funnel with nothing new further down.
- **Local metrics that ladder nowhere.** A team's dashboard can trend up for a full quarter
  with no stated edge connecting it to anything above it. Improving it feels productive and
  changes nothing anyone above that team would notice — the same failure gate-checks.md
  Stage 6 is checking for when it asks whether a bet traces a path to the North Star.

**Input metrics.** Pick 3–5 metrics a team can actually move, and state the claimed
connection to the North Star for each — the full discipline for that connection is §2 below.
Illustrative decomposition, generic on purpose:

| Level | Metric |
|---|---|
| North Star | Weekly active accounts completing a core action |
| Input | Activation rate — new accounts reaching first value |
| Input | Feature adoption depth — breadth of the workflow actually used |
| Input | Reliability — latency and error rate on the core path |
| Input | Renewal of the core action, month over month |

---

## 2. Metric trees: from North Star down to a team-ownable lever

What a metric tree *is*, and why it isn't the same thing as a reporting dashboard, is
already set out in mode-gate.md §5 (`iterate` deliverable 1); read it there rather than
here. This section covers the part that definition doesn't: how to actually draw the
branches so a team asking what to go pull gets a specific, arguable answer instead of a
shrug.

Two different kinds of edge end up in the same tree, and mixing them up is the most common
way a tree stops doing its job:

- **Arithmetic edges** are true by definition — the North Star decomposes into inputs the way
  weekly active accounts completing a core action decomposes into new accounts activated,
  existing accounts retained, and the rate either group performs the action. These don't need
  testing; they need auditing for double-counting.
- **Causal edges** are a bet, not an identity. "Faster time-to-first-value increases
  activation" is a claim about behavior, and it carries the same evidence discipline as
  anything in the ledger — a source, a tier, and a way it could turn out false. Draw it as a
  hypothesis until it's been tested, not a fact because it's drawn on the same diagram as the
  arithmetic above it.

Keep decomposing until each leaf sits behind exactly one team. If two groups could both
plausibly claim credit for the same node, the tree stopped one level too early — split
further until ownership is unambiguous. That's the actual reason to build a tree instead of
watching a dashboard: a dashboard reports that a number moved; a tree says whose work would
move it next, and gate-checks.md Stage 6 will not pass a bet that has no stated edge into it.

---

## 3. Guardrails and counter-metrics

Two different jobs, both agreed before anything ships — not improvised afterward when
someone asks why support volume tripled the week the primary metric hit its target.

**Guardrails** are metrics that are not allowed to get worse, regardless of what happens to
the primary metric: latency, crash rate, error rate, unsubscribe rate, support-contact
volume, revenue per user. A guardrail breach is not a tradeoff to weigh against a win on the
primary metric — it's a reason to hold the change even if the primary cleared its bar,
because the guardrail exists for exactly the case where the primary improved by quietly
making something else worse.

**Counter-metrics** are narrower: a specific paired metric chosen because there's a known way
to win the primary metric that would move it. Engagement time paired against a satisfaction
or complaint signal catches the version of "engagement" that's actually friction rather than
value. Ticket resolution time paired against reopen rate catches the version of "faster"
that's actually closing tickets before the problem is fixed. The pairing is chosen before
launch, aimed at a specific gaming path someone can already name — a counter-metric picked
after a result nobody likes, to explain it away, is decoration, not a guardrail.

The reason both exist is Goodhart's Law: once a number becomes the target people are managed
against, it stops reliably tracking the thing it was meant to represent, because the fastest
way to move it and the way that actually produces the outcome underneath it are rarely the
same path, and someone will find the fast one. A single primary metric with no guardrail and
no counter-metric is not a design that assumes the fast path won't be found — it's an
invitation to find it.

gate-checks.md Stage 6 requires at least one guardrail or counter-metric named before a
measurement plan passes; this section is where the choice gets made, not where it gets
enforced.

---

## 4. HEART, and picking one or two dimensions

HEART names five candidate dimensions of product quality — Happiness, Engagement, Adoption,
Retention, Task Success (Rodden, Hutchinson, and Fu, CHI 2010). For whichever dimension
applies, the Goal → Signal → Metric chain forces the same discipline as the tree above: state
what's being pursued, then the behavior that would show it's happening, then the specific
thing instrumented to catch that behavior.

Pick one or two dimensions, not all five. Instrumenting all five for every bet spreads
attention thin enough that none of the five gets watched closely, and it tends to produce a
report nobody reads rather than a signal that changes a decision. Choose the dimension that
maps onto the Outcome already named in the bet's ledger entry (bet-ledger.md §1) — it should
already be implied by what the bet claims to move, not picked afterward for whichever is
easiest to instrument.

Worked chain, Task Success as the example:

- **Goal** — a new user can complete the core workflow without needing help.
- **Signal** — the behavioral trace that goal leaves behind: finishing the flow in one
  sitting, with no support contact and no abandonment partway through.
- **Metric** — the trackable number standing in for that signal: first-attempt completion
  rate, and elapsed time from start to first success.

Run the same chain on whichever second dimension the bet actually needs — Retention for a
bet about habit formation, Adoption for a bet about a capability nobody has discovered yet.
The chain is the discipline; which dimension it runs on is a judgment made once per bet and
written into the plan, not defaulted to whatever is already instrumented.

---

## 5. Experiment reality: hypothesis, power, and the base rate

**State the hypothesis with every required slot, not fewer.** A hypothesis missing the
magnitude slot isn't designable — nobody can size a sample against "we think this will
help."

| Slot | What goes in it |
|---|---|
| Evidence | The observation motivating the change, tiered per bet-ledger.md §2. |
| Change | The specific thing being shipped, not the whole feature area. |
| Segment | Who the change applies to — everyone, or a named subset. |
| Metric | The one primary metric the test is powered on. |
| Direction | Stated before the test runs, not fitted to whatever the data did afterward. |
| Magnitude | The smallest effect worth having shipped. This is the slot most plans skip, and skipping it is why a test with no target can run for months without ever producing a decision. |

Assembled: *Because we observed [Evidence], we believe [Change] for [Segment] will move
[Metric] [Direction] by at least [Magnitude]. The test ends when [Metric] clears that bar
with the guardrails from §3 intact.*

**Sizing.** A rule-of-thumb per-arm sample size: `n ≈ 16σ²/δ²`, where δ is the magnitude
from the table above and σ² is the metric's variance — for a proportion, `σ² = p(1−p)` at
the baseline rate p. Two consequences follow from the arithmetic itself, not from judgment:
a smaller magnitude needs disproportionately more sample, because δ is squared in the
denominator; and the sizing has to run against **the population actually triggered into the
change**, not everyone who visits the product. If only a fraction of traffic ever reaches the
surface being changed, computing sample size off total traffic understates how long the test
needs to run — a test that looks adequately powered against overall numbers can be badly
underpowered against the group that could actually respond.

**Trustworthiness, before believing the result.** Check the instrumentation pipeline, the
assignment mechanism, and the sample split *before* writing any result down as a finding —
and check hardest exactly when the number is the one everyone was hoping for. That ordering
is what Twyman's Law is actually warning against: a result striking enough to make people
want to stop checking and start celebrating is disproportionately likely to be the output of
a broken pipeline rather than a real effect, precisely because a broken pipeline is what
produces numbers too clean or too dramatic to be plausible. Suspicion should scale with how
good the result looks, not fall as it rises.

**The base rate this plans against is stated in mode-gate.md §5** (`iterate` deliverable 3),
with its numbers and its source. Read it there — it is not restated here, so that there is
only one version of it to recalibrate. What that ratio means for a
measurement plan specifically: instrument every test to the same standard whether or not it's
expected to win, because most tests come back flat, and a flat result with clean
instrumentation still retires an assumption. A flat result from a test that was never
properly instrumented retires nothing — it just returns to the queue as an unanswered
question with a wasted cycle attached.

---

## 6. When not to experiment

An experiment is the right instrument for one specific job: a two-way door, on a surface with
enough traffic to power a real comparison, where the answer is genuinely unknown and the two
outcomes lead somewhere different. Outside that shape, running one anyway produces the
appearance of rigor without the substance.

- **Traffic can't power it.** If the triggered population (§5) is too small to reach a usable
  sample in a reasonable window, running the test anyway just produces a wide interval
  dressed up as a result. Decide on the evidence already available instead.
- **The bet is the instrumentation itself.** When the value event isn't recorded yet and this
  bet's deliverable is to start recording it, there is no baseline rate to state a minimum
  detectable effect against — nor even a decision-rule threshold on the metric, since the
  metric has no history. The bet's kill criterion is a data-sufficiency check instead: is
  there enough of the action, over a stated window, to compute a stable rate at all? The MDE
  for the optimization bets that follow is set once that baseline exists, not before.
- **One-way doors and strategic bets.** An experiment compares variants that were built, so
  it can only choose among options someone already decided to put in front of users — a
  strategic or irreversible choice about which options belong in that set isn't among them.
  mode-gate.md §1 works through why a controlled experiment can settle which variant wins but
  not whether pursuing the strategy behind it was the right call in the first place;
  bet-ledger.md §3 is where a decision of this shape gets classified as Type 1.
- **Ethical exposure or irreversible harm.** A change that risks real harm before the harm is
  understood doesn't get tested into an answer; it gets a different kind of review before it
  reaches anyone.
- **Obviously required work.** A bug fix, a legal requirement, or an accessibility fix doesn't
  need a control group to justify doing it — testing "should we fix what's broken" spends a
  test slot on a question that was never actually open.
- **Both branches lead to the same decision.** If the plan is to ship regardless of what the
  result shows, the test isn't informing anything. bet-ledger.md §5 (refusal 8) is where this
  gets stopped explicitly — run its check before setting up any experiment, not only before a
  roadmap item.
- **Long-horizon effects.** Some outcomes — cumulative trust, habit formation, the compounding
  effect of many small changes together — only show up over a longer window than a fixed test
  can hold open. A holdout does what a two-week test can't: a control group withheld from an
  entire period's changes, compared against everyone who received them, measures the sum of a
  program rather than any one change in isolation.

---

## 7. Threshold hygiene

The recalibratable numbers this file leans on are the ones borrowed from someone else's
product and treated as if they described yours: the experiment base rate in mode-gate.md §5,
the baseline rate `p` and the magnitude `δ` fed into the sizing formula, and any benchmark
arriving with a citation and no sample. Each is a starting hypothesis to check against the
operator's own baseline, not a constant trusted on arrival. mode-gate.md §6 already treats
its own headline threshold, the fit-survey benchmark, the same way; the same discipline
applies here.

Two things in this file are **not** thresholds and are not what this section is about.
HEART has five dimensions because its source defines five (§4) — that count is a fact about
the model, and picking one or two of them is an instruction, not a number to tune. The
sizing formula's shape (§5) is arithmetic: the exponent on `δ` does not move with your data.
What moves is what you put into it.

Widely repeated activation figures are the clearest case of a number that outran its
evidence: the friend-count-within-days benchmark from one well-known social product's early
growth years circulates as if it were a general law of activation, when what actually exists
is a method — find the early behavior that correlates most with long-term retention for
*this* product, then design new users toward it — and a specific number that applied to one
company's own data at one point in time, never officially confirmed even for that company.
Treat any such figure the same way: useful as a hint about where to look, worthless as a
target imported wholesale.
