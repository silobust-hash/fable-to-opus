# fable-to-opus

> **miss you, fable 🤍**

A small, honest playbook for getting Opus (or any current Claude model) to pick up
the **work habits** that made Fable feel so effective — verification, completion,
and investigation as *procedure*.

It is **not** a magic switch, and it is **not** a force-install. Its whole point is the
opposite: it helps you **adapt** a handful of verified habits into **your own** setup.

[Korean / 한국어 → README.ko.md](./README.ko.md)

---

## ⚠️ Read this first — adapt, don't copy

This repo is a **reference playbook plus an audit skill**, not a drop-in rulebook.

If you paste all of it into your `CLAUDE.md`, you will probably make things *worse*:
instructions compete for attention, duplicate what you already have, and bloat your
harness. The single most important rule here is:

> **Analyze your own harness first. Add only what's missing, where it belongs.**

Before adopting any pattern below, check **your existing setup**:

- **Your `CLAUDE.md` / `AGENTS.md`** — is this habit already encoded? Don't duplicate it.
- **Your skills & plugins** — does a skill already own this concern? Strengthen it instead of adding a competing rule.
- **Your hooks** — is there already deterministic enforcement? A prose rule is weaker than a hook that already fires.
- **Placement** — a habit that must apply to *every* task belongs in always-on config; a
  domain-output rule belongs in the relevant skill/guard; a hard stop belongs in a hook.

The `/fable-to-opus` skill in this repo does exactly this audit **for you**: it reads your
CLAUDE.md, lists your skills, and proposes *where* each missing habit should go in *your*
harness — instead of dumping rules on top of it. That's the intended way to use this.

> This mirrors how the playbook itself was first adopted: of the six patterns, only the
> two genuinely-missing ones were ported into the author's existing harness — the rest were
> already covered, so adding them would have been noise.

---

## Why this exists

Fable, in side-by-side work on the same project, felt like it *finished* things — it kept
a tight execution rhythm, drove multi-step edits to the end, and reported in clean
section-end summaries. When Fable became unavailable and the work moved to Opus, the
question was simple: **which of those habits are actually portable by prompt, and which
were never about the model at all?**

So the two models' transcripts on the *same* project were parsed and compared (see
[docs/ANALYSIS.md](./docs/ANALYSIS.md)). The result is sobering and useful: **some habits
transfer cleanly, several apparent differences were just role/phase confounds, and a few
are model-internal and can't be prompted at all.** This repo ships only the part that
actually transfers — and says so honestly.

A harness cannot raise a model's ceiling. It can make the model reach its *own* ceiling
more reliably, by turning verification and completion into procedure. When the ceiling
itself is the blocker, no prompt fixes it.

---

## The six portable patterns (verified)

Each lives as a short pack in [`packs/`](./packs/). Apply the smallest one that fits the task.

| # | Pattern | One line |
|---|---------|----------|
| 0 | [Adapt-first](./packs/00-adapt-first.md) | Audit your own harness; add only what's missing, where it belongs. **Read before all others.** |
| 1 | [Render verification](./packs/01-render-verification.md) | Things humans look at (docs, slides, HTML, SVG, charts, UIs) are "done" only after you **view the rendered result** — schema/lint/build passing is integrity, not visual correctness. |
| 2 | [Investigation by hypotheses](./packs/02-investigation-hypotheses.md) | Don't lock onto the first root cause. Form 2+ hypotheses, falsify each with evidence, keep the survivor. |
| 3 | [Delegation guards](./packs/03-delegation-guards.md) | Every subagent/parallel hand-off carries a return schema, source priority, a dedup/exclusion rule, and an anti-fabrication clause. |
| 4 | [Input fidelity](./packs/04-input-fidelity.md) | Critical numbers/dates/ids from scans, OCR, or screenshots that look fuzzy get **re-extracted at high fidelity** before you build on them. |
| 5 | [Confirm before irreversible](./packs/05-irreversible-confirm.md) | Before large or irreversible work (mass generation, fan-out, bulk edits, destructive ops), confirm the key assumptions first. |
| 6 | [Rhythm & section-end briefing](./packs/06-rhythm-and-briefing.md) | Run obvious multi-step edits in one quiet burst, then give **one** consolidated briefing — without suppressing verification transparency. |

---

## What does NOT transfer (honest limits)

This is half the value of the analysis. Do not chase these:

- **Tool-count "productivity."** "It made more edits / spawned more subagents" was mostly a
  **role/phase confound** — the models were given different stretches of the same project.
  Reading raw tool counts as model merit is a mistake.
- **"Just start faster, ask less."** Skipping confirmation looked decisive, but it was tied
  to *which phase* a model was handed. Pushed onto irreversible work, it produces wrong
  output at scale. See pattern 5.
- **"Think more."** Internal reasoning frequency is a model-side trait, not something a
  prompt reliably moves — and more of it did not prevent self-reversal in the data.
- **The model's ceiling.** Open-ended creative depth and self-driven discovery are capability,
  not procedure. A harness routes around overhead; it does not add skill.

---

## How it was derived (evidence)

- **Source:** two full project transcripts (~31MB) where Fable and Opus split the *same* work
  — a natural A/B on comparable sub-tasks.
- **Method:** quantitative parsing (tool distribution, execution rhythm, verification rate,
  reasoning frequency) plus a multi-agent analysis that **adversarially verified** every
  claimed difference and **down-weighted role/phase confounds**.
- **Headline finding (most robust, confound-low):** the decisive gap was the *endpoint of
  verification* — passing code-level checks (schema/ZIP/lint/build) was treated as "done,"
  while the reliable path was **viewing the actual rendered output**. That one habit is
  pattern 1.

Full write-up: [docs/ANALYSIS.md](./docs/ANALYSIS.md).

---

## Install

As a Claude Code plugin (recommended — gives you the `/fable-to-opus` audit skill):

```bash
/plugin marketplace add silobust-hash/fable-to-opus
/plugin install fable-to-opus@fable-to-opus
```

Or just read the packs. They're plain Markdown; nothing here requires installation.

### Optional, opt-in: write a pointer block into your CLAUDE.md

```bash
bash setup/setup.sh local    # this project only (recommended)
bash setup/setup.sh global   # all projects
```

This writes a **short pointer** (not the full rules) that tells the model to run the
adapt-first audit before borrowing any pattern. Remove it any time:

```bash
bash setup/uninstall.sh
```

There is intentionally **no always-on hook that force-injects rules** — that would
contradict the adapt-first principle. You stay in control of what enters your harness.

---

## Usage

In any project:

```
/fable-to-opus
```

The skill audits your CLAUDE.md + skills + harness, maps which of the six patterns you
already cover, and proposes where the missing ones belong — as a changeset you approve,
not as a paste-over.

---

## License

MIT — see [LICENSE](./LICENSE). Use freely, adapt to your own harness, no warranty.
