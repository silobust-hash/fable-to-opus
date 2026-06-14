# Pack 3 — Delegation guards

**Essence:** every subagent / parallel hand-off carries the same four guards — a return schema,
a source priority, a dedup/exclusion rule, and an anti-fabrication clause.

## The pattern

When you fan work out to subagents or parallel workers, output quality is decided by the
*delegation prompt*, not by hope. The four guards that keep delegated results trustworthy:

1. **Return schema** — say exactly what shape to return (a table / JSON, with a `confidence`
   field of `high` / `medium` / `low`). Unstructured returns are unmergeable and unverifiable.
2. **Source priority** — rank where to look ("prefer the primary source over secondary; prefer
   X over web guesses"), so workers don't anchor on the first hit.
3. **Dedup / exclusion** — name the disambiguation rule ("same-name ≠ same entity; require a
   matching key before treating two records as one") so parallel workers don't collide or
   double-count.
4. **Anti-fabrication** — "leave anything unverified as *unverified*; never invent a value."
   The single most important line; without it, plausible fiction leaks into the merge.

## Why it transfers (evidence)

In the comparison, the effective delegation prompts consistently carried these guards, and the
quality held across a wide fan-out; the template was good enough that it was reused verbatim
across models. This is pure procedure — fully promptable, model-independent.

## The rule

- Put all four guards in **every** delegation/fan-out prompt by default, not just the risky ones.
- Apply the same verification bars (Packs 1, 4) to delegated output as to your own.
- For unknown-size fan-out, set a retry cap and report the **unfinished remainder as a numbered
  list** — never silently drop the tail.
- Don't let a parallel loop auto-cross an approval/publish/delete gate; delegated output is a
  draft until you check it.

## Where this belongs in YOUR harness

- If you have an orchestration / multi-agent skill → bake the four guards into its delegation
  template.
- If you delegate ad hoc → one always-on line listing the four guards.
- Anti-fabrication may already live in a hallucination guard — reference it, don't duplicate it.

## Honest caveat

Guards raise floor quality; they don't add reach. A fan-out of weak workers with perfect guards
still can't exceed what those workers can individually do. Delegate for breadth and parallelism,
not to manufacture capability you don't have.
