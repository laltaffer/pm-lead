# Bet Ledger — Template

> Fields marked `[REQUIRED]` must be filled before this artifact passes its gate. An
> empty required field is a gate failure — checkable without judgment, by anyone
> (including a model that has not read anything else).

For what each field means, the evidence tiers, and the writing rules (one Assumption per
bet, write the kill before the test, name the owner by role), see
[`bet-ledger.md`](../bet-ledger.md). This file only prompts for content — it does not
re-teach the method.

Copy the block below once per bet. A ledger with one bet or twenty uses the same block.

---

## Bet block (copy this per bet)

### Bet: <name the bet>

- **Outcome** **[REQUIRED]**
  (The one metric this bet moves, its current baseline, and the target — not an
  activity.)

- **Assumption** **[REQUIRED]**
  (The single falsifiable claim this bet rests on — one claim, not two joined by "and.")

- **Evidence tier** **[REQUIRED]**
  (Tier `E1`–`E5` or `E0`, plus the named source. If more than one source feeds this bet,
  write the chain and mark the weakest link — see `bet-ledger.md` §2.)

- **Cheapest killing test** **[REQUIRED]**
  (The smallest thing that could invalidate the Assumption above — not the built
  feature.)

- **Kill criterion** **[REQUIRED]**
  (Must contain both an absolute date and a threshold — "next quarter" and "traction" both
  fail this field.)

- **Owner** **[REQUIRED]**
  (A role, not "the team.")

- **Type 1 / Type 2** **[REQUIRED]**
  (One-way door or two-way door — see `bet-ledger.md` §3.)

- **Type 2 revisit date** **[REQUIRED]**
  (Required for Type 2 bets; not applicable for Type 1 — write "N/A, Type 1" if this bet
  is Type 1.)

- **Confidence** **[optional]**
  (High / Medium / Low. Not a substitute for the Evidence tier above it.)

---

## Worked example

The block above filled in, so the shape is unambiguous. Invented for illustration —
replace entirely with a real bet.

### Bet: Automated tip-split replaces the end-of-shift spreadsheet

- **Outcome** **[REQUIRED]**
  Share of pilot shifts where the shift lead accepts the automated tip-split output
  without recalculating it by hand: baseline 0% (no pilot has run yet), target 60% of
  shifts by pilot close, feeding the North Star of monthly active shift-closes processed
  on the platform.

- **Assumption** **[REQUIRED]**
  Shift leads at independent restaurants will stop manually double-checking the tip-split
  calculation within two weeks of seeing it consistently match their own math.

- **Evidence tier** **[REQUIRED]**
  `E3` — 22 sourced complaints in a public restaurant-manager forum thread about time
  spent recalculating tip pools by hand every night (linked thread). *Trust in an
  automated version of this specific calculation is `E0` — no direct evidence yet, and
  it's the load-bearing link the test below has to attack.*

- **Cheapest killing test** **[REQUIRED]**
  Hand 5 pilot shift leads a static printout of what the automated split would have
  produced for the shift that just closed, next to their own spreadsheet total, for 5
  consecutive shifts. Ask after each shift whether they still recalculated by hand before
  trusting the number.

- **Kill criterion** **[REQUIRED]**
  If fewer than 3 of the 5 pilot shift leads have stopped recalculating by hand by
  2026-09-01, kill the automation bet and ship the export-to-spreadsheet feature only.

- **Owner** **[REQUIRED]**
  Head of Product.

- **Type 1 / Type 2** **[REQUIRED]**
  `Type 2` — a 5-shop paper pilot with no shipped code, reversible at zero cost.

- **Type 2 revisit date** **[REQUIRED]**
  2026-09-01.

- **Confidence** **[optional]**
  Medium.
