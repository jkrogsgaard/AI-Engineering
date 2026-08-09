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

If the agent cannot access external GitHub repositories or the internet, provide `BOOTSTRAP.md` directly instead.

Use the same prompt for new and existing repositories. The bootstrap adapts the setup to the repository instead of requiring one fixed structure.

## Current baseline

See `VERSION` for the current baseline version and `BOOTSTRAP.md` for the canonical bootstrap prompt.

Current version: **v5**.

## Repository model

- `BOOTSTRAP.md` contains the latest canonical baseline.
- `VERSION` contains the current baseline number.
- `CHANGELOG.md` summarizes material changes between baseline versions.
- `migrations/` contains semantic upgrade guides between versions.
- `templates/.ai-engineering.yml` is the recommended project-side provenance marker.
- `AGENTS.md` contains maintenance rules for this repository itself.

## How projects consume the baseline

Projects should not blindly copy future baseline changes into their local AI instructions.

Instead, each participating repository should record the baseline version it was last reviewed against. When a new baseline is released, perform an upgrade audit:

1. identify the repository's current baseline version
2. read the relevant migration notes
3. inspect the repository's current AI engineering setup
4. apply only changes that materially improve that repository
5. preserve project-specific facts, rules, and superior local solutions
6. verify and ablate the resulting setup
7. update the repository's baseline marker only after the review succeeds

The baseline version is therefore a **review provenance marker**, not a guarantee that every repository contains identical files.

## Design principles

- one canonical baseline
- thin project-specific adoption
- semantic upgrades rather than blind synchronization
- deterministic enforcement over prose where practical
- native agent capabilities over custom infrastructure where sufficient
- the simplest sufficient execution topology
- every persistent instruction must earn its context cost
- every delegation and coordination boundary must earn its coordination cost

## Releasing a new baseline

A new baseline version should update, at minimum:

1. `BOOTSTRAP.md`
2. `VERSION`
3. `CHANGELOG.md`
4. the relevant migration guide, for example `migrations/v5-to-v6.md`

Do not advance the version unless the baseline and migration guidance describe the same release.

Once a baseline has been adopted by a participating project, treat that baseline version as immutable. Further semantic changes belong in the next baseline version.

## License

MIT. See `LICENSE`.
