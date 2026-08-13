# Baseline maintenance

This runbook maintains the AI Engineering Bootstrap source repository.

It is not part of the bootstrap that participating repositories adopt.

## Boundaries

- `BOOTSTRAP.md` remains the canonical baseline for target repositories.
- Maintenance work must not turn this repository into an ordinary bootstrap target.
- Research, radar, and self-audit start read-only.
- No radar or scheduled task may edit files, advance `VERSION`, create a release, or open a pull request automatically.
- A baseline release remains an explicit reviewed decision.

## Source tiers

Prefer sources in this order.

### Primary

- official OpenAI and Codex documentation and changelogs
- official Anthropic and Claude Code documentation and changelogs
- official GitHub and Copilot documentation and changelogs
- the Model Context Protocol specification and maintainer changelog
- the Agent Skills specification
- official specifications and vendor documentation for other tools materially used by the baseline

### Evidence

- reproducible benchmarks
- research papers with inspectable methods
- engineering reports with concrete implementation evidence
- public repositories or experiments that allow the claim to be tested

### Discovery

- practitioner blogs
- conference talks
- Medium posts
- X, Reddit, and other social posts
- links submitted by maintainers or users

Discovery sources identify candidates. They do not establish baseline guidance without stronger evidence or a clearly disclosed experiment.

## Monthly radar

Run a read-only scan on the first weekday of each month.

For each material candidate, record:

- source and publication date
- concrete claim rather than industry terminology alone
- affected baseline section or repository-maintenance rule
- whether the claim is primary, evidenced, or discovery-only
- expected benefit and coordination, context, or maintenance cost
- whether it supersedes or weakens existing guidance
- a disposition: ignore, monitor, experiment, adopt, or remove

Deduplicate candidates by underlying claim, not only by URL.

Report explicitly when no material change was found. Do not create repository churn merely to prove that the radar ran.

Links supplied between scheduled scans enter the same triage process.

## Quarterly source self-audit

Run a read-only self-audit on the first weekday of January, April, July, and October, and once more against every release candidate before publication.

The invocation must explicitly say that this repository is both the baseline source and the audit subject.

During source self-audit:

- evaluate the current repository against the principles in `BOOTSTRAP.md`
- treat `AGENTS.md`, this runbook, the release invariant, migrations, and templates as source-repository requirements
- prioritize contradictions, duplication, obsolete guidance, stale tool assumptions, unnecessary verbosity, and opportunities to remove or consolidate content
- report findings before editing
- do not apply ordinary target-repository adoption steps
- do not create a root `.ai-engineering.yml`
- do not treat `templates/` as active project configuration
- do not create project instruction files, skills, playbooks, or context documents merely because the bootstrap describes them
- do not advance the baseline version or provenance marker as a consequence of self-audit

If changes are approved, apply them on an isolated branch or worktree and rerun the release verification.

## Subtractive release review

Before every baseline release, inspect every persistent instruction and artifact as if it were proposed today.

Record:

- content removed as obsolete, duplicated, misplaced, or inferable
- content consolidated into an existing source of truth
- proposals deliberately not added because they failed pre-creation ablation
- retained tool-specific guidance and the primary source used to revalidate it
- every new persistent artifact and why the existing repository could not provide the same value

There is no deletion quota. A release may add more than it removes, but unexplained monotonic growth fails the review.

## Release gate

A baseline release is incomplete until all of the following are true:

1. a radar scan no older than 45 days has been reviewed
2. current tool-specific guidance has been checked against primary sources
3. the release candidate has completed a source self-audit
4. the subtractive review has been recorded
5. the current `CHANGELOG.md` entry contains `Removed` and `Maintenance review` sections
6. all findings marked adopt or remove have been resolved or explicitly deferred
7. `scripts/verify-release.sh` passes locally and in CI
8. the release invariant in `AGENTS.md` passes

The maintenance review should record its date, sources checked, self-audit result, material removals or the reason none were justified, and any deferred candidate.

## Automation behavior

Scheduled radar and self-audit tasks are triggers and reviewers, not release agents.

They must:

- remain read-only
- report evidence and uncertainty
- avoid duplicate candidates
- leave semantic decisions to the reviewed release workflow
- fail visibly when required sources cannot be checked

Automation history is operational evidence. The durable release decision belongs in the changelog and pull-request review.
