# Migration: v7 to v8

This is a semantic upgrade guide for repositories previously reviewed against AI Engineering Bootstrap v7.

Do not re-bootstrap the repository from scratch.

The goal is to audit the v8 delta, preserve superior local solutions, apply only changes that materially improve the repository, verify the result, and only then record v8 as the reviewed baseline.

## Material changes

v8 is a narrow collaboration release.

v7 already required write isolation, ownership boundaries, synchronization, integration, and verification when several agents modify code. v8 distinguishes two concerns that can otherwise be conflated:

1. **Isolation** prevents concurrent writers from changing the same local files.
2. **Coordination** makes task ownership and status visible to participants in other checkouts, on other machines, or in other agent tools.

A local worktree can provide excellent isolation while still allowing duplicate work elsewhere. v8 closes that gap without introducing a new orchestration framework.

This source repository also adds maintenance automation and release checks. Those are source-repository controls, not baseline artifacts for participating repositories. Do not copy `MAINTENANCE.md`, its workflow, or its release-verification script into a target merely because they exist here.

## Added

### Shared coordination surface

When a repository is actively shared across people, machines, or independent agent tools, meaningful in-progress work should be visible in a system all relevant participants can observe.

Prefer an existing shared development surface, such as:

- issues or work items
- pull requests or change requests
- remote branches with an established ownership convention
- the team's existing shared tracker

Do not use local agent session state as the cross-tool source of truth.

### Minimal coordination protocol

For meaningful work that could overlap, v8 adds six task-scoped actions:

1. **Discover** current shared work before implementation.
2. **Claim** an owner, scope, status, and intended branch or change area.
3. **Isolate** the writer in a dedicated branch, worktree, sandbox, or equivalent checkout.
4. **Publish** longer-running work early enough to prevent duplicate effort.
5. **Integrate** against the current target through the repository's established verification and review path.
6. **Release** completed, handed-off, blocked, or abandoned ownership explicitly.

This is a protocol, not a required new artifact.

### One active writer per branch

The default is one active writer per branch.

Separate branches can still collide when they modify the same change area. Where overlap is likely, define ownership or sequence before parallel writing begins.

If an existing repository has a proven shared-branch workflow, preserve it when synchronization is explicit and reliable. Do not replace a superior local practice merely to match the default.

### Visible handoff and stale-work handling

Task ownership is a coordination signal, not a permanent lock.

Claims should be easy to inspect, hand off, release, and distinguish from stale work. Completed, blocked, abandoned, or transferred work should not silently remain marked as active.

### Integration controls as a proportional option

For repositories whose collaboration volume or risk justifies them, consider repository-host controls such as:

- protected default branches
- required pull requests
- required checks
- required review or code-owner review
- merge queues

These controls are opportunities to evaluate, not mandatory v8 artifacts.

## Changed

### Repository inspection

The bootstrap inspection now includes:

- shared task, issue, pull-request, and other cross-checkout coordination mechanisms
- task-claiming, branch-ownership, handoff, and stale-work conventions
- default-branch protection and integration rules

### Agent-environment review

Persistent task state is no longer enough by itself. The audit now asks whether task ownership and status are visible across machines and agent tools when the collaboration pattern requires that visibility.

### Context placement

Ownership that must cross checkout or tool boundaries belongs in a shared coordination surface, not only in a local plan, local session, or agent-specific task list.

### Mechanical-enforcement review

The enforcement review now includes:

- shared issue or pull-request assignment and visible status for cross-checkout task ownership
- repository rules requiring pull requests, checks, or review for protected integration branches

### Verification and reporting

The final audit now verifies cross-checkout discoverability, exclusive branch writing, releasable claims, current-target integration, and proportionality of the protocol. The report should state the shared task-ownership and cross-checkout coordination decisions made.

## Removed

No v7 capability or recommendation is removed.

One duplicate statement of the pre-creation ablation question is removed from the core-principles section. Section 11 remains the canonical procedure, and the core principles link to it.

v8 does not deprecate one-agent loops, local worktrees, native agent teams, sub-agents, task-scoped plans, existing trackers, trunk-based development, or proven repository-specific collaboration workflows.

## Reassess

For a v7 repository, review these areas without assuming they require changes.

### 1. Actual collaboration pattern

Determine whether meaningful work is performed by more than one person, machine, checkout, cloud environment, or agent harness.

If not, record that the cross-checkout protocol is unnecessary and do not manufacture coordination overhead.

### 2. Shared source of active-work truth

Identify where a new participant can discover:

