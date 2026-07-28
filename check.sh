#!/usr/bin/env bash
# check.sh — self-validation for the pm-lead skill pack.
# Encodes the Definition of Done from docs/specs/2026-07-22-pm-lead-design.md §13.
set -uo pipefail
cd "$(dirname "$0")"
fail=0
ok(){  printf '  ok   %s\n' "$1"; }
bad(){ printf '  FAIL %s\n' "$1"; fail=1; }

CORE="SKILL.md AGENTS.md README.md INTEGRATIONS.md mode-gate.md bet-ledger.md \
frameworks.md narratives.md metrics.md altitude.md strategy.md gate-checks.md"
TEMPLATES="templates/pr-faq.md templates/prd-one-pager.md templates/bet-ledger.md \
templates/six-pager.md templates/opportunity-assessment.md templates/measurement-plan.md"
# Files that must never mention personal wiring (README may name platforms, not people).
CLEAN="SKILL.md AGENTS.md README.md mode-gate.md bet-ledger.md frameworks.md \
metrics.md narratives.md altitude.md strategy.md gate-checks.md $TEMPLATES"

echo "== files exist and are non-empty =="
for f in $CORE $TEMPLATES LICENSE; do
  [ -s "$f" ] && ok "$f" || bad "$f missing or empty"
done

echo "== SKILL.md frontmatter =="
[ -s SKILL.md ] && head -1 SKILL.md | grep -q '^---$' && ok "frontmatter opens" || bad "no YAML frontmatter"
grep -q '^name: pm-lead$' SKILL.md 2>/dev/null && ok "name" || bad "missing 'name: pm-lead'"
grep -q '^description: ' SKILL.md 2>/dev/null && ok "description" || bad "missing description"

echo "== four modes declared in SKILL.md =="
# Structural, not substring: each mode must be a bolded list item, matching
# the sibling convention "- **full** — ...". A bare substring grep would pass
# on incidental prose and could never fail.
for m in zero-to-one iterate strategy audit; do
  grep -qE "^[-*][[:space:]]+\*\*${m}\*\*" SKILL.md 2>/dev/null \
    && ok "mode $m" || bad "SKILL.md must declare mode as '- **${m}** — ...'"
done

echo "== nine stages declared in SKILL.md =="
# Each stage must be a numbered heading: "### 3. BETS — ..."
for s in MODE FRAME OPPORTUNITY BETS SEQUENCE NARRATIVE MEASURE HANDOFF RETRO; do
  grep -qE "^#+[[:space:]]+[0-9]+\.[[:space:]]+${s}\b" SKILL.md 2>/dev/null \
    && ok "stage $s" || bad "SKILL.md must declare stage as '### N. ${s} — ...'"
done

echo "== bet ledger: five required fields =="
for f in Outcome Assumption "Evidence tier" "killing test" "Kill criterion"; do
  grep -qi -- "$f" bet-ledger.md 2>/dev/null && ok "field: $f" || bad "bet-ledger.md missing: $f"
done

echo "== bet ledger: evidence tiers E0-E5 self-contained =="
for t in E0 E1 E2 E3 E4 E5; do
  grep -q -- "$t" bet-ledger.md 2>/dev/null && ok "tier $t" || bad "bet-ledger.md missing tier $t"
done

echo "== gate-checks.md covers gating stages 0-7 =="
for s in 0 1 2 3 4 5 6 7; do
  grep -qE "^#+[[:space:]]*Stage $s\b" gate-checks.md 2>/dev/null \
    && ok "Stage $s" || bad "gate-checks.md missing '## Stage $s' heading"
done

echo "== gate-checks.md heads a mode-path block per stage-subset mode =="
# Structural, not substring: `zero-to-one` and `iterate` are gated by the Stage 0-7
# blocks asserted above, but `strategy` and `audit` run stage subsets and each owns a
# block after Stage 7. Assert the heading, not the word — a bare `grep -q strategy`
# could never fail, which is the technique this file disclaims at the four-modes check.
for m in strategy audit; do
  grep -qE "^#+[[:space:]]+Mode path .*${m}" gate-checks.md 2>/dev/null \
    && ok "mode path $m" || bad "gate-checks.md must head a block '## Mode path — \`$m\` ...'"
done

echo "== templates mark required fields =="
# Literal [REQUIRED] marker, not the loose word "required" — the marker is the
# convention gate-checks.md asserts against.
for t in $TEMPLATES; do
  grep -q '\[REQUIRED\]' "$t" 2>/dev/null \
    && ok "$t" || bad "$t has no [REQUIRED] field markers"
done

echo "== portability: no personal wiring outside INTEGRATIONS.md =="
LEAK='SecondBrain|_brain\.md|Lawrence|/cto|/uxr|/cmo'
for f in $CLEAN; do
  [ -e "$f" ] || continue
  if grep -nEq -- "$LEAK" "$f"; then
    bad "$f references personal wiring"
    grep -nE -- "$LEAK" "$f" | sed 's/^/       /'
  else ok "$f clean"; fi
done

echo "== operator overlay stays private =="
# LOCAL.md is optional. If it exists it must be gitignored and untracked, and the
# pack must still be complete without it — SKILL.md may only reference it as optional.
if [ -e LOCAL.md ]; then
  git check-ignore -q LOCAL.md 2>/dev/null \
    && ok "LOCAL.md is gitignored" || bad "LOCAL.md exists but is NOT gitignored"
  if git ls-files --error-unmatch LOCAL.md >/dev/null 2>&1; then
    bad "LOCAL.md is tracked by git — it must never be published"
  else ok "LOCAL.md untracked"; fi
else
  ok "no LOCAL.md (optional)"
fi
grep -q 'If a `LOCAL.md` sits beside this file' SKILL.md 2>/dev/null \
  && ok "SKILL.md documents the overlay as optional" \
  || bad "SKILL.md does not describe LOCAL.md as an optional overlay"

echo "== AGENTS.md is platform-neutral =="
if [ -e AGENTS.md ] && grep -nEq -- 'Claude Code|claude\.ai|~/\.claude' AGENTS.md; then
  bad "AGENTS.md contains platform-specific references"
else ok "AGENTS.md neutral"; fi

echo "== LICENSE is MIT =="
grep -q 'MIT License' LICENSE 2>/dev/null && ok "MIT" || bad "LICENSE is not MIT"

echo
[ $fail -eq 0 ] && echo "ALL CHECKS PASS" || echo "CHECKS FAILED"
exit $fail
