# Migration: v6 to v7

This is a semantic upgrade guide for repositories previously reviewed against AI Engineering Bootstrap v6.

Do not re-bootstrap the repository from scratch.

The goal is to audit the v7 delta, preserve superior local solutions, apply only changes that materially improve the repository, verify the result, and only then record v7 as the reviewed baseline.

## Material changes

v7 is a narrow release. It extends one principle the baseline already held.

v6 said: prefer deterministic enforcement over prose where practical. v7 applies that to execution as well as to rules.

1. **What enforces the plan** — v6 described the shape of a topology but not who enforces it. v7 makes the choice between model-directed delegation and deterministic control flow explicit.
2. **Deterministic steps stay in code** — filtering, deduplication, thresholds, routing, and aggregation between stages do not need a model.
3. **Machine-checkable delegation output** — when delegated results are consumed programmatically, a schema beats prose.
4. **Reuse symmetry for orchestration** — v6 already limited permanent custom agents to recurring roles. v7 applies the same limit to persisted orchestration definitions.

For most repositories this changes nothing structurally. It changes how a substantial multi-stage task is executed, which is task-scoped, not a persistent artifact.

## Added

### Plan enforcement as an execution-design question

For substantial work, decide the topology and then decide what enforces it:

- the agent's own turn-by-turn judgment
- deterministic control flow the agent cannot skip or improvise

Prefer deterministic control flow when a stage must not be skipped, reordered, or applied inconsistently across many items. Verification, gating, and aggregation over many items are the usual cases.

Prefer model-directed delegation when the right next step genuinely depends on what earlier stages found.

Do not encode a plan in control flow before the plan is stable. An unstable plan hardened into code is worse than an agent adapting turn by turn.

### Deterministic steps between stages

Filtering, deduplication, thresholds, routing, and aggregation belong in ordinary code rather than in an additional model call.

Code is exact, auditable, and free.

### Machine-checkable delegation contracts

v6 already required delegated work to declare its expected output.

v7 adds: when delegated results are aggregated, filtered, or routed programmatically, prefer a machine-checkable contract such as a schema over prose.

Prose output remains appropriate when a human reads the result.

### Cost of fan-out

Parallel width and verification depth are deliberate choices.

Scale them to the value of the task rather than to what the tooling permits.

### Reuse symmetry for orchestration

Keep a one-off orchestration task-scoped.

Persist an orchestration definition only when the same orchestration actually recurs, exactly as v6 already required for custom agents.

## Changed

### Section 5.9 covers enforcement as well as shape

The execution-topology guidance now separates two questions that v6 merged:

- what shape the work takes
- what guarantees that the shape is followed

### Mechanical enforcement review

The enforcement table now also covers:

- a stage that must never be skipped, preferring deterministic control flow or a CI gate
- the format of delegated results, preferring a schema or other machine-checkable contract

### Orchestration ablation

Final ablation now also challenges persisted orchestration definitions, not only permanent agents, stages, gates, and delegation rules.

## Removed

Nothing from v6 is removed.

v7 does not deprecate model-directed delegation, sub-agents, one-agent loops, existing playbooks, skills, runbooks, custom agents, or evidence-backed local workflows.

## Reassess

For a v6 repository, review these areas without assuming they require changes.

### 1. Verification steps carried only by prose

Identify any instruction of the form "always verify X" or "never skip Y" that currently depends on the agent choosing to comply.

If the step is genuinely mandatory and repeats across tasks, prefer a deterministic gate: a CI check, a hook, a required review stage, or control flow in a reusable orchestration.

If the step is occasional or judgment-dependent, leave it as guidance. Do not build machinery for it.

### 2. Model calls doing work code should do

Look for existing agent definitions, skills, or documented procedures whose real job is filtering, deduplicating, counting, sorting, or merging.

Move that work into ordinary code where it is exact and auditable.

### 3. Delegated output formats

Where delegated results feed another automated step, check whether the expected output is specified well enough to be parsed reliably.

Do not introduce schemas where a human reads the result.

### 4. Persisted orchestration definitions

If the repository has accumulated saved workflows, pipelines, or orchestration scripts, check each against recurrence.

Remove or task-scope the ones that encode a single past task.

### 5. Repositories with no multi-stage work

Many repositories will find nothing to change. That is a valid v7 audit outcome.

Record the baseline and move on. Do not manufacture orchestration to demonstrate adoption of this release.

## Preserve

Do not downgrade or remove:

- project-specific invariants
- hard safety boundaries
- verified commands
- domain knowledge that cannot be reliably inferred
- useful scoped instructions
- evidence-backed specialist workflows
- proven independent review practices
- deterministic controls that prevent recurring failures
- superior local solutions
- one-agent loops that already work well

v7 does not require repositories to converge on one identical file structure, and it does not require any repository to adopt scripted orchestration.

## Verification

Before recording v7:

1. inspect the current repository and existing AI setup
2. review the v6 to v7 delta
3. perform pre-creation ablation on any proposed new persistent artifact or orchestration definition
4. make only relevant changes
5. verify normal repository gates appropriate to the changed scope
6. verify that any stage newly moved into deterministic enforcement actually fails visibly when it should
7. check for broken references after any removals or consolidation
8. perform final instruction and orchestration ablation
9. verify the exact upstream AI-Engineering commit reviewed
10. update the provenance marker to version 7 and that `source_commit` only after the audit succeeds

Step 6 matters. A gate that passes silently when it should fail is worse than the prose instruction it replaced.

## Skipping directly to a later baseline

This migration is designed to be composed with adjacent migrations before and after it.

A repository moving from v5 directly to v8 should read `v5-to-v6`, `v6-to-v7`, and `v7-to-v8`, determine the net desired current state, and perform one focused upgrade audit.

Do not create intermediate commits or temporary infrastructure merely to imitate each historical baseline in sequence.

## Completion criteria

A repository can be marked as reviewed against v7 when:

1. the relevant v7 changes have been considered
2. mandatory stages carried only by prose have been identified, and moved to deterministic enforcement where that is justified
3. unnecessary proposed or existing persistent AI infrastructure, including orchestration definitions, has been ablated
4. project-specific knowledge and superior local solutions have been preserved
5. adopted changes have been verified
6. intentional deviations or important uncertainty are reported
7. the provenance marker, when used, records version 7 and the exact upstream source commit only after the review succeeds