- what is already in progress
- who or what owns it
- its intended scope
- its branch or change area
- whether it is active, blocked, handed off, abandoned, or complete

If this information exists only in a local terminal, chat, plan, or unpushed branch, the repository has a cross-checkout visibility gap.

Prefer improving an existing issue, pull-request, or tracker convention over creating a new coordination file or service.

### 3. Pre-work discovery and claiming

Check whether contributors and agents refresh and inspect shared state before substantial overlapping work.

If duplicate work has occurred or is realistically costly, add a short project-specific instruction or reusable procedure that identifies the canonical shared surface and the minimum claim information.

Do not prescribe tool-specific commands unless the repository actually uses that tool and the commands are verified.

### 4. Branch and change-area ownership

Check whether two independent writers can silently use the same branch or checkout.

Prefer one active writer per branch. For parallel branches that touch the same subsystem or change area, define boundaries or integration order.

Do not require worktrees when separate clones, sandboxes, cloud environments, or another existing isolation mechanism already solve the problem.

### 5. Publication and handoff

Check whether longer-running changes become visible early enough to prevent another participant from starting the same work.

A linked task, pushed branch, status update, or draft pull request may be enough. Choose the lightest signal the actual workflow makes reliably visible.

Check that handoff and abandonment release ownership explicitly.

### 6. Integration protection

Review whether the default branch and high-risk branches need enforced pull requests, checks, review, code ownership, or a merge queue.

Do not enable controls merely because the hosting platform offers them. Require evidence from collaboration volume, repository risk, recurring integration failures, or compliance needs.

### 7. Local coordination artifacts

Look for lock files, agent registries, local task databases, or duplicated tool-specific status files.

Remove or avoid them when the existing shared development platform already provides sufficient visibility. Retain a custom mechanism only when it has demonstrated recurring value and handles stale ownership and failure visibly.

## Preserve

Do not downgrade or remove:

- project-specific invariants and hard safety boundaries
- verified development and integration commands
- existing shared trackers that teams actually use
- proven branch, trunk-based, review, or merge-queue workflows
- useful local worktree or sandbox isolation
- native agent coordination within one harness
- superior repository-specific handoff and ownership practices
- low-overhead solo workflows where collision risk is negligible

v8 does not require GitHub, issues, draft pull requests, or branch protection in every repository. It requires the audit to distinguish isolation from coordination and address only the demonstrated gap.

## Verification

Before recording v8:

1. inspect the current repository and existing AI setup
2. review the v7 to v8 delta
3. determine the repository's real cross-checkout collaboration pattern
4. identify the existing shared source of task ownership and status, if one is needed
5. perform pre-creation ablation on any proposed coordination artifact or rule
6. verify that meaningful active work is discoverable from another checkout or shared system
7. verify that parallel writers cannot silently share one branch or checkout
8. verify that overlapping change areas have ownership, sequencing, or an intentional integration point
9. verify that claims can be handed off, released, and distinguished from stale work
10. verify that integration uses the current target state and the repository's required checks or review
11. check for broken references, contradictions, duplication, and stale tool assumptions
12. perform final instruction, artifact, and coordination ablation
13. verify the exact upstream AI-Engineering commit reviewed
14. update the provenance marker to version 8 and that `source_commit` only after the audit succeeds

Verification need not create artificial issues or pull requests in a low-collaboration repository. Evidence that the protocol would cost more than the realistic collision risk is a valid v8 audit result.

## Skipping directly to a later baseline

This migration is designed to be composed with adjacent migrations before and after it.

A repository moving from v6 directly to a later baseline should read `v6-to-v7`, this `v7-to-v8` guide, and every subsequent adjacent guide through the target version, determine the net desired current state, and perform one focused upgrade audit.

Do not create intermediate commits, trackers, branches, or temporary coordination infrastructure merely to imitate each historical baseline in sequence.

## Completion criteria

A repository can be marked as reviewed against v8 when:

1. the relevant v8 changes have been considered
2. isolation and cross-checkout coordination have been evaluated separately
3. the shared source of meaningful task ownership is explicit where the collaboration pattern requires one
4. parallel write ownership and the integration path are clear enough to prevent silent collision
5. claims and handoffs do not leave stale work appearing active
6. proposed custom coordination infrastructure has survived pre-creation and final ablation
7. adopted changes have been verified without manufacturing unnecessary process
8. project-specific knowledge and superior local solutions have been preserved
9. intentional deviations or important uncertainty are reported
10. the provenance marker, when used, records version 8 and the exact upstream source commit only after the review succeeds
