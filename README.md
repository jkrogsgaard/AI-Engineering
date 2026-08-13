# AI Engineering

> **For AI coding agents:** If you were pointed to this repository to set up or upgrade another repository, read `BOOTSTRAP.md` first and apply it to your current working repository. Treat it as an audit, not a template. Do not modify this baseline repository unless explicitly asked to do so.

A canonical, versioned baseline for setting up repositories for effective AI-assisted engineering.

The goal is not to copy one fixed repository structure everywhere. The goal is to give each repository the smallest amount of durable context, documentation, tooling, and orchestration that reliably improves engineering work.

## Quick start

Give your coding agent this prompt:

```text
Set up or upgrade this repository using the latest AI Engineering Bootstrap:

https://github.com/jkrogsgaard/AI-Engineering
```

That should be sufficient when the agent can read the repository. The README directs the agent to the canonical `BOOTSTRAP.md`, which then tells it how to inspect and improve the current working repository.

If the agent cannot access external GitHub repositories or the internet, provide `BOOTSTRAP.md` and the relevant migration guides directly instead.

Use the same prompt for new and existing repositories. The bootstrap adapts the setup to the repository instead of requiring one fixed structure.

## Current baseline

See `VERSION` for the current baseline version and `BOOTSTRAP.md` for the canonical bootstrap prompt.

Current version: **v8**.

## Repository model

- `BOOTSTRAP.md` contains the latest canonical baseline.
- `VERSION` contains the current baseline number.
- `CHANGELOG.md` summarizes material changes between baseline versions.
- `migrations/` contains adjacent semantic upgrade guides between versions.
- `templates/.ai-engineering.yml` is the recommended project-side provenance marker.
- `AGENTS.md` contains maintenance rules for this repository itself.
- `MAINTENANCE.md` contains the source-repository radar, self-audit, and subtractive-release procedure.
- `scripts/verify-release.sh` verifies the release invariant and maintenance gate locally and in CI.

## How projects consume the baseline

Projects should not blindly copy future baseline changes into their local AI instructions.

Instead, each participating repository should record the baseline version and exact upstream source commit it was last reviewed against. When a new baseline is released, perform an upgrade audit:

1. identify the repository's current recorded baseline
2. read the relevant migration notes through the current version
3. compose the migration guidance into the desired current target state
4. inspect the repository's current AI engineering setup
5. apply only changes that materially improve that repository
6. preserve project-specific facts, rules, evidence-backed practices, and superior local solutions
7. verify and ablate the resulting setup
8. update the repository's baseline marker only after the review succeeds

The baseline version is therefore a **review provenance marker**, not a guarantee that every repository contains identical files.

### Skipped versions

Migration guides are adjacent and composable.

A repository moving from v5 directly to v8 should read `v5-to-v6`, `v6-to-v7`, and `v7-to-v8` in order, then perform one focused audit of the net target state.

Do not mechanically recreate obsolete intermediate states. If an earlier migration adds something that a later migration changes or removes, reason about the final current state and make only the changes that still matter.

## Design principles

- one canonical baseline
- thin project-specific adoption
- semantic upgrades rather than blind synchronization
- pre-creation and final ablation
- deterministic enforcement over prose where practical
- deterministic control flow for stages that must not be skipped
- native agent capabilities over custom infrastructure where sufficient
- the simplest sufficient execution topology
- shared task ownership when work spans checkouts, machines, or agent tools
- every persistent instruction must earn its context cost
- every delegation and coordination boundary must earn its coordination cost

## Releasing a new baseline

A new baseline version should update, at minimum:

1. `BOOTSTRAP.md`
2. `VERSION`
3. `CHANGELOG.md`
4. the relevant adjacent migration guide, for example `migrations/v7-to-v8.md`
5. `templates/.ai-engineering.yml`

Do not advance the version unless the baseline, migration guidance, changelog, and provenance template describe the same release.

Before release, follow `MAINTENANCE.md`, complete the source self-audit and subtractive review, record `Removed` and `Maintenance review` in the changelog, and run:

```sh
./scripts/verify-release.sh
```

Once a baseline has been adopted by a participating project, treat that baseline version as immutable. Further semantic changes belong in the next baseline version.

## License

MIT. See `LICENSE`.
