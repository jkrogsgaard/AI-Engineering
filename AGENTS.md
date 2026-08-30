# AI Engineering repository instructions

This repository is the canonical source for the versioned AI Engineering Bootstrap.

## Purpose

Maintain a small, durable baseline for improving AI-assisted engineering setups across multiple repositories.

Do not turn this repository into a project-specific instruction set or a catalogue of every possible agent technique.

## Source of truth

- `BOOTSTRAP.md` is the canonical current bootstrap.
- `VERSION` is the canonical current baseline number.
- `CHANGELOG.md` records material baseline changes.
- `migrations/` explains semantic upgrades between versions.
- `templates/` contains small adoption templates, not generated copies of project instructions.
- `skills/` contains distributable agent procedures that are thin adapters over the bootstrap, not baseline content. Changing them does not require a baseline release, and they must not duplicate bootstrap guidance.
- `MAINTENANCE.md` is the source-repository radar, self-audit, and subtractive-release runbook.

## Release invariant

A baseline version must not be advanced unless all of the following agree:

1. `BOOTSTRAP.md`
2. `VERSION`
3. `CHANGELOG.md`
4. the migration guide from the previous version
5. `templates/.ai-engineering.yml`

If one is missing or inconsistent, the release is incomplete.

Once a baseline version has been adopted by a participating project, treat that version as immutable. Further semantic changes belong in the next baseline version.

## Maintenance gate

Before advancing a baseline, follow `MAINTENANCE.md`.

The current changelog entry must record both a `Removed` review and a `Maintenance review`. A release candidate must complete an explicit source self-audit without applying ordinary target-repository adoption steps to this repository.

Run `scripts/verify-release.sh` before declaring the release complete. The same check must pass in CI.

## Editing principles

- Prefer current primary-source documentation for agent-tool behavior when internet access is available.
- Preserve the bootstrap's tool-agnostic core where practical.
- Put tool-specific behavior in the bootstrap only when it materially affects repository setup decisions.
- Prefer native agent capabilities over custom orchestration or compatibility infrastructure where sufficient.
- Do not add permanent complexity because a tool supports it.
- Every persistent instruction must earn its context cost.
- Every permanent agent, stage, delegation rule, or coordination boundary must earn its coordination cost.
- Apply ablation before creating new persistent infrastructure as well as after a setup is complete.
- Treat new industry terminology as a prompt to test an underlying engineering principle, not as a reason to add a section by name.

## Baseline upgrades

A project upgrade is an audit, not a synchronization operation.

Migration guidance must tell an upgrade agent what changed, what to reassess, what to preserve, what was removed, and how to verify the target state.

For skipped baseline versions, keep adjacent migration guides canonical. An upgrade agent should read every guide from the repository's recorded version through the current version in order, compose their net effect, and perform one current-state audit.

Do not require projects to replay obsolete intermediate states or create temporary infrastructure merely because an earlier migration once introduced it.

Do not require participating repositories to mirror this repository's files or structure.

## Provenance

The standard project-side marker should record both:

- the human-readable baseline version
- the exact immutable upstream `source_commit` reviewed

Do not guess historical source commits when reliable evidence is unavailable.

## Verification before declaring a release complete

Check:

- version consistency
- migration-chain continuity
- provenance-template consistency
- broken internal references
- contradictions and duplication
- stale tool assumptions
- unsupported example syntax
- unnecessary verbosity
- whether new persistent artifacts survive pre-creation ablation
- whether new orchestration complexity is justified
- whether migration guidance is sufficient to upgrade an older participating repository without replaying obsolete intermediate states
- whether the latest radar, source self-audit, and subtractive release review satisfy `MAINTENANCE.md`
- whether `scripts/verify-release.sh` passes

## Public scope

This repository may be consumed by external users and coding agents.

Keep examples generic and portable. Do not assume access to private repositories, private tooling, internal infrastructure, or personal context.

## Safety

Do not store project-specific domain facts, secrets, credentials, production configuration, personal data, or task-specific context here.
