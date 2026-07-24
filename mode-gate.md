# Mode Gate — name the mode before anything else

There are two disciplines here, not two styles of one discipline. Finding a product worth
building and improving a product that already works have different artifacts, different
evidence bars, and different definitions of done. The methods do not transfer. Running one
mode's playbook against the other's problem produces confident, well-formatted waste.

So the mode is named first, before the frame, before the opportunity, before a single bet
enters the ledger. This file defines the refusal, the test that decides the mode, what each
mode owes, and the evidence that lets `zero-to-one` graduate to `iterate`.

**Scope.** This file owns one decision — discovery versus optimization — and that decision
exists only for the two build modes, `zero-to-one` and `iterate`. Everything downstream of
a build mode branches on which of the two is declared. The pack's other two modes,
`strategy` and `audit`, make no claim about demand, so nothing here runs against them:
their Stage 0 subjects and the conditions those subjects have to meet are defined in
`gate-checks.md` Stage 0, not in this file. An agent routed here for Stage 0 under
`strategy` or `audit` should read that block instead.

---

## 1. The refusal

**The pipeline does not proceed until the mode is named and the demand evidence behind it
is stated.** Not "we'll figure it out as we go." Not a mode inferred from the operator's
tone. Named, with a source, in writing.

This is the highest-leverage single behavior in the whole pipeline, and it is a refusal
rather than a preference because the two modes are mutually incompatible in three ways at
once:

- **Incompatible artifacts.** A ranked assumption stack and a RAT queue are the wrong
  output for a team with a live funnel and 40,000 weekly sessions. An opportunity solution
  tree rooted in a North Star input metric is the wrong output for a product with no users
  and no metric to root it in.
- **Incompatible evidence bars.** In `zero-to-one`, five qualitative sessions that falsify
  an assumption are a result worth the week — the falsification *is* the win. In `iterate`,
  the same five sessions are anecdote; the bar is a powered experiment with guardrails
  intact and no regression.
- **Incompatible definitions of done.** `zero-to-one` is done when a demand signal exists
  or the idea is dead. `iterate` is done when the metric moved and held.

Two illustrations, and they run in opposite directions:

**You cannot see a 5%→7% conversion delta by watching users.** Two points of conversion is
worth real money and it is invisible to observation. Put five people through the flow and
either all five finish or two get stuck, and both outcomes are consistent with 5% and with
7%. Detecting that delta takes instrumentation, a control group, and enough traffic to
power the comparison. No amount of watching eyes substitutes.

**You cannot discover a pivot from a two-week split test.** An experiment is a ballot: only
the options already printed on it can win. A split test between two onboarding variants
cannot tell you that the customer wanted a different product, that the segment is wrong, or
that the job being hired for is not the one the product does. Those answers are not on the
ballot, and running the test faster does not put them there.

Cagan's framing of this split (*Product Discovery vs. Product Optimization*, SVPG) is the
cleanest statement of it: discovery and optimization are separate disciplines, divided by
product/market fit, and applying one's methods to the other's problem fails. His structural
warning is the reason the gate defaults toward discovery rather than optimization.
Optimization refines what already exists, and refinement has a ceiling: once a surface is
well-tuned, further experiments buy progressively smaller gains. Clearing that ceiling takes
a different problem to solve, which is discovery's job — an optimization loop, by design,
only works the surface it already has.

**What to say when the mode is missing:**

> *"I can't start — the mode isn't named. Is there validated demand for this? Give me the
> retention curve, the fit survey, or the loop, and I'll set the mode. If there's none of
> that, we're in `zero-to-one` and I'll say so."*

Then stop. Do not pick a mode to be helpful, and do not invent a demand signal that would
justify one.

---

## 2. The gate test

One question decides it.

**Is there validated demand for *this specific bet*?**

- **Yes** → `iterate`. Requires at least one of the four signals below, with a named
  source.
- **No, or unknown** → `zero-to-one`. Unknown resolves to `zero-to-one`. There is no third
  branch and no "somewhere in between" — partial fit is handled by segmenting (§6), not by
  splitting the mode.

### The four qualifying signals

Any one of these clears the gate. Each is stated with the evidence tier it carries, in the
sense defined in `bet-ledger.md` §2.

