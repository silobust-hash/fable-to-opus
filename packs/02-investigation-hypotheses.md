# Pack 2 — Investigation by hypotheses

**Essence:** don't lock onto the first root cause. Form 2+ hypotheses, falsify each with
evidence, keep the survivor.

## The pattern

When something is wrong and the cause isn't obvious, the cheap move is to seize the first
plausible explanation and "fix" it. If that intuition is wrong, you ship a non-fix and call it
done. The durable move is to name **two or more** candidate causes up front, then knock each one
down with a concrete check until one survives.

## Why it transfers (evidence)

In the comparison, single-cause certainty correlated with unresolved bugs: a first-intuition
root cause was declared and the work stopped, with no falsification cycle. The resolving runs
externalized a short hypothesis chain — *candidate A → ruled out by data → candidate B →
confirmed* — and fixed the issue in one pass. Notably, more internal reasoning did **not** by
itself produce this; what mattered was the *explicit* falsification loop, which is promptable.

## The rule

- Before editing, state the hypotheses out loud: "Cause could be X or Y. Test for X = ___,
  test for Y = ___."
- Falsify each with a concrete observation, not a feeling. Eliminate, don't accumulate.
- Keep the survivor as the cause; only then fix. If none survive, widen the hypothesis set.
- One blocked diagnostic path is not a dead end — try an alternate probe before concluding.

## Where this belongs in YOUR harness

- If you have a debugging / root-cause skill → make "≥2 hypotheses, falsify each" its first step.
- If not → one always-on line: "For non-obvious bugs, name 2+ causes and rule each out by
  evidence before concluding."
- This pairs with Pack 1: render defects especially invite first-guess certainty.

## Honest caveat

Don't ritualize it on trivial, obvious bugs — a one-line typo doesn't need a hypothesis tree.
Reserve the discipline for cases where the cause is genuinely unclear, or where being wrong is
expensive.
