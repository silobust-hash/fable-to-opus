---
name: fable-to-opus
description: Adapt-first advisor that helps any Claude model pick up Fable's effective work habits — render-level verification, hypothesis-driven debugging, delegation guards, input fidelity, confirm-before-irreversible, and execution rhythm. Use when the user says "fable-to-opus", "audit my harness", "adapt fable habits", "which of these do I already have" — or proactively before adopting a work-method rule, when building rendered artifacts (docs, slides, HTML, SVG, charts, UIs), debugging a non-obvious bug, delegating to subagents, or starting large/irreversible work. It audits the user's own CLAUDE.md / skills / hooks and proposes where each missing habit belongs; it does not paste rules over an existing harness.
---

# fable-to-opus — adapt, don't copy

> Principle: this skill does not dump six rules into your harness. It finds which of the six
> verified work-method patterns you already cover, which you're missing, and **where** the gaps
> belong in *your* setup — then proposes a changeset you approve. Blind adoption makes harnesses
> worse (see [packs/00-adapt-first.md](../../packs/00-adapt-first.md)).

The six patterns live in [`packs/`](../../packs/). Read the pack before recommending its rule.

## When to run the audit

- The user explicitly asks ("fable-to-opus", "audit my harness", "should I add X").
- Proactively, before borrowing any work-method rule from anywhere — check for duplication first.

## The audit procedure

1. **Read the user's own harness.** Open their `CLAUDE.md` (project and global) and `AGENTS.md`
   if present. List their installed skills/plugins and any hooks. This is the ground truth — never
   recommend without reading it first.
2. **Map each of the six patterns to a status:**
   - **Covered** — an existing rule/skill/hook already owns this concern → recommend *strengthening
     it*, not adding a duplicate.
   - **Missing** — genuine gap → candidate to add.
   - **N/A** — the user never produces this kind of work → skip.
3. **For each Missing pattern, decide placement** (see the table in pack 0):
   - always-on config (applies to every task) · a skill/guard (scoped to an output type) ·
     a hook (a hard deterministic stop) · a skill (a multi-step procedure).
4. **Propose a minimal changeset**, not a paste-over. Prefer folding a habit into an existing
   file over creating new top-level rules. State, honestly, which patterns you are *not* adding
   and why (already covered / N/A).
5. **Apply only on approval.** Show the diff. For anything outward-facing (committing to a repo,
   pushing), get explicit confirmation first.

## The six patterns (one line each — read the pack before recommending)

1. **Render verification** — view the rendered output before declaring it done; schema/lint/build
   passing ≠ visually correct. [pack 1](../../packs/01-render-verification.md)
2. **Investigation by hypotheses** — 2+ candidate causes, falsify each, keep the survivor.
   [pack 2](../../packs/02-investigation-hypotheses.md)
3. **Delegation guards** — return schema + source priority + dedup + anti-fabrication in every
   hand-off. [pack 3](../../packs/03-delegation-guards.md)
4. **Input fidelity** — re-extract fuzzy critical values at high fidelity. [pack 4](../../packs/04-input-fidelity.md)
5. **Confirm before irreversible** — confirm assumptions before large/irreversible work; scale to
   reversibility, not confidence. [pack 5](../../packs/05-irreversible-confirm.md)
6. **Rhythm & section-end briefing** — quiet burst then one consolidated briefing; never quiet over
   verification or risk. [pack 6](../../packs/06-rhythm-and-briefing.md)

## What to tell the user honestly

- Most tool-count differences between models were **role/phase confounds**, not model merit —
  don't chase them.
- A harness can't raise the model's ceiling; it makes it reach its own ceiling reliably.
- If a pattern is already covered, the best recommendation is **"do nothing — you already have it."**
  Restraint is a valid, often correct, output of this skill.