| Signal | What it is | What has to be true | Tier |
|---|---|---|---|
| **Retention curve flattens** | A cohort retention curve that stops declining and holds a stable plateau above zero. | Plotted per cohort over a period long enough to reach the plateau, on the product's natural usage interval — not a single blended average that hides a decaying cohort behind new signups. | `E1` |
| **Working growth loop** | One cohort of users measurably produces the next: the loop's output re-enters as its own input. | Named loop with its steps written out, sustained across at least two full cycles without a matching increase in paid input. A funnel is not a loop — a funnel spends input and produces exit, with nothing returning to the top. | `E1` |
| **Product/market-fit survey signal** | Sean Ellis's fit survey: users are asked how they would feel if they could no longer use the product, answering *very disappointed* / *somewhat disappointed* / *not disappointed*. | Around 40% or more answering *very disappointed*, from a sample restricted to users who have actually experienced the core of the product. See the threshold caveat in §6. | `E2` |
| **Sustained value-action rate** | For a product whose value lands in a discrete, episodic action rather than in repeat use — a marketplace transaction closed, an application submitted, a filing completed — the share of qualified sessions that complete that core value action, holding steady over time. | The value action is named and instrumented directly, not proxied by a pageview or a bare arrival; the rate is taken over qualified sessions, not raw traffic, and holds across a window long enough to rule out a launch spike. Admissible only where repeat use is *not* the value — where a user returning would mean the job wasn't finished. Where repeat use *is* the value, the retention curve governs and this does not substitute for it. | `E1` |

### How to run the test mechanically

1. **Ask for the signal by name.** "Which of the four — retention curve, growth loop, fit
   survey, or sustained value-action rate?" A mode claim with no named signal is not an answer.
2. **Ask for the source and the tier.** A number with no origin is `E0`, and `E0` does not
   promote (`bet-ledger.md` §2, hard rule 2). *"We're clearly past product/market fit"*
   with nothing behind it is an assumption about demand, not demand.
3. **Check the scope of the signal.** The signal has to cover the bet in front of you, not
   the company. See the scope rule below.
4. **If nothing survives steps 1–3, declare `zero-to-one`** and say why in one sentence.
   This is the default, not a fallback.

### The scope rule — the gate is per bet, not per company

Demand validated for one product, segment, or job does not transfer to another. A company
with eight years of revenue entering a new segment is in `zero-to-one` for that bet, and
its existing retention curve is evidence about a different population. Ask: *does the
signal come from the same users, doing the same job, that this bet is for?* If not, the
signal does not apply and the mode is `zero-to-one`.

### When the declared mode contradicts the evidence

The operator can name the mode directly, and that naming stands — but if the stated
evidence does not support it, say so before proceeding:

> *"You've named `iterate`, but the demand evidence here is `<what was given>`, which is
> about `<other segment / other product>`. For this bet that's unknown demand. I can run
> `zero-to-one`, or you can point me at a signal for this segment specifically."*

The point is not to win the argument. It is to make sure that if the pipeline runs
`iterate` on an unvalidated bet, that decision was made deliberately and is on the record.

---

## 3. The two modes, side by side

| Dimension | `zero-to-one` (discovery) | `iterate` (optimization) |
|---|---|---|
| **Core question** | Is there a problem worth solving, and can we solve it in a way people adopt? | Given a working product, what change moves the metric? |
| **Unit of work** | An **assumption**, tested | A **hypothesis**, measured |
| **Cadence** | Daily to every few days | Every two weeks to monthly |
| **Primary technique** | Prototypes at whatever fidelity the question needs, put in front of real users and observed directly | Instrumentation plus controlled experiments on live traffic |
| **Why not the other way** | You cannot see a 5%→7% conversion delta by watching users | You cannot discover a pivot from a two-week split test |
| **Change magnitude** | Large and structural; pivots are in scope | Relatively small; the product's shape is fixed |
| **Team shape** | Small and undivided — product, design, and engineering lead working the same question | A durable team with an owner fluent in experiment design |
| **Evidence bar** | Qualitative and directional; **a falsified assumption is a win** | Statistical significance, guardrails intact, no regression |
| **Sample availability** | Roughly zero users; demand signals must be manufactured | Enough traffic to power an experiment on the target metric |
| **Roadmap form** | A sequenced learning plan — a route through the idea maze | Outcome-based Now / Next / Later, laddered to the North Star |
| **Failure economics** | Wrong problem means 100% waste, discovered late | Wrong feature means one wasted cycle, discovered in weeks |
| **Dominant failure** | Building the whole thing to test one assumption | Local-optimum grind: a full experiment pipeline and a North Star that never moves |

Read the last row as a diagnostic. If the work in front of you looks like the dominant
failure of the declared mode, re-run the gate test (§2) before doing anything else.

---

## 4. `zero-to-one` deliverables

Seven artifacts, in this order. Each one is allowed to kill the effort; that is what they
are for.

1. **Idea-maze walk.** The plan is a route through the maze, not an entrance to it (Balaji
   Srinivasan's framing, popularized by Chris Dixon). Walk it four ways and write a short
   paragraph on each, with sources: **history** — who has attempted this and what killed
   them; **analogy** — how the same maze played out in an adjacent market; **theory** —
   what the economics and the technology predict; **direct experience** — what we have
   personally seen that others have not. A maze walk with no history section is an
   entrance.
2. **The four big risks register.** Cagan's four, each with a named owner: **value** (will
   they use or buy it), **usability** (can they succeed at it), **feasibility** (can we
   build it), **business viability** (does the business, legal, brand, and support surface
   survive it). All four are killed with prototypes, before production code — not after.
   The register is written at Stage 2, in the opportunity assessment, and it is checked
   there (`gate-checks.md` Stage 2). Stage 3 ranks the assumptions under these four; it
   does not keep a second copy of them.
