# Frameworks — routing, not depth

Strategy, opportunity sizing, prioritization, and roadmapping each have several credible
tools competing for the same job. Picking the wrong one doesn't fail loudly — it produces
a well-formatted answer to a question nobody asked. This file exists to route a decision
to the right tool and to state, honestly, what each tool costs. It does not teach any
method to depth; follow the link and go learn the method from where its depth actually
lives.

## 1. Opening rule

Pick the framework the decision needs, not the one already on hand. A framework gets
chosen only after two things are named: the mode ([mode-gate.md](mode-gate.md) —
`zero-to-one` or `iterate`) and the kind of decision in front of you — strategy,
opportunity, prioritization, or roadmap. Reaching for a familiar tool before those are
named is how a RICE table gets built for a market nobody has sized, or a Kano survey gets
run on a problem that hasn't been scoped yet.

## 2. Routing table

| Need | Use | Where the depth lives |
|---|---|---|
| Diagnose a strategy | Rumelt's kernel — diagnosis, guiding policy, coherent action | strategy.md §1; Rumelt, *Good Strategy/Bad Strategy*, www.richardrumelt.com |
| Locate a request in the strategy hierarchy | The product strategy stack — mission, company strategy, product strategy, roadmap, goals, read bottom-up to debug | strategy.md §2 (the walk is §3); Mehta, reforge.com/blog/the-product-strategy-stack |
| Write a non-goal that costs something | Derive from the guiding policy, then the advocate / expectation / forfeit tests | strategy.md §4; gate-checks.md Stage 4 |
| Size a market | Bottom-up TAM/SAM/SOM as the primary number — customers × price × conversion where the product is monetized, and where nothing will be charged the same arithmetic in the unit actually delivered (customers × conversion × what each one gets per period), with the missing price said out loud; top-down as a sanity check only | SKILL.md Stage 2 (OPPORTUNITY); gate-checks.md Stage 2 carries the unmonetized branch and its refusal |
| Decide whether to pursue | Cagan's four-question opportunity assessment | SKILL.md Stage 2; templates/opportunity-assessment.md |
| Understand why people switch | Jobs to be done, plus the four forces acting on a switch (push, pull, anxiety, habit) | SKILL.md Stage 2; Christensen & Moesta, jobstobedone.org/the-four-forces/ |
| Map the problem space | Opportunity solution tree — one outcome at the root, then the opportunity space, then solutions | mode-gate.md §5, `iterate` deliverable 2; Torres, producttalk.org/opportunity-solution-trees/ |
| Find the riskiest unknown | Assumption map / RAT — plot importance against evidence, test the gap first | bet-ledger.md §4; mode-gate.md §4, `zero-to-one` deliverables 3–4 |
| Rank comparable items | RICE | §3 below |
| Sequence time-sensitive work | Cost of Delay / WSJF | §3 below |
| Understand satisfaction shape | Kano | §3 below |
| Find underserved outcomes | Opportunity scoring | §3 below |
| Fixed-date negotiation | MoSCoW | §3 below |
| Allocate personal effort | LNO — Leverage / Neutral / Overhead | §5 below |

## 3. Prioritization: pick by the shape of the decision, not by habit

Six methods cover nearly everything this pipeline asks of prioritization. Match the
method to the situation below instead of defaulting to whichever one is most familiar —
each is built for a narrower job than its popularity suggests, and each fails
predictably the moment it's used outside that job.

| Situation | Method |
|---|---|
| One goal, and the competing items are genuinely comparable | RICE |
| The items are time-sensitive and the order changes what they're worth | Cost of Delay / WSJF |
| It isn't clear whether an item delights, merely satisfies, or is just expected | Kano |
| It isn't even clear what to build — only which outcome is underserved | Opportunity scoring (stay in the problem space; do not prioritize solutions yet) |
| A date is fixed and will not move | MoSCoW |
| The call is low-stakes and needs to land in under half an hour | Impact/Effort |

**Never score items of different altitudes in the same table.** Split the table by
altitude before ranking anything; see bet-ledger.md §5 (refusal 4) for the trigger and the
exact words to use when a table arrives mixed.

Each method buys something at a cost. State the cost — don't just apply the method:

- **RICE** manufactures one number out of four separately guessed inputs, and a single
  number always reads as more settled than any of the guesses that fed it. It also has
  nothing to say about which items block or depend on which others — a high-scoring item
  that can't start until a low-scoring item ships will still rank above it on the table.
- **Cost of Delay / WSJF** correctly rewards work that is small, urgent, and valuable, but
  its Business Value and Risk-Reduction inputs are still estimates, just carrying more
  decimal places than they've earned — two people estimating in good faith will size the
  same item differently, and the arithmetic has no way to catch that.
