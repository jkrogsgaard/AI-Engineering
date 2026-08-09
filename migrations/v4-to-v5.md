# Migration: v4 to v5

This is a semantic upgrade guide for repositories previously reviewed against AI Engineering Bootstrap v4.

Do not replace project-specific AI instructions with a copy of v5.

The goal is to inspect the repository's current setup, adopt only the relevant v5 improvements, verify the result, and then record v5 as the reviewed baseline.

## Material change

v5 makes **execution topology and orchestration** a first-class AI engineering concern.

v4 already encouraged short implementation loops, verification, sub-agents when useful, instruction ablation, scoped context, skills, runbooks, and deterministic enforcement.

v5 adds the missing decision layer between those concepts:

> What is the simplest execution topology that can reliably complete this work?

A repository should still default to one capable agent and a tight loop.

Multi-agent or staged execution is justified only when it materially improves context isolation, specialization, independent verification, parallel exploration, or wall-clock time for genuinely independent work.

## Review these areas

### 1. Existing agent instructions

Check whether current instructions merely say to "use sub-agents" or prescribe fixed specialist teams.

Prefer guidance that:

- defaults to the simplest sufficient execution topology
- gives delegated work a bounded responsibility
- states the expected output or completion condition
- keeps orchestration logic with the orchestrator
- avoids unnecessary permanent specialist agents

Do not create new agents merely to satisfy v5.

### 2. Existing reusable/custom agents

Inspect native agent definitions such as project-scoped Codex or Claude sub-agents where relevant.

For each permanent specialist role, ask:

> Would one capable agent with a tight implementation and verification loop perform materially worse without this role?

If no, remove or avoid the permanent role.

Preserve specialist agents that have a distinct recurring purpose and materially improve outcomes.

### 3. Parallel work

Prefer parallel read-heavy exploration where branches are genuinely independent.

Review parallel write workflows carefully.

Where multiple agents may modify code, require intentional ownership or isolation boundaries plus an explicit integration and verification step.

Do not introduce worktrees, sandboxes, or branch fan-out unless they solve a demonstrated coordination problem.

### 4. Independent review

Where independent verification materially matters, ensure the review is genuinely independent.

Do not unnecessarily preload a reviewer with the implementer's conclusions or reasoning if that would weaken the independence of the check.

### 5. Agent environment inspection

Expand repository bootstrap inspection, where relevant, to include:

- reusable or custom agents
- execution plans or planning conventions
- MCP and external tool configuration
- sandbox and permission controls
- branch, worktree, or other task-isolation mechanisms
- existing delegation and orchestration rules

Do not recreate capabilities already provided sufficiently by the active agent harness.

### 6. Mechanical enforcement

Review whether orchestration-related prose would be safer as deterministic controls, for example:

- write isolation
- permissions
- sandbox restrictions
- required verification stages
- hooks
- CI checks

Implement only the highest-value controls demonstrated by repository risk or recurring failure.

### 7. Orchestration ablation

Extend instruction ablation to permanent orchestration primitives.

Challenge each:

- custom agent
- stage
- gate
- routing rule
- delegation rule
- synchronization point

Remove complexity that does not make the repository simpler, faster, safer, or more reliable than one capable agent.

### 8. Baseline provenance

If the repository will participate in centrally managed baseline upgrades, add a small machine-readable provenance marker based on `templates/.ai-engineering.yml` or an equivalent local format.

The marker records the baseline the repository was last **reviewed against**, not a promise that files are identical to the central baseline.

Do not add a marker if there is no actual upgrade process.

## What not to do

Do not:

- copy this repository's `AGENTS.md` into a product repository
- replace project-specific rules with generic v5 text
- create a fixed planner/researcher/architect/implementer/tester/reviewer team by default
- parallelize writes simply because multi-agent tooling is available
- add permanent orchestration infrastructure for one-off tasks
- advance a repository's baseline marker before verification and ablation succeed
- downgrade a local solution that is already better than the new baseline

## Completion criteria

A repository can be marked as reviewed against v5 when:

1. its current AI setup has been inspected
2. relevant v5 orchestration changes have been considered
3. adopted changes have been verified
4. unnecessary new or existing orchestration complexity has been ablated
5. project-specific knowledge and superior local solutions have been preserved
6. important uncertainty or intentional deviations are documented
7. the provenance marker, when used, records version 5 only after the review succeeds
