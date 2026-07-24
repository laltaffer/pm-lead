# pm-lead

`pm-lead` is a skill pack that runs product-leadership work — strategy, discovery,
prioritization, roadmaps, PRD scoping — through a gated pipeline instead of a free-form
chat. Nine stages (mode → frame → opportunity → bets → sequence → narrative → measure →
handoff → retro), each with a named artifact and, for all but the optional last stage, a
pass/fail gate — so nothing consumes build capacity on an unnamed assumption.

## The two ideas that define it

**The mode gate.** The pipeline refuses to proceed until the operator names whether this
is `zero-to-one` work (no validated demand yet) or `iterate` work (an existing product
with a named demand signal). These are not two styles of the same discipline — they have
incompatible artifacts, incompatible evidence bars, and incompatible definitions of done.
An assumption stack and a RAT queue are the wrong output for a product with 40,000 weekly
sessions; an opportunity solution tree rooted in a North Star metric is the wrong output
for a product with no users to measure. Unknown demand resolves to `zero-to-one` — the
pipeline never infers a mode from tone or picks one to be helpful. Full test in
[mode-gate.md](mode-gate.md).

**The Bet Ledger.** Nothing gets built because it's a good idea — it gets built because
it's a *bet*, and a bet has five required fields: an **Outcome** (a metric, not an
activity), a falsifiable **Assumption**, an **Evidence tier** (`E1`–`E5`/`E0`, weakest
link governs), a **cheapest killing test**, and a **Kill criterion** with an absolute
date. An empty field fails the gate — that's checkable by anyone, including a model that
hasn't read anything else. The governing line: *"If you can't name what would kill this
bet and by when, it isn't a bet — it's a wish."* Full spec in [bet-ledger.md](bet-ledger.md).

## The four modes, and the team lens

- **zero-to-one** — new product or bet with no validated demand. Idea-maze walk, the four
  big risks, a ranked assumption stack, a RAT plan, a PR/FAQ, and a PMF measurement plan
  written before launch.
- **iterate** — existing product with demand evidenced by a named signal. North Star and
  input-metric tree, opportunity solution tree, sequenced bets, Now/Next/Later,
  instrumentation plan.
- **strategy** — product strategy itself, no specific feature in scope. Rumelt's kernel
  (diagnosis → guiding policy → coherent action); also the path for debugging a stalled
  strategy by reading the strategy stack bottom-up.
- **audit** — assess existing product work (a roadmap, a PRD, a live strategy) against the
  pack's eight anti-theater refusals.

The mode decides which stages run, not just the tone. `zero-to-one` and `iterate` run all
nine. `strategy` runs stages 0, 1, 4, and 8 — it produces a diagnosis, a guiding policy,
published non-goals, and sequenced strategic bets, and scopes nothing specific to build.
`audit` runs stage 0 and then applies the gates for whichever stages the reviewed work
claims to have passed, producing a findings list rather than new artifacts. Both subsets
have their own gate block in [gate-checks.md](gate-checks.md).

Orthogonal to all four: naming an altitude (`staff`, `director`, `vp`, `cpo`) switches on
organizational artifacts — stakeholder alignment, an exec narrative in six-pager form, org
sequencing, coaching instruments. Solo is the default; the competencies don't change with
altitude, but the medium and failure mode do. Detail in [altitude.md](altitude.md).

## Install

**Claude Code** — clone into `~/.claude/skills/pm-lead/`. It loads as a skill from
`SKILL.md`'s frontmatter.

**Codex** — clone anywhere and point the agent at [AGENTS.md](AGENTS.md), the
platform-neutral entry point.

**Generic agents** — read [AGENTS.md](AGENTS.md) first, then load the reference file that
owns each stage on demand as the pipeline reaches it (see the file map below). Nothing
here requires a specific runtime, plugin, or tool-calling API — it's markdown, read in the
order the pipeline names.

## File map

