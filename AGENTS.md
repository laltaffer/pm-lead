# PM Lead — Agent Entry Point

`pm-lead` is a gated product-leadership pipeline: mode → frame → opportunity → bets →
sequence → narrative → measure → handoff → retro. Nothing earns build capacity without a
named assumption, an evidence tier, and a dated kill criterion. "The operator" means the
human driving the pipeline — every gate below is theirs to pass or hold. This pipeline's
job ends at the decision of what gets built and why; the building, the evidencing, and the
launch craft each belong to a different function (see Boundaries below).

This file is the platform-neutral entry point. `SKILL.md` in this directory carries the
identical pipeline for platforms that load skill frontmatter; either file is a valid
starting point, and both route to the same reference files below.

## First action: name the mode

Before any other step, state which of these four modes governs the work and let the
operator confirm or override it with one word:

- **zero-to-one** — new product or bet with no validated demand.
- **iterate** — existing product with demand evidenced by a named signal.
- **strategy** — product strategy itself, no specific feature in scope; also the path for
  debugging a stalled or failing strategy.
- **audit** — assess existing product work (a roadmap, a PRD, a live strategy) against the
  anti-theater refusals.

The mode decides which stages run. Do not run a stage the declared mode does not own:

- `zero-to-one`, `iterate` — all nine stages.
- `strategy` — stages 0, 1, 4, 8 only: a diagnosis, a guiding policy, published non-goals,
  and a sequenced set of strategic bets. It scopes nothing specific to build, so
  OPPORTUNITY, BETS, NARRATIVE, MEASURE, and HANDOFF do not run. Method in
  [strategy.md](strategy.md).
- `audit` — stage 0, then [bet-ledger.md](bet-ledger.md) §5's refusals and the
  [gate-checks.md](gate-checks.md) gates for whichever stages the existing work claims to
  have passed, applied to that work. Output is a findings list, not new artifacts; each
  finding is fixed or explicitly deferred with a reason, and nothing beyond the findings
  is rewritten without asking.

Run the gate test in [mode-gate.md](mode-gate.md) to decide `zero-to-one` vs `iterate` on
evidence, not preference — ask for the signal, its source, and its tier. Unknown resolves
to `zero-to-one`. **The pipeline does not proceed past this point until the mode is named
in writing.**

Orthogonal to all four modes: naming an altitude (`staff`, `director`, `vp`, `cpo`)
switches on organizational artifacts — see [altitude.md](altitude.md). Solo is the
default.

## The nine stages

Read the reference file that owns a stage before running it. **Read
[gate-checks.md](gate-checks.md) before declaring any stage complete** — it states each
gate as a pass/fail assertion, not a quality bar to intuit.

| # | Stage | Reference | Artifact | Gate |
|---|---|---|---|---|
| 0 | MODE | [mode-gate.md](mode-gate.md) | declared mode + what that mode's gate requires: demand evidence (signal, tier, source, segment) for `zero-to-one` and `iterate`; the symptom with its window and tier for `strategy`; the artifact under review for `audit` | mode named in writing; pipeline halts until then |
| 1 | FRAME | [strategy.md](strategy.md) §1–§2, [bet-ledger.md](bet-ledger.md) §3, [altitude.md](altitude.md) | one-page frame: diagnosis, strategy-stack layer, Type 1/2 classification, altitude | operator approves the diagnosis |
| 2 | OPPORTUNITY | [frameworks.md](frameworks.md) | [templates/opportunity-assessment.md](templates/opportunity-assessment.md) | explicit pursue/kill; "park it" counts as a kill with a revisit date |
| 3 | BETS | [bet-ledger.md](bet-ledger.md) | [templates/bet-ledger.md](templates/bet-ledger.md) | operator approves the riskiest assumption and its cheapest killing test; an empty required field fails the gate |
| 4 | SEQUENCE | [frameworks.md](frameworks.md), [strategy.md](strategy.md) §4 for non-goals craft | Now/Next/Later with an appetite per bet + published non-goals | operator approves the sequence *and* the non-goals |
| 5 | NARRATIVE | [narratives.md](narratives.md) | [templates/pr-faq.md](templates/pr-faq.md), [templates/prd-one-pager.md](templates/prd-one-pager.md), or [templates/six-pager.md](templates/six-pager.md) | survives a silent-read review by a reader who disagrees |
| 6 | MEASURE | [metrics.md](metrics.md) | [templates/measurement-plan.md](templates/measurement-plan.md) | every bet in the sequence has a metric and a dated kill criterion |
| 7 | HANDOFF | — (see below) | handoff package: frame, approved bets with evidence tiers, sequence + non-goals, narrative, measurement plan, open questions each with a named owner | the receiving function can start without re-litigating product questions |
| 8 | RETRO | — | short retro note appended beside the bet ledger | none — optional, skip freely |

Stage 7 hands off to three adjacent functions, named generically here: an engineering
function to build, a research function to answer open evidence questions from real
people, and a marketing function for positioning and launch copy. If an environment has no
companion for one of those, the stage is not blocked — state what must happen next and who
owns it, and move on. Where this environment has a named companion for any of the three,
or a place to persist artifacts, see [INTEGRATIONS.md](INTEGRATIONS.md) — it is entirely
optional and this pipeline is complete without it.

## Rules (route, don't relearn)

- **Gates are stops.** No stage advances past its gate on this file's authority alone;
  what a stop requires is stated in full in `SKILL.md`'s Rules section.
- **Anti-theater refusals** — all eight, each with its trigger — are in
  [bet-ledger.md](bet-ledger.md) §5. Non-negotiable, not preferences.
- **Boundaries, scope, and thresholds.** What this pipeline does and doesn't do, its
  minimum-scope discipline, and how to treat numeric benchmarks are each stated once, in
  `SKILL.md`'s Rules section. Read them there rather than re-deriving them here.

## Reference files

- [mode-gate.md](mode-gate.md) — stage 0's gate test and the two modes side by side.
- [strategy.md](strategy.md) — stage 1's kernel and strategy stack, `strategy` mode's
  bottom-up walk, and non-goals craft.
- [bet-ledger.md](bet-ledger.md) — stage 3's ledger, the evidence ladder, Type 1/2
  decisions, the anti-theater refusals.
- [frameworks.md](frameworks.md) — stage 2 and 4's method selection.
- [narratives.md](narratives.md) — stage 5's document forms.
- [metrics.md](metrics.md) — stage 6's North Star and instrumentation plan.
- [altitude.md](altitude.md) — the team-lens artifacts and competency reference.
- [gate-checks.md](gate-checks.md) — pass/fail criteria for stages 0–7, plus the two
  mode-path blocks after them that gate `strategy` and `audit`, which run stage subsets.
- [INTEGRATIONS.md](INTEGRATIONS.md) — optional companion wiring; not required.
