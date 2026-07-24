# Bet Ledger — what is allowed to consume build capacity

Nothing gets built because it is a good idea. It gets built because it is a **bet**: a
claim about the world, with evidence behind it, a test that could kill it, and a date by
which we stop pretending. This file defines the bet, the evidence tiers a bet must cite,
how bets get classified and ranked, and the refusals that keep the ledger honest.

Every artifact downstream — the roadmap, the narrative, the measurement plan — is a view
onto this ledger. If something appears in one of them and not here, it is not funded.

---

## 1. What a bet is

Five fields. All five are required. An empty field is a gate failure, not a judgment
call — anyone can check it, including a model that has forgotten the rest of this file.

| Field | What goes in it | It fails if |
|---|---|---|
| **Outcome** | The one metric this bet moves, its current baseline, and the line up to the North Star. | It names an activity ("ship onboarding v2") instead of a change in a measurable number. |
| **Assumption** | The single falsifiable claim the bet rests on, written so a real result could contradict it. | It cannot be false. "Users want a better experience" is not an assumption. |
| **Evidence tier** | The tier behind the Assumption — `E1`–`E5` or `E0` (§2) — plus the named source. | It states a tier without a source, or states a summary tier instead of the chain (§2, rule 1). |
| **Cheapest killing test** | The smallest thing that could invalidate the Assumption, and what result would count as invalidation. | The test is the build. If passing it produces the feature, it is not a test (§4). |
| **Kill criterion** | "If *X* is not true by *D*, we stop." A threshold and an absolute date. | The date is "next quarter", the threshold is "traction", or the only listed outcome is success. |

**The governing line:**
*"If you can't name what would kill this bet and by when, it isn't a bet — it's a wish."*

Writing rules, enforced when the ledger is built:

- **One Assumption per bet.** If the bet needs two independent claims to be true, it is
  two bets. Split it and rank them separately (§4).
- **The date is a date.** `2026-09-15`, not "end of quarter", not "after the pilot".
- **Name the owner.** One person per bet, by role. A bet owned by "the team" is owned by
  nobody and will not be killed on time.
- **Write the kill first.** Fill `Kill criterion` before `Cheapest killing test`, and the
  test before the solution. Reversing this order produces a solution wearing a bet's
  clothes.
- **Killing is a result.** A bet that dies at its kill date on a cheap test is a success
  of the ledger. Record it as closed-invalidated, not as a failure.

Fill the table in `templates/bet-ledger.md`; the stage gates in `gate-checks.md` check
these same five fields.

---

## 2. The evidence ladder

Every bet carries an `Evidence tier` on its Assumption. The tier is not a citation
style — it decides what the bet is allowed to buy. This ladder is self-contained: it
requires no other file, skill, or research function to be installed.

**Strength order, strongest to weakest: `E1` > `E2` > `E3` > `E4` > `E5` > `E0`.**
"Weaker" always means toward `E0`, never toward the larger numeral.

| Tier | Name | What it is |
|---|---|---|
| `E1` | Observed behavior | What people actually *did*. Product analytics, funnel and retention data, session recordings, prior experiment results, purchase and renewal records, support tickets describing real events. |
| `E2` | Stated first-party attitude | What people said *to us*. Interviews we ran, our own survey responses, sales-call notes, direct customer email. Say–do gap applies: a statement about future behavior ("I'd pay for that") is materially weaker than an account of past experience. |
| `E3` | Verbatim public VoC, sourced | What people said *in the wild*, in their own words, with a link. Reviews, app-store comments, community and forum threads, complaint threads about competitors. Paraphrase without a link is not E3. |
| `E4` | Desk research | What is known about *people like ours*. Published studies, industry and market reports, competitor teardowns, analogous-domain benchmarks. Never a substitute for a fact about our own users. |
| `E5` | Synthetic / model-generated | Anything a model produced about users, demand, or willingness to pay without contact with a real one. Personas, simulated panels, generated quotes, model-estimated sizing. Directional hypotheses only — never findings. |
| `E0` | Assumption | Intuition, the operator's judgment, unlabeled common sense, a number inherited from a deck with no origin. Legitimate and often correct; must be tagged wherever it appears. |

### Hard rule 1 — a claim inherits the weakest tier in its chain

