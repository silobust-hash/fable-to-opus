# Pack 1 — Render verification

**Essence:** anything a human looks at is "done" only after you view the **rendered** result.
Passing code-level checks is integrity, not visual correctness.

## The pattern

Outputs that get *rendered* — documents (DOCX/PDF/slides), HTML/SVG, charts, diagrams,
generated images, UIs — can pass every code-level check and still be broken on screen:
overlapping text, clipped cells, collapsed spacing, a chart with an unreadable legend, a
layout that breaks at the page boundary. Schema validation, ZIP integrity, a linter, a green
build — these confirm the file isn't *corrupt*. They say nothing about how it *looks*.

The reliable completion gate is to **open the rendered artifact and look at it** (or screenshot
it), not to trust that "all checks passed."

## Why it transfers (evidence)

This is the headline finding of the comparison, and the most robust one (it held even when the
two models worked the *same* defect, so it isn't a role/phase confound). One model declared a
document done because it passed schema + integrity validation — and was wrong; the overlap was
only visible on screen. The other resolved it by actually rendering and viewing the output. The
gap was not *how much* verification (the code-level checks were plentiful) but *what was being
verified*: the file vs. the picture.

## The rule

- ⛔ Do **not** declare a rendered artifact "done / final" on the strength of schema, ZIP,
  lint, type-check, or build success alone.
- ✅ Open it in the real viewer (or render to an image and read it) and inspect the failure-prone
  regions: overlap, clipping, page breaks, spacing, legibility, alignment.
- ⛔ Do **not** outsource the look-check to the user ("open it and it should be fine"). Their
  glance is reassurance, not verification.
- If you're headless / have no viewer, render to an image and read it; if even that's impossible,
  ship it tagged **"visual render unverified"** — never silently as done.
- When a render defect appears, don't lock onto the first cause — see Pack 2.

## Where this belongs in YOUR harness

- If you produce rendered artifacts often → add a **completion-gate** line to the skill/guard
  that owns document/figure/UI output ("view the render before reporting done").
- If you want it everywhere → one always-on line in `CLAUDE.md`.
- If you have hooks → a stop on "final/ship/publish" for render-class outputs that requires a
  recorded visual check is the strongest form.

## Honest caveat

Scope it to **layout-bearing** outputs. Pure plain-text output rarely needs a render pass, and
forcing a heavyweight viewer step on trivial text wastes effort. The point is to match the check
to the artifact's final consumed form.
