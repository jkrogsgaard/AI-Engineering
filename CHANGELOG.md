# Changelog

This changelog records material changes to the AI Engineering Bootstrap baseline.

## v7 - 2026-08-11

### Added

- What enforces the plan as an explicit execution-design question, separate from the shape of the topology: the agent's turn-by-turn judgment, or deterministic control flow the agent cannot skip or improvise.
- Guidance to prefer deterministic control flow when a stage must not be skipped, reordered, or applied inconsistently across many items, and to prefer model-directed delegation while the plan is still being discovered.
- Guidance to keep filtering, deduplication, thresholds, routing, and aggregation between stages in ordinary code rather than in an additional model call.
- Preference for a machine-checkable output contract, such as a schema, when delegated results are aggregated, filtered, or routed programmatically.
- Explicit note that fan-out multiplies cost, and that parallel width and verification depth should scale to the value of the task rather than to what the tooling permits.
- Reuse symmetry for orchestration: a one-off orchestration stays task-scoped, and an orchestration definition is persisted only when the same orchestration actually recurs.
- Inspection of scripted or programmatic orchestration among the execution capabilities a repository may already have.
- Context-placement, mechanical-enforcement, ablation, and verification entries for the above.

### Changed

- Section 5.9 now separates execution topology from plan enforcement. v6 described only the shape of the work.
- The mechanical-enforcement review now covers stages that must never be skipped and the format of delegated results.
- Orchestration ablation now also challenges persisted orchestration definitions, not only permanent agents, stages, gates, and delegation rules.

### Philosophy

v7 extends the baseline's existing preference for deterministic enforcement over prose from rules to execution.

It does not introduce a new orchestration framework, vocabulary, or required artifact. Deterministic orchestration is a tool for the small number of stages that must be guaranteed, not a new default. A one-agent loop remains a valid and often preferable execution topology.

## v6 - 2026-08-09

### Added

- Exact upstream `source_commit` provenance alongside the human-readable baseline version.
- Pre-creation ablation: proposed persistent files, instructions, skills, agents, adapters, hooks, and orchestration must justify their cost before they are created.
- Explicit skipped-version upgrade behavior: read all adjacent migrations from the recorded version through the current version, compose the net target state, and avoid replaying obsolete intermediate states.
- Migration guidance structured for composition across future baseline versions.

### Changed

- New repositories are no longer shown `AGENTS.md` plus `AI_ENGINEERING_PLAYBOOK.md` as the default minimal pair; a repository may need only a focused `AGENTS.md`.
- A separate playbook now requires demonstrated recurring value beyond native agent capability and project-specific instructions.
- Durable project knowledge should normally live in ordinary domain-appropriate documentation rather than dedicated `AI_CONTEXT`-style files that duplicate existing sources.
- Baseline provenance verification now checks both the reviewed version and the exact upstream source commit.
- Final ablation remains required; pre-creation ablation complements rather than replaces it.

### Upgrade model

A repository upgrading across several baseline versions should not implement each historical baseline in sequence.

For example, a v5 repository upgrading to v8 should read `v5-to-v6`, `v6-to-v7`, and `v7-to-v8`, reason about their combined Added, Changed, Removed, Reassess, Preserve, and Verification guidance, then perform one focused audit against the current target state.

### Philosophy

v6 is a learning release informed by real repository audits. The central lesson is that good bootstrap behavior is measured as much by what an agent deliberately does **not** create as by what it adds.

## v5 - 2026-08-09

### Added

- Execution topology and orchestration as an explicit repository-setup concern.
- Guidance to default to one capable agent and use sub-agents, parallel branches, staged workflows, or independent reviewers only when they materially improve isolation, specialization, verification, or speed.
- Bounded delegation contracts with clear responsibility, inputs, expected output, and completion conditions.
- Explicit preference for parallel read-heavy work over parallel writes.
- Guidance for write isolation, synchronization, integration, and independent review.
- Inspection of reusable/custom agents, execution plans, MCP configuration, permissions, sandboxing, and task-isolation mechanisms.
- Orchestration ablation: permanent agents, stages, gates, and delegation rules must justify their coordination cost.
- Baseline provenance and future-upgrade guidance.
- A project-side baseline marker concept for recording the last reviewed baseline version.
- Verification requirements for orchestration and baseline provenance.

### Changed

- Playbook principle 11 now asks the repository to choose the simplest sufficient execution topology rather than merely recommending sub-agents when useful.
- The agent-environment review now includes execution capabilities provided by the active harness.
- Existing-repository review now checks for unnecessary orchestration complexity and recurring specialist roles worth preserving.
- Mechanical-enforcement review now includes write isolation, review stages, permissions, sandboxing, and hooks.
- Instruction ablation now also applies to orchestration primitives.
- The expected conceptual repository structure now allows reusable specialist agents and a baseline provenance marker when justified.

### Philosophy

v5 treats graph engineering as an underlying execution-design problem, not as a requirement to build explicit graphs or multi-agent teams.

The default remains the simplest reliable setup. A one-agent loop is a valid and often preferable execution topology.

## Before v5

Earlier versions were developed iteratively before this repository became the canonical versioned source. `migrations/v4-to-v5.md` captures the material migration from the immediately preceding baseline.