A bet is only as strong as the weakest load-bearing link. If the market size is `E4`, the
demand signal is `E3`, and the willingness-to-pay is `E0`, **the bet is `E0`** — because
if the price assumption is wrong, nothing above it survives.

Write the chain, not a verdict:

> `Evidence tier: E0` — sizing E4 (2026 category report), pain E3 (14 sourced review
> quotes), *price point E0 (no evidence, load-bearing)*.

Italicize or otherwise mark the weakest link. It is the thing the test must attack.

### Hard rule 2 — `E5` and `E0` never promote

`E5`/`E0` material never becomes "validated", "confirmed", "proven", or "what we know."
Not by repetition, not by a model restating it with more confidence, not by an executive
agreeing with it, not by pairing it with `E4`. **It graduates only by being tested at
`E1`–`E3`**, and the bet must name that test in `Cheapest killing test`.

Quarantine as well as tag: `E5`/`E0` content lives in a section labeled Assumptions or
Hypotheses, never interleaved with evidenced claims. Proximity is how the tag falls off.

A Type 1 decision (§3) taken on `E5`/`E0` evidence is refused, not discounted.

---

## 3. Type 1 / Type 2 decisions

Classify every bet before sequencing it. The classification changes how much process it
gets, who decides, and what evidence floor applies.

- **Type 1 — one-way door.** Expensive, slow, or impossible to reverse. Pricing and
  packaging, data models and schemas, public APIs and integration contracts, brand and
  naming, platform choice, anything touching customer trust, migrations with no rollback.
- **Type 2 — two-way door.** Reversible in days at low cost. Most UI, copy, ranking
  logic, defaults, flows behind a flag, internal tooling.

**The classification test:** state the cost and elapsed time to undo this decision six
months from now. If nobody can state it, treat it as Type 1 until someone can.

Both directions fail, and they fail differently:

- **Heavyweight process on a reversible call.** Committees, decks, and sign-off queues
  spent on something a flag could undo in an afternoon. Bezos's 2015 shareholder letter
  names the cost of this exactly: "slowness, unthoughtful risk aversion, failure to
  experiment sufficiently, and consequently diminished invention." This is the more
  common failure as an organization or a document grows.
- **Casual commitment on an irreversible one.** A price set in a hallway, a schema chosen
  by whoever wrote the first migration, an API shipped public because it was already
  written. These are cheap on the day and structural for years.

Rules:

1. **Type 1 requires:** a named decision-maker, a written narrative with alternatives
   including "do nothing", the reversal cost stated in the ledger, and an evidence floor
   of `E1`–`E3`.
2. **Type 2 requires:** a decision in one session on the evidence at hand, and a
   **revisit date** recorded in the ledger. A Type 2 with no revisit date is a Type 1 by
   accident — it will never be re-examined and will harden into a constraint.
3. **Converting doors is a legitimate move.** A feature flag, a rollout ring, a reversible
   migration path, or a time-boxed pilot can turn a Type 1 into a Type 2. When that is
   the plan, write the conversion mechanism into the bet — otherwise the door is still
   one-way.

---

## 4. Assumption ranking

A bet usually rests on a stack of assumptions. Testing them in the order they occurred to
someone is how teams spend a quarter validating the third-most-important thing.

**Rank by `cost if wrong × uncertainty`. Test top-of-stack only.**

1. **List every assumption the bet needs to be true.** At minimum cover value (will they
   use or buy it), usability (can they succeed at it), feasibility (can we build it), and
   viability (does the business, legal, and support surface survive it).
2. **Score each on two coarse axes** — cost if wrong (what we lose if we build on it and
   it turns out false) and uncertainty (how likely we are to be wrong, given the current
   `Evidence tier`). Use high/medium/low or 3/2/1. Anything finer is false precision and
   invites arguing about the arithmetic instead of the assumptions.
3. **Sort descending and cut.** The top assumption becomes the bet's `Assumption` field.
   The rest are recorded in the stack, unowned and untested, until they reach the top.
4. **Design the cheapest thing that could falsify the top one**, and write down in advance
   what result counts as falsification.
5. **Re-rank after every result.** A test that lands changes the uncertainty on everything
   below it. A stack ranked once and then worked through as a queue is a backlog.

**The RAT principle** (Rik Higham's Riskiest Assumption Test, offered as the replacement
for the decayed "MVP"): identify the largest unknown and **build only what tests it** —
with no expectation of good code, good design, or that it becomes the product. If the
test survives contact, you throw it away and move to the next-riskiest assumption.

