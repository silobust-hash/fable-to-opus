# Pack 0 — Adapt first (read before all others)

**Essence:** the patterns in this repo are *candidates*, not commandments. Audit your own
harness, then add only what's missing, where it belongs.

## Why this pack comes first

The failure mode of any "best practices" list is blind adoption. If you paste six patterns
into a `CLAUDE.md` that already has fifty instructions, you don't get six improvements — you
get attention dilution, duplicate rules that contradict each other, and a harness nobody can
reason about. More rules is not more reliability.

The patterns here only help when they land in a *gap* — a habit your setup doesn't already
enforce — and in the *right layer*.

## The audit (do this before adopting any pattern)

For each candidate pattern (1–6), ask:

1. **Already covered?** Search your `CLAUDE.md` / `AGENTS.md` / skills for this concern.
   If a rule or skill already owns it, **strengthen that** — do not add a second, competing copy.
2. **Right layer?** Decide where it belongs:
   - **Always-on config** (`CLAUDE.md`) — for habits that must apply to *every* task.
   - **A skill or guard file** — for habits scoped to a kind of output or domain.
   - **A hook** — for a hard stop that must fire deterministically (a prose rule is weaker).
3. **Net new value?** If adopting it changes no actual behavior you're missing, skip it.
   Silent restraint beats rule bloat.

## How to place each layer

| If the habit… | Put it… |
|---|---|
| must apply to all work, all the time | always-on config (CLAUDE.md), one tight line |
| only matters for a kind of artifact (rendered docs, code, data) | the skill/guard that produces that artifact |
| is a non-negotiable stop (publish, delete, push, mass-write) | a hook, so it blocks rather than reminds |
| is a multi-step procedure | a skill the model invokes, not a wall of prose |

## The lived example

When this playbook was first adopted into an existing, mature harness, the audit found that
**four of the six patterns were already covered** by existing rules and skills. Only **two**
were genuine gaps — so only those two were added, each folded into the existing structure
rather than dumped into top-level config. That restraint *is* the method. Copying all six
would have made that harness worse.

## Where this belongs in YOUR harness

This pack is the meta-rule. If you keep one always-on line from this whole repo, make it this:

> Before borrowing a work-method rule from anywhere, check whether my own CLAUDE.md / skills /
> hooks already cover it. Add only the gap, in the right layer. Don't duplicate; don't bloat.
