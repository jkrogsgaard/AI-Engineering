# Migration: v8 to v9

This is a semantic upgrade guide for repositories previously reviewed against AI Engineering Bootstrap v8.

Do not re-bootstrap the repository from scratch.

The goal is to audit the v9 delta, preserve superior local solutions, apply only changes that materially improve the repository, verify the result, and only then record v9 as the reviewed baseline.

## Material changes

v9 is a model-generation release.

Its trigger is the capability jump in the model generation released during 2026 and the vendor guidance that accompanied it. Current vendor documentation now states directly that instructions and skills developed for prior models are often too prescriptive for newer ones and can degrade output quality, that improved instruction-following lets a brief instruction steer behaviors that previously required enumeration, and that a capability improvement is itself a prompt to re-evaluate which instructions, tools, and guardrails are still needed.

v9 turns that into one central distinction:

1. **Durable repository truth** — verified commands, hard boundaries, domain invariants, non-obvious project facts. This ages well.
2. **Compensation for model weaknesses** — emphasis, repetition, defensive triggers, forced self-verification, enumerated cases, prescriptive procedure. This expires when the models improve.

A model upgrade is now an explicit ablation trigger, alongside the existing pre-creation and final ablation.

v9 also gives the baseline a position on two mechanisms that shipped in current tooling: agent-authored memory that harnesses persist and load by default, and scoped rules that load conditionally only when matching paths are touched.

### Evidence

The load-bearing guidance was verified against primary sources on 2026-08-30:

- Claude Code memory documentation (`code.claude.com/docs/en/memory`): instruction files are context, not enforced configuration; vendor size target under 200 lines per always-loaded file; `.claude/rules/` with `paths` frontmatter for conditional loading; automatic memory enabled by default with a bounded index loaded each session; the `@AGENTS.md` import documented as the recommended cross-agent compatibility pattern.
- Claude Fable 5 prompting guide (`platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5`): re-evaluate instructions on capability improvements; brief instructions over enumeration; skills for prior models are often too prescriptive and can degrade output; audit prompts for reasoning-echo instructions.
- Agent Skills authoring best practices (`platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices`): create evaluations before writing extensive documentation; keep the skill body small and references one level deep; descriptions drive skill selection; reserve low-freedom prescriptive detail for fragile operations.

Instruction-count and long-context research corroborates the direction but was not verified against primary papers; no numeric claim from it appears in the baseline.

## Added

### Model-upgrade ablation (section 11)

When the models powering repository work materially improve, re-run final ablation across persistent instructions, skills, playbooks, agent definitions, and orchestration, distinguishing durable truth from compensation.

Compensatory patterns to look for:

- aggressive emphasis such as CRITICAL or YOU MUST, and one constraint restated several ways
- defensive triggers such as "if in doubt, do X"
- explicit self-verification steps such as "double-check your answer before finishing"
- instructions to restate or echo internal reasoning
- long enumerations of cases that one brief instruction now covers
- step-by-step procedure where outcome-level guidance suffices

Where practical, test the candidate against the current model's default behavior and remove it when default performance is at least as good.

### Agent-authored memory policy (section 5.11)

Harness-persisted agent memory is persistent context and must earn its context cost like everything else. Each repository decides explicitly whether it stays enabled. Where enabled: audit periodically, delete stale notes, and promote durable lessons into canonical instructions, scoped rules, or documentation. It is machine-local and never a coordination or documentation substitute.

### Evaluation-first bar for skills (section 5.7)

Before persisting a skill, run a representative task without it and keep the skill only when it demonstrably outperforms default behavior. Keep the roster small, descriptions precise, and bundled references one level deep. Selection by description is the common failure point, so effort goes into the trigger rather than the body.

### Conditional scoped rules (sections 5.4 and 6)

Where tooling supports rules that load only when matching paths or files are touched, prefer them for subsystem-specific conventions over content in the always-loaded root file.

### Evidence grounding for the size target (section 5.1)

The under-100-line target is now grounded in the current vendor ceiling of under 200 lines and in instruction-following adherence, rather than stated as taste.

## Changed

### Trimming criterion (section 5.2)

When trimming persistent instructions, cut what a capable agent can derive from the codebase, such as directory layouts, dependency lists, and architecture overviews. Keep pitfalls, rationale, and conventions that differ from tool defaults.

### Repository inspection (sections 2 and 4)

Inspection now covers conditionally loaded instruction files and agent-authored memory state. The instruction review now looks for compensatory instructions written for weaker model generations.

### Final output (section 15)

