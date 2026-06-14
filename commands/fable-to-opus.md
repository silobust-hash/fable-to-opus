---
description: Run the fable-to-opus adapt-first audit — read this harness's own CLAUDE.md / skills / hooks, map which of the six verified work-method patterns are already covered vs missing, and propose where the gaps belong. Adapt, don't paste-over.
---

Run the **fable-to-opus** adapt-first audit. The goal is NOT to paste six rules into the user's
harness — it is to find the gaps and place them correctly.

## Step 1 — Load the skill and the packs

Read `${CLAUDE_PLUGIN_ROOT}/skills/fable-to-opus/SKILL.md` and follow its audit procedure. Read a
pack from `${CLAUDE_PLUGIN_ROOT}/packs/` before recommending its rule.

## Step 2 — Audit this user's own harness (ground truth)

- Read their `CLAUDE.md` (project `./CLAUDE.md` and global `~/.claude/CLAUDE.md`) and `AGENTS.md` if present.
- List installed skills/plugins and any hooks.
- For each of the six patterns: mark **Covered** (already owned → strengthen, don't duplicate),
  **Missing** (gap → candidate), or **N/A** (user never does this work).

## Step 3 — Propose a minimal changeset

For each Missing pattern, name the placement (always-on config / a skill or guard / a hook) and
draft the smallest edit — preferring to fold into existing files. State which patterns you are
**not** adding and why. Show the diff. Apply only on approval; for anything outward-facing
(commit/push), confirm explicitly first.

## Optional — write the always-on pointer block

If the user wants the adapt-first reminder always on, offer:

```bash
bash ${CLAUDE_PLUGIN_ROOT}/setup/setup.sh local    # this project only (recommended)
bash ${CLAUDE_PLUGIN_ROOT}/setup/setup.sh global   # all projects
```

This injects a short pointer (not the full rules). There is no force-injecting hook by design.
