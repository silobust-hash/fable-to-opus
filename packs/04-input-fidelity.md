# Pack 4 — Input fidelity

**Essence:** critical numbers, dates, and identifiers that look fuzzy in a scan, OCR, or
screenshot get re-extracted at high fidelity before you build on them.

## The pattern

A shaky first read of a key value silently poisons everything downstream. If a figure that
*must* be right — an amount, a date, an account/case/id number — is fuzzy in the source (a
low-res scan, an image PDF, a compressed screenshot), the cheap move is to trust the first
glance. The reliable move is to **re-extract that specific value at higher fidelity** (re-render
the page at high DPI, zoom the region, pull the underlying text layer) before treating it as
fact.

## Why it transfers (evidence)

In the comparison, the careful runs distrusted their own first read of important figures and
re-pulled them at higher resolution — and caught real errors (a misread amount, a page-offset
mismatch) that would otherwise have propagated into the output. This is a promptable habit, and
it pairs with a checksum mindset: derived numbers get recomputed, not just transcribed.

## The rule

- For values that are costly if wrong (money, dates, ids, legal/medical figures): if the source
  is fuzzy, **re-extract at high fidelity** before trusting the first read.
- Re-confirm structural assumptions too (e.g. a page-number offset between a PDF index and the
  printed page) — misreads often come in pairs.
- Where a number is *derived*, recompute it and check it reconciles, rather than copying it.

## Where this belongs in YOUR harness

- If you have a document-ingestion / OCR / data-extraction skill → add a "fuzzy critical value →
  re-extract high-DPI" step to it, distinct from "ask the user to re-scan" (that's only for when
  the source itself is fundamentally too low-res).
- If you work with scans/screenshots ad hoc → one always-on line.

## Honest caveat

Reserve the extra pass for values that actually matter. Re-extracting every word of a clean
document is waste. The trigger is *fuzzy AND consequential*, not fuzzy alone.