The report scales to the size of the audit. A small repository needs a few paragraphs covering the material points, not a full ceremony.

### Verification (section 13)

The audit now also verifies that compensatory instructions are retained only with evidence they still help, and that agent-authored memory is either deliberately managed or disabled.

## Removed

### The playbook seed list (section 5.5)

The sixteen-principle seed list for `AI_ENGINEERING_PLAYBOOK.md` is removed. Generic engineering methodology is default behavior for current capable models, and over-prescriptive instruction can degrade their output. The playbook section itself remains: a playbook is still valid when the repository has demonstrated recurring need, seeded only with methodology that repository has actually needed.

Do not mechanically delete an existing playbook during the upgrade. Re-ablate it under the model-upgrade test instead, and keep principles backed by repository-specific evidence.

### Trimmed generic examples (section 5.2)

The list of generic statements to avoid was shortened. No semantic change.

v9 does not deprecate `AGENTS.md` as the canonical cross-agent file, the thin `CLAUDE.md` import adapter, skills for recurring procedures, one-agent loops, or any v8 coordination guidance. The adapter pattern is now vendor-documented verbatim, which strengthens rather than changes it.

## Reassess

For a v8 repository, review these areas without assuming they require changes.

### 1. Compensation sweep

Search persistent instruction files, skills, playbooks, and agent definitions for the compensatory patterns listed above (emphasis, repetition, defensive triggers, forced verification, reasoning-echo, enumerations, prescriptive procedure).

Treat each hit as a candidate, not an automatic deletion: test against current default behavior where practical, and remove what no longer helps. An emphatic instruction that still demonstrably changes behavior stays.

### 2. Agent-authored memory

Check whether the harnesses used by the repository persist agent memory by default. Decide per repository: enabled with an audit practice, or disabled. Review any accumulated memory once — promote durable lessons, delete the rest.

### 3. Skill roster

Apply the evaluation-first bar to existing skills. A skill that does not beat default behavior on a representative task is removed or rewritten. Check that descriptions state what the skill does and when to use it, and that references are one level deep.

### 4. Scoped rules

Instructions that apply to one subsystem but sit in the always-loaded root file are candidates for conditional path-scoped rules where the tooling supports them. Note that import mechanisms typically load at launch and do not reduce context; only conditional loading does.

### 5. Existing playbook

If the repository copied the old seed list, re-evaluate each principle against current default model behavior and keep only those with repository-specific evidence.

## Preserve

Do not downgrade or remove:

- project-specific invariants and hard safety boundaries
- verified development and integration commands
- domain facts a capable agent cannot reliably infer
- evidence-backed local practices, including emphatic or prescriptive instructions that demonstrably still change behavior
- the `AGENTS.md` canonical file and thin tool adapters
- skills with demonstrated value
- all v8 isolation and cross-checkout coordination guidance

Old is not the same as expired. The test is whether current default behavior is at least as good without the instruction, not the instruction's age or tone.

## Verification

Before recording v9:

1. inspect the current repository and existing AI setup
2. review the v8 to v9 delta
3. run the compensation sweep and test candidates against current default behavior where practical
4. decide and record the agent-authored memory policy
5. apply the evaluation-first bar to the skill roster
6. move subsystem-specific rules to conditional scoped rules where supported
7. verify that no hard boundary, verified command, or domain invariant was removed
8. check for broken references, contradictions, duplication, and stale tool assumptions
9. perform final instruction, artifact, and orchestration ablation
10. verify the exact upstream AI-Engineering commit reviewed
11. update the provenance marker to version 9 and that `source_commit` only after the audit succeeds

A valid v9 audit can conclude that little changes: a repository whose persistent instructions already contain only durable truth simply records the memory-policy decision and the review.

## Skipping directly to a later baseline

This migration is designed to be composed with adjacent migrations before and after it.

A repository moving from v7 directly to a later baseline should read `v7-to-v8`, this `v8-to-v9` guide, and every subsequent adjacent guide through the target version, determine the net desired current state, and perform one focused upgrade audit.

Do not replay obsolete intermediate states.

## Completion criteria

A repository can be marked as reviewed against v9 when:

1. the relevant v9 changes have been considered
2. the compensation sweep has run and its removals or retentions are evidence-based
3. the agent-authored memory policy is explicit
4. the skill roster has passed the evaluation-first review
5. durable truth — invariants, commands, boundaries, facts — is intact
6. adopted changes have been verified without manufacturing unnecessary process
7. intentional deviations or important uncertainty are reported
8. the provenance marker, when used, records version 9 and the exact upstream source commit only after the review succeeds