3. **Ranked assumption stack.** Every assumption the effort needs to be true, ordered by
   `cost if wrong × uncertainty`, per `bet-ledger.md` §4. Test top-of-stack only. The top
   assumption becomes the first bet's `Assumption` field.
4. **RAT plan.** For the top assumption: the smallest thing that could falsify it, and the
   result that counts as falsification, written before the test runs. Build only what tests
   it. If you would be reluctant to throw it away afterward, it is a build wearing a test's
   clothes (`bet-ledger.md` §4).
5. **PR/FAQ.** The launch announcement and the internal FAQ, written before design,
   engineering, or roadmap (Amazon's working-backwards practice, documented by Bryar and
   Carr). Its purpose is to kill ideas cheaply: most PR/FAQs are not approved, and that is
   the mechanism working, not the mechanism failing. The FAQ must answer the strongest
   objection, not the most convenient one.
6. **MVP-vs-MLP bar, chosen by competitive density.** An MVP tests whether people will use
   it at all. A Minimum Lovable Product (Brian de Haaff) tests whether they will *prefer* it
   to what they use today. Choose by counting: **list the alternatives the target user is
   using right now, including spreadsheets, manual process, and doing nothing.** Zero
   established alternatives → the MVP bar is sufficient. One or more entrenched incumbents
   → the MLP bar applies, and MVP-grade evidence is close to worthless, because "they used
   it once" says nothing about switching. Pick by density, not by dogma.
7. **PMF measurement plan.** Written before launch, not after: which survey, which users
   qualify to be sampled, at what point in their lifecycle they are asked, how the sample
   is segmented, and which number would mean the mode should change. Without this, §6's
   transition can never be evaluated and `zero-to-one` runs forever.

**The stopping condition.** `zero-to-one` ends one of two ways: a qualifying demand signal
appears (§2, §6) and the mode changes, or the top assumption is falsified and the effort is
recorded as closed-invalidated. A `zero-to-one` effort with neither result and a growing
feature list has quietly stopped being discovery.

---

## 5. `iterate` deliverables

Six artifacts. Nothing is ranked before the metric tree exists.

1. **North Star plus input-metric tree.** One North Star that expresses customer value,
   decomposed into a small set of input metrics a team can directly influence. This is a
   tree of *causal assumptions* — each edge claims that moving the child moves the
   parent — and each edge can be wrong. It is not a dashboard. **Nothing gets prioritized
   until the chain from North Star to input metric to this team's work is written down.**
2. **Opportunity solution tree.** Teresa Torres's structure: root is **one desired
   outcome**, branches are the opportunity space (customer needs, pains, and desires that
   drive that outcome), then solutions, then assumption tests. Two requirements. First,
   **one outcome per tree** — a tree with two roots is two trees, and it will be used to
   justify whatever was already planned. Second, **at least three solutions compared for
   the selected opportunity.** A single solution under an opportunity is not a choice; it
   is a decision already made, wearing a tree.
3. **Prioritized bets carrying the hit-rate assumption.** Bets in the ledger format, and
   the sequence must be arithmetically honest: across large experimentation programs,
   roughly one third of well-designed experiments move the target metric positively and
   significantly, roughly a third are flat, and roughly a third are negative (Kohavi's
   reported base rates). On an already-optimized surface the rate is lower. **A plan of six
   experiments that predicts six wins is wrong before it starts — expect about two.** The
   lever is experiment throughput, not the brilliance of any single bet.
4. **Now / Next / Later.** Janna Bastow's roadmap form. Timeline roadmaps encode three
   false assumptions: that you know how long each item takes and nothing disrupts it, that
   each item will work once it is finished, and that each item deserves to exist at all.
   Certainty decreases with distance, so specificity decreases with it: **Now** is specified
   and in progress, **Next** is on deck, **Later** is directional. Published non-goals ship
   with the sequence.
5. **Instrumentation plan.** The events, properties, and dashboards that make the outcome
   observable, plus guardrail and counter-metrics, plus the minimum detectable effect and
   the traffic and duration needed to reach it — except where this bet is the instrumentation
   that first records the event, in which case no baseline exists to state an MDE against yet
   and `metrics.md` §6 covers that case. Instrumentation is part of the definition of
   done. **A launch with no events firing is unmeasurable and therefore unlearnable** — it
   converts a bet into an opinion the moment it ships.
