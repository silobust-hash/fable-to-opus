# How this was derived

This isn't a controlled benchmark — but it isn't guesswork either. It's **field notes from a short,
intensive run with Fable-5 on real production work**, compared against the same author's established
Opus workflow on the same kinds of tasks.

## What this is based on

Over a brief window, Fable-5 was put on the author's actual workload — not toy prompts:

- a **business plan written for an actual grant submission** (a real, render-perfect deliverable);
- **review / QA of 500+ published blog posts** (citations, consistency, formatting at scale);
- **content audits across 8 publishing channels**, including the firm's website;
- a **full pass over the author's own Claude Code plugins, skills, and harness**.

The same author had been doing this kind of work with **Opus** for months, so the comparison is a
practitioner's A/B between two models on a shared, real workload — not a lab study, and not a single
toy project. Transcripts from that window were then parsed quantitatively (below).

> **Reproducibility, honestly:** the raw transcripts contain client and case material and cannot be
> published. The numbers here are therefore **not externally reproducible** — treat them as field
> notes from one practitioner over one short period: directional, not a benchmark. Where a difference
> could be a role/phase artifact, it is flagged and excluded rather than sold as a finding.

## Method

1. **Quantitative parse.** Transcripts were parsed for every main-thread assistant turn: tool
   distribution, tools per turn, execution rhythm (text-per-tool, silent bursts), verification-flavored
   commands, internal-reasoning frequency, and tool-result error rate.
2. **Multi-agent analysis.** Several dimensions were analyzed in parallel, then each claimed difference
   was **adversarially checked** against the raw transcripts, and **role/phase confounds were
   down-weighted** before anything was accepted. Only what survived fed the patterns.

## The measurements (main-thread, indicative)

| Signal | Fable | Opus | Reading |
|---|---|---|---|
| assistant turns | 571 | 323 | different volume — but they were handed different phases |
| median reply length | ~59 chars | ~121 chars | Fable terser; Opus narrates per step |
| text-free turns | ~89% | ~76% | Fable runs long quiet tool bursts |
| edits | many | fewer | **mostly a phase confound — see below** |
| reads | fewer | more | Opus reads more before acting (also phase-tied) |
| subagent hand-offs | more | fewer | Fable fanned out more — phase-tied |
| internal-reasoning frequency | ~46% of turns | ~25% | model-internal; content not stored |
| verification-flavored commands | ~29% | ~42% | Opus leaned harder on explicit checks |

> Numbers are indicative, from one practitioner over one period — see the reproducibility note above.
> Heavy generation was delegated to subagents in **both** cases, so main-thread counts undercount real
> work — another reason not to read tool counts as merit.

## The difference we trust most (confound-low)

The one difference that held up — even when both models worked the **very same defect** — was the
*endpoint of verification*:

- One treated **code-level checks** (schema validity, archive integrity, lint/build green) as "done"
  — and was wrong about a rendered document (the business plan's budget table) whose only defect was
  visible on screen.
- The other closed that defect by **viewing the actual rendered output**.

The gap wasn't *how much* verification — code-level checks were if anything more numerous — but *what*
was verified: the file's integrity vs. the picture a human sees. That single habit is
[pack 1](../packs/01-render-verification.md), and it's the most worthwhile thing here. Because both
models hit the same defect, this one is the hardest to explain away as a role/phase artifact — which
is exactly why we trust it most.

## What the data does NOT support

- **Tool-count productivity.** "More edits / more subagents" tracked the *phase* each model was
  handed, not model superiority. Flagged high-confound and excluded from the portable set.
- **"Ask less, start faster."** The model that confirmed less was handed already-decided execution
  phases. Read as a virtue and applied to irreversible work, it produces wrong output at scale
  ([pack 5](../packs/05-irreversible-confirm.md)).
- **"Reason more."** Internal-reasoning frequency is model-side and its content isn't even stored in
  the transcript — only its frequency. More of it did not prevent self-reversal here. Not promptable,
  not included.

## The honest frame

A harness cannot raise a model's ceiling. What it can do — and what the verified patterns do — is turn
verification, investigation, and completion into *procedure*, so the model reaches its own ceiling
reliably instead of stopping early at a passing-but-wrong checkpoint. When the ceiling itself is the
blocker (open-ended creative depth, self-driven discovery), no pack fixes it; that's capability, and
you escalate rather than pretend.

This is also why the repo ships an **audit skill** instead of an auto-injector: the right move is to
adopt only the patterns you're actually missing, in the right layer of *your* harness. See
[pack 0](../packs/00-adapt-first.md).