| File | What it's for |
|---|---|
| [SKILL.md](SKILL.md) | The pipeline, in skill-frontmatter form, for platforms that load it that way. |
| [AGENTS.md](AGENTS.md) | The same pipeline, platform-neutral, for any agent that reads a plain entry-point file. |
| [mode-gate.md](mode-gate.md) | Stage 0's gate test: `zero-to-one` vs `iterate`, the qualifying signals, and the transition between them. |
| [strategy.md](strategy.md) | Stage 1's kernel and the five-layer strategy stack, `strategy` mode's bottom-up walk for finding which layer actually broke, and how to write a non-goal that costs something. |
| [bet-ledger.md](bet-ledger.md) | Stage 3's ledger, the evidence ladder, Type 1/Type 2 decision classification, and the eight anti-theater refusals. |
| [frameworks.md](frameworks.md) | Method routing for stage 2 (opportunity) and stage 4 (sequencing) — which tool for which decision, not the tool's full depth. |
| [narratives.md](narratives.md) | Stage 5's document forms — PR/FAQ, PRD one-pager, six-pager — and why prose over bullets. |
| [metrics.md](metrics.md) | Stage 6's North Star, input-metric tree, guardrails, and instrumentation planning. |
| [altitude.md](altitude.md) | The team-lens artifacts and competency reference across solo/staff/director/VP/CPO. |
| [gate-checks.md](gate-checks.md) | Pass/fail assertions for every stage gate — read before declaring any stage complete. |
| [INTEGRATIONS.md](INTEGRATIONS.md) | Optional wiring to companion engineering, research, and marketing tooling. Entirely optional; the pipeline is complete without it. |
| `templates/` | Fillable templates for each stage artifact — opportunity assessment, bet ledger, PR/FAQ, PRD one-pager, six-pager, measurement plan. Each marks its `[REQUIRED]` fields. |
| [check.sh](check.sh) | Self-validation script for this repo — structural checks, not a runtime dependency of the pipeline itself. |
| [LICENSE](LICENSE) | MIT. |

## What this is not

- It does not build. Implementation belongs to whatever engineering pipeline or agent you
  already use — this pack hands off a product definition, not code.
- It does not generate user research. It consumes evidence you already have and routes
  open evidence questions to whatever research function you have; it does not manufacture
  findings about real people.
- It does not write marketing copy or positioning. It supplies product truth — competitive
  alternatives, the job being hired for, the target segment — and stops there.
- It is not a project tracker. No standups, no burndowns, no velocity, no status
  reporting.

If you have adjacent tooling for any of these, [INTEGRATIONS.md](INTEGRATIONS.md)
describes how to wire it in generically. Nothing in that file is required.

## License

MIT. See [LICENSE](LICENSE).

## Sources and credits

The pipeline routes to established product-management frameworks rather than inventing
new ones. It draws on:

- **Marty Cagan** (SVPG) — the four big risks, the opportunity assessment, and the
  discovery/optimization split that the mode gate is built on. [svpg.com](https://svpg.com)
- **Teresa Torres** — the opportunity solution tree and continuous discovery.
  [producttalk.org](https://producttalk.org)
- **Richard Rumelt** — the strategy kernel (diagnosis → guiding policy → coherent action),
  from *Good Strategy/Bad Strategy* (2011).
- **Colin Bryar & Bill Carr** — the PR/FAQ and working-backwards practice, from *Working
  Backwards* (2021). [workingbackwards.com](https://workingbackwards.com/resources/working-backwards-pr-faq/)
- **Ron Kohavi** (with Diane Tang & Ya Xu) — controlled-experiment methodology and the
  reported base rates for experiment win/flat/loss, from *Trustworthy Online Controlled
  Experiments* (2020). [exp-platform.com](https://exp-platform.com)
- **Gary Klein** — the pre-mortem, from *Performing a Project Premortem* (Harvard Business
  Review, 2007).
- **Ravi Mehta** — the product strategy stack, and the four top-level competency categories
  the altitude file's groupings follow.
  [reforge.com](https://reforge.com/blog/the-product-strategy-stack) ·
  [blog.ravi-mehta.com](https://blog.ravi-mehta.com/p/product-competency-toolkit)
- **Shreyas Doshi** — the LNO framework and the impact/execution/optics distinction.
  [lennysnewsletter.com](https://www.lennysnewsletter.com/p/episode-3-shreyas-doshi)
- **Janna Bastow** — the Now/Next/Later roadmap form. [prodpad.com](https://www.prodpad.com)
- **Ryan Singer** (Basecamp) — appetite-bounded scope and Shape Up.
  [basecamp.com/shapeup](https://basecamp.com/shapeup)

Each framework is also cited at the point the pipeline uses it, inside the reference file
that owns that stage.