- **Kano** describes the shape of satisfaction, not a build order, and a rating decays —
  a delighter tends to become merely expected over time, on a timescale that depends on
  the category and how fast competitors move, not a fixed one. Treat any Kano read as
  time-stamped, not permanent.
- **Opportunity scoring** needs real respondents rating real outcomes to mean anything;
  run without a survey behind it, the "underserved" number is just a guess with a formula
  stapled to it.
- **MoSCoW** carries no ranking inside a tier, and tiers drift — items pitched as Should
  get argued upward toward Must until the Must bucket is the whole backlog and the
  tiering has stopped doing any work.
- **Impact/Effort** is fast because it discards exactly the two inputs that matter most —
  reach and confidence. Left alone, it reliably favors whatever is small and certain over
  whatever is large and uncertain, regardless of which would move the goal further. Use
  it to cut a long list down before a real method runs on what's left, never as the
  ranking itself.

## 4. Roadmapping

**Now / Next / Later, not a dated timeline.** mode-gate.md §5 (`iterate` deliverable 4)
covers why a dated timeline doesn't hold up; this file only needs the practical split:
Now is specified and already underway, Next is queued but not yet detailed, Later is
directional and can still change.

**Rows are outcomes, not features.** State an outcome or a customer problem, not a
feature — "cut time-to-first-value under five minutes," not "ship onboarding v2." A
feature-shaped row holds only as long as one particular solution stays chosen; an
outcome-shaped row doesn't depend on that choice. This is the same discipline
bet-ledger.md §5 already refuses on (refusal 6) — use its trigger rather than re-deriving
one here.

**Three questions to run against a roadmap, not six isolated checks.** Each question
below folds together more than one way a roadmap curdles:

1. **Where did these rows come from?** If the honest answer is that they were pulled
   straight from whatever individual teams already had queued up, nothing was actually
   chosen — and the volume confirms it from another angle: count what's genuinely live
   this quarter; more than about three concurrent objectives is itself the tell that
   nothing was cut, whatever the sourcing story claims.
2. **Can these rows go stale?** Test it by covering the solution named in a row and
   reading what's left — if nothing about a problem or outcome survives, that's the
   failure named just above; use bet-ledger.md §5's trigger (refusal 6) rather than
   re-deriving one here. The other way a row goes stale is subtler: if outcome format was
   adopted recently, check whether a habit keeps enforcing it, not just the meeting that
   introduced it — a one-time conversion with nothing behind it tends to slide back into
   feature rows within a couple of months.
3. **Is the horizon structure honest?** A specific date attached to anything past Now or
   Next is a claim to knowledge nobody has; ask what changed to make that knowable this
   far out — usually nothing did, which makes the date decoration, not a plan.
   Separately, ask who is actually reading a row: one that sales or a customer is
   treating as a locked commitment, rather than the team's current best bet, has turned
   the roadmap into a contract nobody decided to sign.

## 5. Solo-operator reality

Solo is this pipeline's default. Most of what earns its keep for a team earns its keep
for one person too, for a different reason: there's no teammate to catch a bet missing a
kill criterion, no reviewer to ask what the non-goals are, no second person to notice a
narrative that never answered the hard question. The ledger's required fields, dated
kill criteria, published non-goals, and a short PR/FAQ or one-pager for anything with
real ambiguity all still earn their cost — they take minutes, and they're the only check
that exists when nobody else is in the room. For splitting the operator's own time across
what's in front of them, LNO is worth running solo too — outsized attention on Leverage
work, a timebox on Neutral work, and Overhead work cut or automated — the guardrail
against a whole afternoon disappearing into something that looks impressive in a deck
while the bet that actually matters sits unexamined.

What stops earning its keep is anything sized for coordinating other people. A six-pager
built for a silent room of stakeholders has no room to be silent in. A launch-readiness
review built around cross-functional sign-off collapses to a short checklist when there
is no cross-function to sign off. A weekly metrics-review deck, a strategy-stack document
with a distinct owner per layer, an OKR grading ritual — these exist to keep several
people pointed the same direction, and one person is already pointed. Skip them; solo,
they cost more than they return.

**The escape hatch.** If the operator says "just build it" — or "just give me the answer" —
don't hold the gate closed. Ask the two questions that matter most for the mode that was
actually declared: for `zero-to-one`, what's the riskiest assumption and what would kill
it; for `iterate`, what outcome does this move and what would tell you it isn't working;
for `strategy`, what's the diagnosis and what does the policy rule out; for `audit`, which
artifact and which stages does it claim to have passed. Then proceed on whatever answer
comes back, filling in the rest as reasonably as possible. If the operator declines those
two as well, that is a second refusal — respect it immediately and hand off. This pipeline
never builds: write down what is known, mark what was skipped as unanswered rather than
filled in, and pass it to the build function — through Stage 7 in the modes that run one,
directly in `strategy` and `audit`, which do not. "Just build it" ends this pipeline early;
it does not turn it into an engineering one.
