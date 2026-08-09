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

## Release invariant

A baseline version must not be advanced unless all of the following agree:

1. `BOOTSTRAP.md`
2. `VERSION`
3. `CHANGELOG.md`
4. the migration guide from the previous version

If one is missing or inconsistent, the release is incomplete.

## Editing principles

- Prefer current primary-source documentation for agent-tool behavior when internet access is available.
- Preserve the bootstrap's tool-agnostic core where practical.
- Put tool-specific behavior in the bootstrap only when it materially affects repository setup decisions.
- Prefer native agent capabilities over custom orchestration or compatibility infrastructure where sufficient.
- Do not add permanent complexity because a tool supports it.
- Every persistent instruction must earn its context cost.
- Every permanent agent, stage, delegation rule, or coordination boundary must earn its coordination cost.
- Treat new industry terminology as a prompt to test an underlying engineering principle, not as a reason to add a section by name.

## Baseline upgrades

A project upgrade is an audit, not a synchronization operation.

Migration guidance must tell an upgrade agent what changed, what to reassess, and what not to overwrite blindly.

Do not require participating repositories to mirror this repository's files or structure.

## Verification before declaring a release complete

Check:

- version consistency
- broken internal references
- contradictions and duplication
- stale tool assumptions
- unsupported example syntax
- unnecessary verbosity
- whether new orchestration complexity is justified
- whether migration guidance is sufficient to upgrade an older participating repository without replaying the full history

## Public scope

This repository may be consumed by external users and coding agents.

Keep examples generic and portable. Do not assume access to private repositories, private tooling, internal infrastructure, or personal context.

## Safety

Do not store project-specific domain facts, secrets, credentials, production configuration, personal data, or task-specific context here.
