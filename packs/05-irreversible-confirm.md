# Pack 5 — Confirm before irreversible

**Essence:** before large or irreversible work, confirm the key assumptions first.

## The pattern

Decisiveness is a virtue right up until it isn't. Starting a big operation on an unstated
assumption is how you generate a lot of confidently-wrong output. Before work that is **costly
or hard to undo** — mass file generation, a multi-agent fan-out, bulk edits across many targets,
anything destructive (delete, overwrite, publish, push) — surface the assumptions you're about
to bake in and confirm them.

## Why it transfers (evidence)

This one comes with a caution flag. In the comparison, "just start, don't ask" looked efficient
— but that behavior was **confounded with role**: the model that asked less was handed the
already-decided execution phases, while the model that confirmed more was handed the open design
phases. So *don't* read "ask less" as a model virtue. The transferable lesson is the inverse and
safer one: scale your confirmation to *reversibility*, not to apparent confidence.

## The rule

- Before a large irreversible operation, state the key assumption(s) and the scope, and confirm
  — ideally as a short, bounded question (a few options), not an open-ended one.
- Don't apply this to cheap, reversible, already-specified work — confirmation theater is its own
  waste. The trigger is **irreversible OR large**, not "every step."
- Outward-facing or destructive actions (publish, send, delete, push) always get a confirm,
  regardless of size.

## Where this belongs in YOUR harness

- The hard stops (publish / send / delete / push) belong in a **hook** if you can — deterministic
  beats discretionary.
- The judgment version ("confirm assumptions before mass/irreversible work") belongs as one
  always-on line, or in the skill that launches fan-outs.

## Honest caveat

The risk is over-confirming and becoming annoying on safe, reversible tasks. Calibrate: reversible
+ small = just do it and report; irreversible OR large = confirm first.
