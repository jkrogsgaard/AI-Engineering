# Migration: v5 to v6

This is a semantic upgrade guide for repositories previously reviewed against AI Engineering Bootstrap v5.

Do not re-bootstrap the repository from scratch.

The goal is to audit the v6 delta, preserve superior local solutions, apply only changes that materially improve the repository, verify the result, and only then record v6 as the reviewed baseline.

## Material changes

v6 strengthens three behaviors that field use of v5 showed were worth making explicit:

1. **Immutable provenance** — record the exact upstream baseline commit reviewed, not only the human-readable version number.
2. **Pre-creation ablation** — challenge proposed persistent files, instructions, skills, agents, and orchestration before creating them, not only after setup is complete.
3. **Composable skipped-version upgrades** — when a repository skips baseline versions, read the adjacent migration guides in order and reason about the net target state instead of mechanically replaying obsolete intermediate states.

## Added

### Exact baseline source commit

When a project uses the standard provenance marker, prefer:

```yaml
baseline:
  id: ai-engineering-bootstrap
  repository: jkrogsgaard/AI-Engineering
  version: 6
  source_commit: <exact-upstream-commit>
  last_reviewed: YYYY-MM-DD
```

`version` is the human-readable release identity.

`source_commit` identifies the exact immutable baseline state that was reviewed.

Record the commit for the upstream AI-Engineering repository state actually used for the successful audit. Do not guess it and do not use a moving branch name in place of the commit.

### Pre-creation ablation

Before creating a persistent artifact, ask whether a capable modern coding agent would materially perform worse in this repository without it.

Apply this before creating, among other things:

- `AI_ENGINEERING_PLAYBOOK.md`
- dedicated AI-context documentation
- skills or runbooks
- custom or specialist agents
- scoped rule files
- compatibility adapters
- hooks
- orchestration infrastructure
- new persistent instructions

If the answer is no, do not create the artifact.

This does not replace the final ablation review. v6 uses both pre-creation and final ablation.

### Skipped-version upgrades

If the repository is older than the immediately previous baseline, read every adjacent migration guide from the recorded version through the current version in order.

For example, a repository moving from v5 to v8 should read:

- `migrations/v5-to-v6.md`
- `migrations/v6-to-v7.md`
- `migrations/v7-to-v8.md`

Compose their Added, Changed, Removed, Reassess, Preserve, and Verification guidance into one current-state audit.

Do **not** mechanically implement obsolete intermediate states.

If an earlier migration adds something that a later migration changes or removes, reason about the final target state and make only the changes still relevant to the current repository.

## Changed

### Minimal new-repository setup

v5 showed `AGENTS.md` plus `AI_ENGINEERING_PLAYBOOK.md` as a possible minimal starting structure.

v6 is stricter: a new repository may need only `AGENTS.md`, and even that should contain only high-value project-specific context.

Create a separate playbook only when the repository demonstrates recurring need for reusable engineering methodology beyond native agent capability and the project-specific instructions already present.

### Project documentation is not automatically AI documentation

Durable product, architecture, domain, security, operational, scanner, payment, or integration knowledge should normally live in ordinary project documentation with a domain-appropriate name.

Do not create a parallel `AI_CONTEXT`, `AI_AGENT_CONTEXT`, or similar document merely to collect information an agent could retrieve from existing documentation or code.

### Provenance verification

When a baseline marker is used, verify both:

- the baseline version actually reviewed
- the exact upstream source commit actually reviewed

Do not advance either field merely because baseline files were copied or referenced.

## Removed

No existing v5 project structure is categorically removed by v6.

In particular, v6 does **not** require removal of an existing playbook, custom agent, skill, runbook, detailed instruction set, or evidence-backed review workflow that demonstrably improves the repository.

## Reassess

For a v5 repository, review these areas without assuming they require changes:

### 1. Provenance marker

If `.ai-engineering.yml` or an equivalent marker exists, add the exact `source_commit` for the v6 audit when the audit succeeds.

Do not invent a historical source commit for the previous v5 review unless it is known from reliable evidence.

### 2. Generic playbooks

If `AI_ENGINEERING_PLAYBOOK.md` exists, ask:

> Would a capable modern coding agent materially perform worse in this repository without this file?

If no, remove it or merge any truly project-specific value into a more appropriate location.

If the playbook has demonstrated recurring value, keep it.

### 3. Dedicated AI-context documents

Review files whose main purpose is to duplicate project context specifically for agents.

Prefer ordinary canonical project documentation or code when they already express the same knowledge reliably.

### 4. Permanent agent and orchestration infrastructure

Apply pre-creation reasoning retrospectively to existing permanent agents, stages, routing rules, and coordination boundaries.

Preserve evidence-backed local workflows even when they are more elaborate than the baseline default.

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

v6 does not require repositories to converge on one identical file structure.

## Verification

Before recording v6:

1. inspect the current repository and existing AI setup
2. review the v5 to v6 delta
3. perform pre-creation ablation on any proposed new persistent artifacts
4. make only relevant changes
5. verify normal repository gates appropriate to the changed scope
6. check for broken references after any removals or consolidation
7. perform final instruction and orchestration ablation
8. verify the exact upstream AI-Engineering commit reviewed
9. update the provenance marker to version 6 and that `source_commit` only after the audit succeeds

## Skipping directly to a later baseline

This migration is designed to be composed with later adjacent migrations.

A future upgrade agent moving from v5 directly to v7, v8, or later should read this guide and every subsequent adjacent guide through the target version, determine the net desired current state, and perform one focused upgrade audit.

Do not create intermediate commits or temporary infrastructure merely to imitate each historical baseline in sequence.

## Completion criteria

A repository can be marked as reviewed against v6 when:

1. the relevant v6 changes have been considered
2. unnecessary proposed or existing persistent AI infrastructure has been ablated
3. project-specific knowledge and superior local solutions have been preserved
4. adopted changes have been verified
5. intentional deviations or important uncertainty are reported
6. the provenance marker, when used, records version 6 and the exact upstream source commit only after the review succeeds
