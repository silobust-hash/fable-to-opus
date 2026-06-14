# How this was derived

This playbook is not vibes. It comes from parsing two real project transcripts (~31MB total)
in which **Fable and Opus worked the same project**, split across phases — a natural A/B on
comparable sub-tasks. Below is the method, the measurements, and — importantly — what the data
does **not** support.

## Method

1. **Quantitative parse.** Both transcripts were parsed for every main-thread assistant turn:
   tool distribution, tools per turn, execution rhythm (text-per-tool, silent bursts),
   verification-flavored commands, internal-reasoning frequency, and tool-result error rate.
2. **Multi-agent analysis.** Six dimensions were analyzed in parallel, then each claimed
   difference was **adversarially verified** against the raw transcripts, and **role/phase
   confounds were down-weighted** before anything was accepted. Only verified claims fed the
   synthesis.

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

> Numbers are indicative, from one project. Treat directionally, not as benchmarks. Heavy
> generation was delegated to subagents in **both** cases, so main-thread counts undercount real
> work — another reason not to read tool counts as merit.

## The headline finding (most robust)

The decisive, **confound-low** difference was the *endpoint of verification*:

- One model treated **code-level checks** (schema validity, archive integrity, lint/build green)
  as "done" — and was wrong about a rendered document whose only defect was visible on screen.
- The other closed the same defect by **viewing the actual rendered output**.

The gap was not *how much* verification — code-level checks were if anything more numerous — but
*what was verified*: the file's integrity vs. the picture a human sees. That single habit is
[pack 1](../packs/01-render-verification.md), and it's the most worthwhile thing here.

## What the data does NOT support

- **Tool-count productivity.** "More edits / more subagents" tracked the *phase* each model was
  handed, not model superiority. We flagged these as high-confound and excluded them from the
  portable set.
- **"Ask less, start faster."** The model that confirmed less was handed already-decided
  execution phases. Read as a virtue and applied to irreversible work, it produces wrong output
  at scale ([pack 5](../packs/05-irreversible-confirm.md)).
- **"Reason more."** Internal-reasoning frequency is model-side and its content isn't even stored
  in the transcript — only its frequency. More of it did not prevent self-reversal in the data.
  Not promptable, not included.

## The honest frame

A harness cannot raise a model's ceiling. What it can do — and what the verified patterns do — is
turn verification, investigation, and completion into *procedure*, so the model reaches its own
ceiling reliably instead of stopping early at a passing-but-wrong checkpoint. When the ceiling
itself is the blocker (open-ended creative depth, self-driven discovery), no pack fixes it; that's
capability, and you escalate rather than pretend.

This is also why the repo ships an **audit skill** instead of an auto-injector: the right move is
to adopt only the patterns you're actually missing, in the right layer of *your* harness. See
[pack 0](../packs/00-adapt-first.md).
