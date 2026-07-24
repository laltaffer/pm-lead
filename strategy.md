# Strategy — the kernel, the stack, and how to debug one

Stage 1 (FRAME) gates every mode in this pipeline, and `strategy` mode is close to nothing
but Stage 1 followed by a sequence. This file owns both. It defines the kernel a frame is
written in, the stack a frame is placed on, the walk that finds where the stack stops
holding, and the craft of a non-goal that costs something.

It teaches method, not routing. [frameworks.md](frameworks.md) decides which tool a
decision needs; this file is the depth behind three rows of its table. Bets, evidence tiers,
and the Type 1 / Type 2 classification belong to [bet-ledger.md](bet-ledger.md); metrics
belong to [metrics.md](metrics.md); the pass/fail form of every gate belongs to
[gate-checks.md](gate-checks.md). Read those where they live rather than expecting them
restated here.

Everything below is checkable by inspection. That is deliberate: a frame is the easiest
artifact in this pipeline to fake, because ambition reads like insight until someone asks
what it responds to.

---

## 1. The kernel — diagnosis, guiding policy, coherent action

Richard Rumelt's kernel (*Good Strategy/Bad Strategy*, 2011) names the three parts a
strategy has to contain: a **diagnosis**, a **guiding policy**, and **coherent action**.
They are written in that order, and the order is load-bearing. A policy written before a
diagnosis is a preference. Actions written before a policy are a to-do list with a
strategy label on the folder.

### 1.1 What each part is

**Diagnosis** — a claim about why the thing you want is not already happening. A
well-formed diagnosis has three parts, and you can point at each of them separately:

| Part | What it is | How it fails |
|---|---|---|
| **Observation** | Something in the record: a number, a behavior, a transcript, an event. | Nothing was looked at; the sentence describes a feeling about the product. |
| **Locus** | Where it happens — which step, which segment, which surface, which market. | It applies to the whole product at once, which means it locates nothing. |
| **Mechanism** | The *because*. What causes the observation. | The sentence stops at the observation and calls it a cause. |

If any of the three is missing, the sentence is not yet a diagnosis. Say which part is
missing and hold the gate. Do not supply the missing part yourself — a fabricated
mechanism is worse than an absent one, because it will pass every check downstream.

A diagnosis does not have to be a defect. A change in the world qualifies and is often the
more useful kind: a channel that repriced, a platform policy that closed a source of
traffic, a free substitute that now does most of the job. What makes it a diagnosis is
that it is specific, sourced, and could turn out to be wrong.

Carry the diagnosis's evidence tier per [bet-ledger.md](bet-ledger.md) §2. A diagnosis at
`E0` is allowed — the operator's judgment often gets there first — but it is tagged, and
it funds diagnostic work rather than a build. The boundary against §1.4: a tagged claim is
not the same as a stated unknown. An `E0` diagnosis still names an observation, a locus,
and a mechanism, and could be shown wrong; what is weak is the evidence under it. A stated
unknown names no mechanism to be wrong about at all. That is the whole difference: an `E0`
diagnosis passes Stage 1 carrying its tag, and a stated unknown does not pass.

**Guiding policy** — the general approach taken in response. It is not the plan. It is the
rule the plan has to obey, and its job is to make most options stop being candidates. A
policy that names where leverage comes from is stronger than one that names an intention:
the first tells you what to do in a situation nobody anticipated, the second only tells you
how to feel about it.

**Coherent action** — the specific things done under the policy, chosen so that they hold
each other up. Coherence is a property of the set, not of the items. Six good actions that
have nothing to do with each other are six good actions.

### 1.2 Three tests, run in order