6. **Appetite-bounded scope.** From Shape Up (Ryan Singer, Basecamp): appetite inverts
   estimation. The question is not *how long will this take* but **how much time is this
   outcome worth** — and the answer is fixed while scope flexes to fit it. Bets are placed
   on shaped work for a fixed cycle, and unfinished work does not roll forward
   automatically; it goes back to be re-bet against everything else or dropped.

**The stopping condition.** Every quarter's plan being a list of tweaks while the North Star
sits still is the local-optimum grind, and more experiments will not fix it. That pattern is
evidence that the growth constraint is somewhere the current tree does not reach.

So `iterate` stops there, and here is what stopping means concretely. Name the constraint
the tree does not reach — the segment, the job, or the market the current product does not
serve — and re-run §2's gate test against *that*, not against the product as a whole. If
one of the four signals covers it with a named source, the work stays in `iterate` and
the tree was drawn too narrowly; redraw it. If no signal covers it — which is the usual
answer, since the constraint sits outside what the product has evidence about — that work
is `zero-to-one` for that segment, and it starts at Stage 0 in its own run rather than
continuing as another cycle of experiments here.

---

## 6. Transition — when `zero-to-one` graduates to `iterate`

The mode changes when a qualifying signal from §2 exists, is sourced, and covers the
population this bet is for. Concretely, any one of:

- **A cohort retention curve that flattens** above zero and holds through at least two more
  cohorts. Per-cohort, not blended.
- **A growth loop that closes** — the loop written out step by step, with one cohort
  measurably producing the next across at least two full cycles, without a matching rise in
  paid input.
- **A fit-survey result** at or above the recalibrated threshold (below), on a sample
  restricted to users who reached the product's core value.
- **A sustained value-action rate** for an episodic product where repeat use is not the
  value — a stable share of qualified sessions completing the core value action, held
  across a window long enough to rule out a launch spike, with the action instrumented
  directly rather than proxied by a pageview.

Record the transition like any other decision: the date, the signal, its tier and source,
and the segment it applies to. A mode that changes without a written signal will change
back the first time something disappoints, and nobody will be able to reconstruct why.

### The 40% number is a starting hypothesis, not a law

The widely cited *~40% "very disappointed"* threshold comes from Sean Ellis's benchmarking
across a set of startups. It is a **useful starting hypothesis to recalibrate against your
own data — not a constant, and not a law of nature.** Treat it accordingly:

- The result is sensitive to **who is sampled** — how recently they used the product, how
  far into the core experience they got, and how they were recruited. Two honest teams can
  produce very different numbers from the same product by sampling differently.
- Recalibrate: check the number against your own retention and conversion behavior in the
  same period. If users who say *very disappointed* do not retain better than users who do
  not, the survey is measuring politeness, not fit, and the threshold is meaningless for
  you.
- Report it with its sample size, its recruitment method, and its date. A bare percentage
  is `E0` wearing an `E2` costume.
- Never present the figure as a settled fact that fit has been achieved. It is one signal,
  from stated attitude, with a known say–do gap.

### Product/market fit is not binary — segment

A blended 22% is not a verdict. It is usually a mixture: one segment that would be badly
hurt if the product disappeared, blended with several that would shrug. Averaging them
throws away the only useful information in the survey.

The move, as operationalized by Rahul Vohra's fit engine at Superhuman (reported in First
Round Review):

1. **Split the survey by segment** — role, use case, company size, acquisition channel,
   whatever distinguishes the users. Find the segment whose *very disappointed* rate is
   materially above the blend.
2. **Build for that segment and stop building for the rest.** Take the main benefit those
   users name and deepen it; take the blockers named by *somewhat disappointed* users
   **within that segment only** and remove them. Requests from segments that would not miss
   the product are noise, and following them is how the number stays flat.
3. **Re-measure on a fixed interval** and treat the score as a curve to move rather than a
   state to reach. Superhuman's reported trajectory ran from roughly a fifth of respondents
   to well over half across successive quarters, by repeating exactly this loop.

Until a segment clears the bar, the mode is still `zero-to-one` — but the scope narrows to
that segment. **Partial fit narrows the target; it does not soften the gate.**

---

## The closing test

**This test runs only when the declared mode is `zero-to-one` or `iterate`.** Before any
other stage runs in one of those two, two lines must exist:

> **Mode:** `zero-to-one` | `iterate`
> **Because:** `<named signal>` — `<tier>`, `<source>`, covering `<segment / job>`

If the second line cannot be written, the mode is `zero-to-one`. Write that, say why, and
proceed — but proceed knowing which discipline you are in.

Under `strategy` or `audit` neither line is written and the `zero-to-one` default does not
apply. Those modes close Stage 0 on the subject named in `gate-checks.md` Stage 0 — the
symptom with its window and tier, or the specific artifact under review — and a declared
mode is never overwritten here because this file's test could not be run against it.