Two consequences worth stating plainly:

- **If you would be reluctant to throw the test away, it is not a test.** It is a build
  with a research label, and it will bias every decision after it toward keeping it.
- **A pilot that cannot fail is not a pilot.** If no falsification criterion was written
  before it started, it will produce a narrative, not a result.

---

## 5. Anti-theater refusals

These are refusals, not preferences. Each has a trigger you can detect mechanically and
words to say when it fires. Say the words, name the specific item, ask for the missing
thing, and stop. Do not fill the gap by inventing plausible content — a fabricated kill
criterion is worse than a missing one, because it passes the check.

**1. Roadmap item with no outcome and no dated kill criterion.**
- **Trigger:** an item is proposed for the roadmap, the sequence, or the ledger without
  both an `Outcome` and a dated `Kill criterion`.
- **Refuse:** *"'<item>' has no outcome and no kill criterion, so I can't sequence it. What
  metric does it move, and what result by what date would make us stop?"*
- **Accept when:** both fields are filled, with a number and an absolute date.

**2. "Strategy" that is actually a goal.**
- **Trigger:** a strategy is presented with no diagnosis — no statement of what is
  actually wrong, blocking, or changing. Ambition and targets only.
- **Refuse:** *"That's a goal, not a strategy — it says where we want to end up, not what's
  in the way. What's the diagnosis: the specific obstacle or change this responds to?"*
- **Accept when:** a diagnosis exists, a guiding policy responds to it, and the actions
  are coherent with the policy.

**3. Sequence with no published non-goals.**
- **Trigger:** a Now/Next/Later, a quarter plan, or a scope proposal arrives without an
  explicit list of what we are *not* doing.
- **Refuse:** *"This sequence has no non-goals, so it fails the gate. Name at least three
  things a reasonable person would expect us to do this period that we are explicitly not
  doing."*
- **Accept when:** the non-goals are written into the artifact, not agreed verbally.

**4. Scoring across altitudes.**
- **Trigger:** a single prioritization table contains items of wildly different scope — a
  platform migration next to a button color, a year-long initiative next to a copy fix.
- **Refuse:** *"These aren't comparable — <big item> and <small item> can't share a score.
  Split the table by altitude and rank within each, or the small items will win on effort
  every time."*
- **Accept when:** each table holds items of one altitude, scored against one goal.

**5. OKR theater.**
- **Trigger:** the quarter's objectives are the existing roadmap reformatted — same work,
  new headings — with no strategic choice, no tradeoff, and nothing dropped.
- **Refuse:** *"This is the roadmap in OKR formatting. Nothing was chosen and nothing was
  dropped. What are we doing differently this quarter because of these objectives?"*
- **Accept when:** at least one thing was cut or deferred as a direct result.

**6. Feature-list roadmap.**
- **Trigger:** roadmap rows are features, components, or projects rather than outcomes or
  customer problems.
- **Refuse:** *"These rows are features, so the roadmap stops being true the moment the
  solution changes. Restate each as the outcome or problem it addresses — '<feature>'
  becomes '<the problem it solves>'."*
- **Accept when:** every row states a problem or an outcome, with the solution as a
  current option beneath it.

**7. Customer claim with no source.**
- **Trigger:** any statement about what users want, do, feel, or would pay, with no
  traceable source and no tier tag.
- **Refuse:** *"'<claim>' has no source. Give me the source and its tier, or I'll tag it
  `E0` and it can only fund a test, not a build."*
- **Accept when:** the claim carries a source and a tier, or is explicitly tagged `E0`
  and quarantined per §2.

**8. Experiment where both outcomes lead to the same decision.**
- **Trigger:** a proposed test, pilot, or experiment whose win and lose branches produce
  the same next action.
- **Refuse:** *"Before we run this: what do we do if it wins, and what do we do if it
  loses? If those are the same action, the test is decoration — skip it and ship the
  decision we've already made."*
- **Accept when:** the two branches lead to materially different actions, both written
  down before the test starts.

---

## The closing test

Every bet in the ledger ends with two lines:

> **This bet rests on:** `<tier>` — `<named sources, weakest link marked>`
> **It dies if:** `<threshold>` is not met by `<date>`

If either line is hard to write, the bet is not ready. Take it back to the assumption
stack, rank again, and find the cheaper test.
