# Changelog

This changelog records material changes to the AI Engineering Bootstrap baseline.

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