**Test 1 — negation (is this a diagnosis or a goal wearing one's clothes?).**
Negate the sentence's **claim about the world** — what it asserts is true of the product,
the customer, or the market — not the want the sentence is wrapped in. The two come apart
in evaluative phrasings, which is exactly where this test gets run wrong. *We're not
growing fast enough* carries a want (grow faster) and, underneath it, no claim about why
growth sits where it does. Negate the want and you get *we are growing fast enough*, which
reads like a position and tests nothing. Negate the claim and there is nothing to negate —
which is the finding, not a failed test. Isolate the claim first, then read its negation
aloud:

- If the negation is something a competent person could have sincerely believed about this
  product last month, the sentence is a diagnosis. It carries information about the world,
  so its opposite is a real position.
- If the negation is something nobody in the room would ever assert, or there was no claim
  left to negate once the want was set aside, the sentence is a goal, a value, or a
  platitude.

**Test 2 — exclusion (does the guiding policy forbid anything?).**
Name one thing that is currently wanted — by a customer, by the operator, by whoever is
paying — that adopting this policy rules out. If nothing on the current list of candidates
is excluded by the policy, the policy is an aspiration. Real policy has a visible cost
side, and the cost is legible the moment it is adopted, not a quarter later. The excluded
items are also the raw material for §4's non-goals; that is not a coincidence, it is the
same decision written down twice.

*Sub-check — responsiveness.* Cover the diagnosis and read the policy by itself. If you
can reconstruct roughly what the diagnosis said from the policy alone, the policy is
answering it. If the policy would sit comfortably above any diagnosis this product could
plausibly have had, it is answering nothing in particular.

**Test 3 — reinforcement (are the actions coherent or merely simultaneous?).**
Pick any two actions and write one sentence: how does the first make the second cheaper,
faster, or more likely to work? Repeat for two more pairs. If no such sentence exists for
any pair, the list is a schedule and the word *coherent* is doing no work. Two actions
that reinforce beat six that do not.

### 1.3 A worked contrast

A small product that sends appointment reminders for veterinary clinics. Ninety-day
retention among newly signed clinics is 41%. Same product, same quarter, same ambition in
both frames below.

**Frame A — fails.**

> *Diagnosis:* We are not growing fast enough with veterinary clinics and need to become
> the reminder system they default to.
> *Guiding policy:* Focus on the veterinary segment and deliver a best-in-class reminder
> experience.
> *Actions:* Rebuild the reminder editor. Hire a second support person. Run a paid pilot
> with a clinic network. Refresh the marketing site.

Run the tests. **Negation:** set the want aside — *become the reminder system clinics
default to* — and what is left is *we are not growing fast enough*, which asserts nothing
about why growth sits where it does. There is no claim to negate, so it is a goal.
**Exclusion:** the policy rules nothing out; all four
actions survive it, and so would any other four. **Reinforcement:** no pair reinforces —
the editor rebuild does not make the pilot cheaper, and the site refresh helps none of
them. Frame A fails all three, and it will pass an informal read because it sounds
decisive.

**Frame B — passes.**

> *Diagnosis:* Clinics that abandon do it in week three, and the abandonment clusters on
> accounts where reminder setup was never finished (observed: setup-completion timestamps
> for 62 signups, `E1`, product analytics). Setup requires building a template per
> appointment type, and the front-desk staff doing it are the same people covering intake,
> so it gets started during a lull and never resumed.
> *Guiding policy:* Nothing in this product may require a front-desk person to configure
> anything during clinic hours. We win on setup that survives a busy day, not on editor
> depth.
> *Actions:* (1) Ship a starter template set derived from the appointment types already in
> the practice-management system, so setup is an import rather than an authoring task.
> (2) Move whatever configuration remains into one guided pass a practice manager can
> finish after hours. (3) Decline every request that adds a configurable field to the
> reminder editor for this period.

Run the tests. **Negation:** *abandonment does not cluster on accounts with unfinished
setup* — a real position, and one the timestamps could have supported. **Exclusion:** the
policy rules out the editor rebuild that Frame A led with, and it rules out the request
queue that generated it. **Reinforcement:** (1) shrinks what is left for (2) to cover, and
(3) protects both from being re-expanded next month.

The difference between the two frames is not writing quality. It is that somebody went and
looked.

### 1.4 When the diagnosis is not known

The correct output is not a plausible diagnosis. It is dated diagnostic work:

> We do not know whether week-three abandonment is a setup problem or a value problem. By
> 2026-09-30: pull setup-completion timestamps for every account that churned in the last
> two quarters, and interview five clinics that abandoned.

**This does not pass Stage 1.** A stated unknown is not a diagnosis, and the gate stays
closed while the work runs. That is the honest state of the pipeline, and it is a far
cheaper place to sit than three months into a plan built on a guess that read well.

---

## 2. The strategy stack — five layers, and how to tell which one you are on

Ravi Mehta's product strategy stack has five layers, top to bottom: **company mission**,
**company strategy**, **product strategy**, **roadmap**, **goals**. Construction runs
downward — each layer is derived from the one above it. Repair runs upward, which is §3.

Stage 1 requires the frame to name exactly one layer. That check is only meaningful if the
layers are distinguishable, so this section defines them and gives a procedure for placing
a request on one.

### 2.1 The layers

| Layer | What it decides | A well-formed entry | Rewritten when | Wrong-layer tell |
|---|---|---|---|---|
| **Mission** | Who the organization exists for, and what it exists to change for them. | One sentence with a *who* and a *change*. No numbers, no dates, no mechanism. | The organization becomes a different organization. | It contains a date or a target. |
| **Company strategy** | Which market, which customer, and where a durable advantage comes from — plus what the business is deliberately not in. | Names a market, a customer, and a source of leverage that is not available to everyone. | The market or the advantage moves. | It would read identically over a competitor's letterhead. |
| **Product strategy** | What stands between the chosen customer and the value the business is claiming, and what will be done about it. | §1's kernel, one page. | The diagnosis is resolved or falsified. | It is a list of features with a heading. |
| **Roadmap** | Which bets, in what order, at what appetite — with non-goals attached. | Sequenced outcomes; form in [frameworks.md](frameworks.md) §4. | Every cycle, by design. | A row names a solution and no outcome ([bet-ledger.md](bet-ledger.md) §5, refusal 6). |
| **Goals** | The numbers that say whether the layers above are working. | North Star and input metrics ([metrics.md](metrics.md)); per-bet thresholds and dates ([bet-ledger.md](bet-ledger.md) §1). | Each period. | A goal with no threshold, or a threshold with no date. |

### 2.2 Placing a request on the stack

Two questions, then a tiebreak. Run all three steps even when the first answer seems
obvious.

**Step 1 — the clock question.** How often would this statement legitimately be rewritten?

| Answer | Layer |
|---|---|
| Every period, as results come in | Goals |
| Every cycle, as capacity and sequence change | Roadmap |
| When the diagnosis is resolved or proven wrong | Product strategy |
| When the market or the advantage moves | Company strategy |
| Only if this became a different organization | Mission |

**Step 2 — the one-why question.** Ask *why this?* exactly once, and classify the answer —
not the request.

| The answer is | Layer |
|---|---|
| A number to hit | Goals |
| Capacity, sequencing, or timing | Roadmap |
| A claim about why the chosen customer picks this over the alternative | Product strategy |
| A claim about which market the business plays in, or where its leverage is | Company strategy |
| A claim about why the organization exists at all | Mission |

**Step 3 — the tiebreak.** If the two steps land on different layers, take the **higher**
one, and write one sentence saying why the lower reading was rejected. Requests arrive
dressed at the lower layer with an upper-layer decision folded inside them — a roadmap
question that is really a segment choice, a goal that is really a pricing commitment. This
is the ordinary case, not the exotic one. Taking the lower reading is how a company-level
decision gets made by accident during a sequencing conversation, and nobody can later find
where it was made.

### 2.3 One layer per frame

Name one layer in the Stage 1 frame. If the work also depends on a layer above being true,
record that dependency as an assumption with its evidence tier rather than quietly
deciding it. A frame that names two layers has not chosen; a frame that names *strategy*
as a bare label has not answered the question.

---

## 3. Debugging bottom-up — what `strategy` mode does

`strategy` mode does not begin with a blank strategy document. It begins with a complaint:
goals keep getting missed, or goals keep getting hit and nothing changes, or the sequence
is full and the North Star has not moved in three quarters. The technique is to walk up
the stack until the layer that cannot explain the one below it is found, and to write the
kernel *there* rather than where the pain is felt.

### 3.1 First, evidence the symptom

Write the symptom as an observation before doing anything else: what was seen, over what
window, from what source, at what tier ([bet-ledger.md](bet-ledger.md) §2). A symptom at
`E0` — *it feels like we're spinning* — debugs a mood. It is a legitimate reason to start
looking; it is not a legitimate input to the walk. Get it to `E1`–`E3` first, or the walk
will find whichever layer the operator was already unhappy with.

Then place the symptom on a layer with §2.2's procedure. It nearly always lands on Goals
or Roadmap.

### 3.2 The explanation questions

Each layer is supposed to explain the one beneath it. There are four adjacent pairs, and
each has one question with a checkable answer.

| Pair (child ← parent) | The question | It holds when | It fails → break is at |
|---|---|---|---|
| Goals ← Roadmap | For each goal, which sequenced item is claimed to move it? For each item, which goal? | Every goal has at least one carrier and every item serves exactly one goal. | **Roadmap** — the sequence is not carrying the goals, or is carrying something else. |
| Roadmap ← Product strategy | For each item, which sentence of the guiding policy makes it a good idea — and what did the policy exclude from this same list? | Every item traces to a policy sentence, and at least one real candidate was excluded. | **Product strategy** — if everything qualified, the policy decided nothing. |
| Product strategy ← Company strategy | Does the product's claimed advantage draw on the business's — same customer, same market, same leverage? | The diagnosis is specific to this business's position. | **Company strategy** — or the product strategy is untethered from it. Tell: the same kernel would suit a competitor equally well. |
| Company strategy ← Mission | Is the customer being served inside the mission's *who*? | Yes, and it can be shown in the mission's own words. | **Mission** — usually because it is unwritten, so drift has nothing to register against. |

### 3.3 The walk

1. **Write the symptom** as an observation with a window, a source, and a tier (§3.1).
2. **Place it** on a layer (§2.2).
3. **Run the explanation question** for the pair immediately above it.
4. **If it fails, the break is located** — go to step 7 and write the kernel there.
   **If it holds, move up one pair** and run the next question. Steps 5 and 6 govern the
   holds branch only.
5. **Non-answer rule.** An answer that restates the child layer in the parent layer's
   vocabulary is a failure, not an answer. *The roadmap serves the strategy, because the
   strategy is to do these things* is the child wearing the parent's clothes. Score it as
   a failure and locate the break there.
6. **Ceiling rule.** If every pair holds all the way to the top, **the break is not in the
   stack.** Say that, and stop. What is left is execution quality, evidence quality, or
   time — and none of the three is repaired by rewriting a strategy. Producing a strategy
   problem because `strategy` mode was the mode invoked is the same manufacture this pack
   refuses everywhere else.
7. **Write the kernel at the located layer** (§1). The diagnosis is about the layer, not
   about the symptom: the symptom is the evidence, the layer is the subject. A diagnosis
   that simply restates the complaint has skipped the walk.
8. **Confirm before proposing.** State one observation you would expect to find in the
   record if the located layer were healthy, then go look for it. If you cannot state such
   an observation, you picked a layer rather than found one — return to step 3.

### 3.4 Triage — where to start looking

Starting points, not verdicts. Every row still runs the walk.

| Symptom | Usual break | Why |
|---|---|---|
| Goals were hit and nobody can name what changed for a customer | Goals, or product strategy | The metrics measure activity, or no layer above ever made a claim about customer value. |
| Goals were missed, and each miss has its own local explanation | Roadmap | Nothing in the sequence was ever load-bearing for the goal; the misses are unrelated because the link was. |
| The sequence is full and the North Star is flat | Product strategy | The policy excluded nothing, so the list filled with whatever was already queued. |
| The same tradeoff is re-argued every month | Product strategy | There is no policy to appeal to, so each instance is decided fresh. |
| Every incoming request sounds in scope | Product strategy | A missing diagnosis; without one, nothing can be off-topic. |
| Two efforts in the same business chase the same customer | Company strategy | The layer that was supposed to divide the market did not. |
| This quarter's objectives are last quarter's work under new headings | Roadmap → then product strategy | Start at the sequence; the cause is usually a policy that forbids nothing ([bet-ledger.md](bet-ledger.md) §5, refusal 5). |

### 3.5 What `strategy` mode produces

Four stages run: 0, 1, 4, 8. The output is:

- **From Stage 1** — the located layer, and the kernel written at it.
- **From Stage 4** — non-goals derived from the new guiding policy (§4), and the coherent
  actions sequenced as bets.
- **From Stage 8** — optional, and skippable, as everywhere else.

Two connections worth stating, because they are where this mode is easiest to get wrong:

- **The coherent actions enter Stage 4 as bets** in the five-field form
  ([bet-ledger.md](bet-ledger.md) §1) and carry a Type 1 / Type 2 classification (§3 of
  that file). Stage 3 does not run in this mode, so its discovery branches — the ranked
  assumption stack, the opportunity solution tree — are not produced; the five fields and
  the classification still are. A strategic action with no kill criterion is a wish at a
  higher altitude than usual, which is the only thing that makes it look different from
  any other wish.
- **`strategy` mode does not scope a thing to build.** When the walk ends and someone
  wants the first action specified, that is a new run of the pipeline in `zero-to-one` or
  `iterate`, starting at Stage 0 with its own demand evidence
  ([mode-gate.md](mode-gate.md) §2).

---

## 4. Non-goals that cost something

Publishing non-goals as a standing artifact beside the goals — rather than leaving what is
excluded to be inferred — is Ravi Mehta's practice, reported in First Round Review. This
section is how that artifact gets written here.

Stage 4 will not close without published non-goals, and [bet-ledger.md](bet-ledger.md) §5
(refusal 3) owns the trigger for a sequence that arrives without them. Stage 4's gate in
[gate-checks.md](gate-checks.md) checks each published non-goal against §4.2's three tests.
What no file has covered is how to pick one that means anything. A non-goal list nobody
would have argued about is a formatting exercise that makes a plan look decided.

### 4.1 Derive them; do not brainstorm them

Non-goals come out of the guiding policy, mechanically:

1. Write down what the policy forbids — Test 2 in §1.2 already surfaced the first one.
2. Write down what is actually wanted right now: requests on record, deals naming a
   feature, the operator's own favorite idea.
3. **The intersection is the non-goal list.** Something forbidden but unwanted costs
   nothing to decline. Something wanted but not forbidden is not a non-goal — it is
   backlog, and calling it a non-goal is how a policy gets credit for a choice it never
   made.

### 4.2 Three tests, all three required

| Test | The check | Fails when |
|---|---|---|
| **Advocate** | Name who loses by this being declined — a role, a named customer, a deal, a channel, or the operator's own preference, which counts. | Nobody loses. Nobody asked. |
| **Expectation** | Would a competent outsider, reading only the diagnosis and the goals, expect this to be on the plan? | They would never have thought of it, so excluding it announces nothing. |
| **Forfeit** | Name the currency and the amount given up: revenue this period, a segment, a partner, a launch date, a capability. | The honest answer is *nothing*. |

Two out of three is a candidate to fix, not to publish. A worked one:

> **Non-goal (this period): no configurable fields in the reminder editor.** Advocate:
> three clinics have asked, and one of them is the largest account. Forfeit: we accept the
> renewal risk on that account and we lose the editor-depth comparison against the
> incumbent. Reconsidered 2026-10-15.

### 4.3 Forms that fail, and their tells

- **The strawman** — excludes something nobody proposed. Tell: no advocate exists.
- **The tautology** — excludes work that is off-strategy by definition. Tell: it would be
  equally true under any strategy this business could hold.
- **The impossibility** — excludes something the operator could not have done this period
  anyway. Tell: the forfeit is zero because the option never existed.
- **The deferral in disguise** — *not yet*, with nothing scheduled. Tell: the word *yet*,
  and no date anywhere near it. Either attach the reconsideration date or state it as an
  exclusion bounded by the period.
- **The unwritten one** — agreed in conversation, absent from the artifact. It does not
  bind anything and it will reappear as work inside a month.

### 4.4 Expiry, renewal, promotion

Every non-goal names the period it binds. At the end of that period it gets one of three
dispositions, recorded:

- **Renewed** — still forbidden, still wanted, and it says so for another period.
- **Released** — the policy changed, or the diagnosis resolved; it is ordinary work again.
- **Promoted** — a non-goal renewed through three consecutive periods is not a non-goal
  any more. It is part of the guiding policy. Move it there. Leaving it on the list
  understates how much the policy actually decides, and makes the list look busier than
  the strategy is.

A non-goal that gets none of the three simply stops being mentioned, and the work quietly
comes back without anyone choosing it. That is the failure this whole section exists to
prevent.

---

## 5. Solo operator — which layers collapse

The stack has five layers because it was drawn for an organization where different people
own different ones. With one operator, three of them are the same conversation, and
maintaining them separately is bookkeeping with no reader.
[frameworks.md](frameworks.md) §5 already covers which artifacts stop earning their keep
solo — including a stack document with an owner per layer. This section covers only what
happens to the layers themselves.

**Mission and company strategy collapse into a durable intent.** One paragraph: who this
is for, what it changes for them, where the advantage comes from, and what the operator is
not in the business of. It is rewritten rarely and it is not a document — a few lines
somewhere the operator will actually re-read.

**Product strategy does not collapse.** It is the layer that does the most work when there
is one person, and for the reason [frameworks.md](frameworks.md) §5 gives about the
missing second reader:
nobody else is going to notice that the operator has spent six weeks improving something
that was never in the way. The diagnosis is the only defense against that, and it costs an
afternoon.

**Roadmap and goals stay separate but shrink.** The sequence is the bets; the goals are the
kill criteria already attached to them ([bet-ledger.md](bet-ledger.md) §1). A goals layer
with its own document, cascade, and grading ritual is the first ceremony to cut.

**So the walk is three questions, not four:** Goals ← Roadmap, Roadmap ← Product strategy,
Product strategy ← durable intent. The same explanation questions from §3.2 apply, with
the last two pairs merged.

**The dominant solo break is at the policy.** Nothing is excluded, so everything the
operator finds interesting qualifies, and the symptom is a completely full week with a
flat metric. The repair is not more discipline in the sequence — it is a policy with an
exclusion in it and a non-goal with a real forfeit, where the advocate who loses is
usually the operator.

What stays mandatory at any size: a diagnosis with a mechanism, one exclusion in the
policy, and one non-goal that costs something. Everything else in this file scales down.

---

## The closing test

Before Stage 1 closes, three lines exist:

> **Diagnosis:** `<observation>` at `<locus>`, because `<mechanism>` — `<source>`, `<tier>`
> **Guiding policy:** `<the rule>`, which rules out `<the wanted thing it forbids>`
> **Layer:** `mission` | `company strategy` | `product strategy` | `roadmap` | `goals`

If the first line has no *because*, it is a symptom, not a diagnosis. If the second has
nothing after *which rules out*, it is an aspiration, not a policy. If the third is blank
or says *strategy*, the request has not been placed and §2.2 has not been run.
