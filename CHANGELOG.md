# Changelog

This changelog records material changes to the AI Engineering Bootstrap baseline.

## v10 - 2026-09-14

### Added

- Skill evaluations are judged on what the agent did (files read, commands run, artifact produced), not on what it reported, and the evaluated run is kept blind where practical so the task reads like an ordinary request rather than a test.
- Work that runs unattended and is reviewed afterwards states its completion condition as a pass-or-fail check before starting, never relaxes it to declare the work done, and leaves a task-scoped trail of decisions with evidence pointers, committed only when a reviewer needs it to trust the result.

### Changed

- Skipped-version examples updated to the current migration chain.

### Removed

- Nothing. The subtractive review found no duplicated lines, no stale internal section references, and no obsolete tool assumption to retire. The two additions total five sentences and are phrased as outcome-level guidance so model-upgrade ablation can remove them again if default behavior catches up.

### Maintenance review

- Completed 2026-09-14 against this repository as both baseline source and audit subject.
- Trigger: a link-triggered radar triage of the `pstack` plugin in `cursor/plugins` (commit `be432a9`, 14 September 2026, version 0.15.2), a discovery-tier practitioner source per `MAINTENANCE.md`. The full radar scan of 2026-08-30 is 15 days old and within the 45-day gate.
- Triage result: five candidates. Adopted two (behavior-judged blind skill evaluation; completion check and evidence trail for unattended work) as outcome-level guidance. Adopted one as source-repository tooling only (skill frontmatter and reference validation in `scripts/verify-release.sh`), which is not baseline content. Deferred one for experiment: a project-local verification skill that drives the real application with a per-feature map, to be tried in an application repository before any baseline mention. Marked one as monitor: model diversity as an independence mechanism for review, which has no evidence beyond the source's own assertion and is tool-dependent.
- Rejected the source's shape: an always-loaded index of 23 principle skills, a requirement to name each applied principle in the reply, and verbatim playbook steps copied into a task list are the compensatory patterns v9's model-upgrade ablation removes, and the plugin is bound to one editor's mechanisms.
- Tool-specific guidance: v10 adds none and changes none. The primary-source verification recorded for v9 on 2026-08-30 stands unchanged.
- Source self-audit: scanned `BOOTSTRAP.md` for duplicated lines, stale internal section references, and stale version references. Found none beyond the skipped-version examples, which were updated. No ordinary target-repository adoption step was applied to this repository.
- Subtractive review recorded above. No deletion quota was applied. The bootstrap grew by five sentences, both additions tightening existing rules rather than adding sections.
- Evidence tier for both adoptions is discovery only. The mechanisms are stated so a repository can test them against current default behavior and remove them if they do not change outcomes.

### Philosophy

v10 tightens two existing rules and adds no new artifact, section, or vocabulary.

An evaluation is only as good as what it observes, and an unattended run is only as trustworthy as the check it was given up front. Both additions follow the baseline's existing preference for evidence over self-report and for deterministic gates over prose.

## v9 - 2026-08-30

### Added

- Model-upgrade ablation as a third ablation trigger: when the underlying models materially improve, re-run ablation across persistent instructions, skills, playbooks, agents, and orchestration, distinguishing durable repository truth from compensation for model weaknesses.
- A concrete checklist of compensatory patterns to sweep for: aggressive emphasis and repetition, defensive "if in doubt" triggers, forced self-verification steps, reasoning-echo instructions, enumerated cases a brief instruction now covers, and procedure where outcome-level guidance suffices.
- An agent-authored memory policy: harness-persisted agent memory is persistent context that must earn its cost; each repository decides explicitly whether it is enabled, audits it, and promotes durable lessons into canonical sources.
- An evaluation-first bar for skills: run a representative task without the skill first and keep it only when it demonstrably outperforms default behavior; keep rosters small, descriptions precise, and references one level deep.
- A preference for conditionally loaded scoped rules over always-loaded root-file content for subsystem-specific conventions, where tooling supports them.
- Inspection, review, placement, and verification entries for the above.

### Changed

- The root instruction file size target is now grounded in current vendor guidance (under 200 lines per always-loaded file, with reduced adherence beyond) and instruction-following behavior, rather than stated as taste; the stricter under-100-line default is unchanged.
- The trimming criterion is explicit: cut what a capable agent can derive from the codebase; keep pitfalls, rationale, and conventions that differ from tool defaults.
- The final report now scales to the size of the audit instead of demanding full ceremony from small repositories.
- Skipped-version examples updated to the current migration chain.

### Removed

- The sixteen-principle seed list for `AI_ENGINEERING_PLAYBOOK.md`. Generic engineering methodology is default behavior for current capable models, and vendor guidance warns that over-prescriptive instruction can degrade output. The playbook section itself remains for repositories with demonstrated recurring need. Existing playbooks are re-ablated during upgrade, not mechanically deleted.
- Five of nine generic-statement examples in section 5.2 and six redundant entries in the section 2 mechanism search list. No semantic change.

### Maintenance review

