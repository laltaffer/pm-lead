# Integrations — optional companion wiring

**Nothing in this file is required. Every other file in this pack is correct and complete
with this file deleted.** `/pm-lead` runs standalone; a missing companion never blocks a
stage (`AGENTS.md`, stage 7) — it only removes a convenience. This file documents that
convenience for one operator's setup, and is the only file in the pack permitted to name a
specific tool, skill, or path.

## 1. HANDOFF → engineering pipeline (`/cto`)

Stage 7 packages the frame, approved bets, sequence, narrative, and measurement plan for
whoever builds the thing. *Optional:* where a `/cto`-style engineering pipeline is
installed, hand the package to it directly — its build stage should not need to re-ask
what to build or why. Without it, HANDOFF still names what must happen next and who owns
it; nothing else changes.

## 2. Evidence ladder → research skill (`/uxr`)

`bet-ledger.md` §2 carries a self-contained E1–E5/E0 evidence ladder so the pack works
with no research function installed. *Optional:* where a `/uxr`-style research skill is
present and owns its own canonical evidence ladder, **that ladder governs instead** — the
compact one in `bet-ledger.md` becomes a fallback, not a second standard to reconcile
against it. Route open evidence questions (stage 7, or any bet whose tier is `E0`/`E5`) to
that skill and wait for the answer rather than filling it in.

## 3. Product truth → marketing skill (`/cmo`)

This pipeline supplies product truth — competitive alternatives, the job being hired for,
the target segment — and stops there; it does not write positioning or launch copy.
*Optional:* where a `/cmo`-style marketing skill is present, hand it that truth at stage 7
and let the craft live there.

## 4. Persisting artifacts to project memory

*Optional:* where the environment keeps a durable per-project memory file (e.g.
`_brain.md`), append each stage's artifact there as it is approved, rather than leaving
the record only in conversation. If that file or a sibling doc carries a marker such as
**LOCAL-ONLY** — meaning the project's content must never be pushed, published, or sent to
an external service — honor it for every artifact this pipeline produces: keep the frame,
bets, narrative, and measurement plan wherever the marker requires, and never publish them
externally on the operator's behalf.