- Completed 2026-08-30 against this repository as both baseline source and audit subject.
- Radar scan completed 2026-08-30. Reviewed current primary documentation for Anthropic Claude 5-generation prompting guidance, Claude Code memory, rules, skills, and plugins, Agent Skills authoring guidance, and the `AGENTS.md` convention. Surveyed instruction-following and long-context research and skills benchmarks as evidence-tier candidates.
- Verified by direct fetch on 2026-08-30: the Claude Code memory documentation (instruction files are context, not enforced configuration; under-200-line target; `.claude/rules/` conditional loading; automatic memory on by default; the `@AGENTS.md` import as the documented compatibility pattern), the Claude Fable 5 prompting guide (re-evaluate instructions on capability improvements; prior-model skills often too prescriptive and can degrade output; audit for reasoning-echo instructions), and the Agent Skills authoring best practices (evaluations before documentation; references one level deep; description-driven selection).
- Evidence-tier candidates (instruction-count adherence decay, long-context degradation, curated-skill benchmarks) were corroborated through secondary sources only; they informed emphasis, and no numeric claim from them was added to the baseline. Adopting specific figures is deferred pending primary verification.
- Deferred candidate: packaging the upgrade audit as a distributable Agent Skills procedure (`SKILL.md` adapter). Deferred so the v9 text stabilizes first; it failed pre-creation ablation only on timing, not on value.
- Subtractive review recorded: the playbook seed list and redundant examples were removed; the additions are the model-upgrade ablation, the memory policy, and the skills bar. No deletion quota was applied. The bootstrap grew by a small net amount, explained by the two new policy areas; the removals are semantic, not cosmetic.
- Confirmed the `@AGENTS.md` compatibility example and the Agent Skills `SKILL.md` recommendation against current documentation; the adapter pattern is now vendor-documented verbatim.
- Pre-merge self-audit pass: fixed a stale v8 internal reference that pointed the pre-creation ablation question to section 1 instead of section 11, and aligned the provenance-marker example with the quoting used in `templates/.ai-engineering.yml`.

### Philosophy

v9 separates **durable repository truth** from **compensation for model weaknesses**.

Commands, boundaries, invariants, and non-obvious facts age well. Emphasis, repetition, defensive triggers, and prescriptive procedure expire as models improve — and current vendor guidance states they can actively degrade the output of newer models. A capability jump in the underlying models is therefore an explicit ablation trigger, not background news. The baseline's job is unchanged: the smallest amount of durable context that reliably produces excellent engineering work.

## v8 - 2026-08-13

### Added

- Cross-checkout coordination as a distinct concern from local write isolation.
- Guidance to use a shared coordination surface when meaningful work spans people, machines, checkouts, cloud environments, or independent agent tools.
- A minimal discover, claim, isolate, publish, integrate, and release protocol for work with realistic overlap risk.
- One active writer per branch as the default, with explicit ownership or sequencing for overlapping change areas.
- Guidance for visible handoff, abandonment, and stale-work handling.
- Proportional evaluation of protected branches, required pull requests, checks, reviews, code ownership, and merge queues.
- Inspection, context-placement, mechanical-enforcement, verification, reporting, and ablation entries for cross-checkout coordination.
- A source-repository maintenance runbook covering monthly radar, quarterly self-audit, subtractive review, and the release gate.
- A deterministic local and CI check for version consistency, migration continuity, provenance-template consistency, and required maintenance evidence.

### Changed

- Repository inspection now covers shared task and pull-request state, task claims, branch ownership, handoff conventions, stale work, and integration rules.
- The agent-environment review now asks whether ownership and status are visible across machines and agent tools when needed.
- Local worktrees, sessions, plans, unpushed branches, and lock files are explicitly insufficient as the only coordination signal for cross-machine or cross-tool work.
- Coordination requirements now scale to realistic collision and duplicate-work risk; trivial or genuinely solo work does not require artificial issues or pull requests.
- Baseline releases now require a recent radar, explicit source self-audit, subtractive review, and recorded maintenance evidence.

### Removed

- A duplicate copy of the pre-creation ablation question from the core-principles section. Section 11 remains the canonical procedure.
- No v7 capability or recommendation was removed.

### Maintenance review

- Completed 2026-08-13 against this repository as both baseline source and audit subject.
- Reviewed current primary documentation and changelogs for OpenAI/Codex, Anthropic/Claude Code, GitHub/Copilot and Actions, the Model Context Protocol, and Agent Skills. No additional baseline change was justified for v8.
- Confirmed the Claude Code `@AGENTS.md` compatibility example, the Agent Skills `SKILL.md` recommendation, and `actions/checkout@v7`; no stale example syntax was found.
- Consolidated the duplicated pre-creation ablation wording into its existing canonical section. No deletion quota was applied, and no other removal survived the evidence and clarity review.
- Added one read-only monthly maintenance automation; January, April, July, and October runs include the quarterly source self-audit. It cannot edit, version, branch, commit, open issues or pull requests, or release.
- Retained `MAINTENANCE.md`, the verification script, and its CI workflow after pre-creation ablation: the runbook keeps source-only maintenance out of the target baseline, while the small script and workflow enforce release evidence that prose alone cannot guarantee.
- No candidate was deferred.

### Philosophy

v8 separates **where work happens safely** from **how others know the work is happening**.

It does not add a required tracker, lock service, agent registry, or orchestration framework. Existing shared development platforms remain the preferred coordination layer, native agent capabilities remain the preferred local isolation layer, and low-risk repositories may validly adopt no new artifact.

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
