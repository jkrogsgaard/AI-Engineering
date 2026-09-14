# Migration: v9 to v10

This is a semantic upgrade guide for repositories previously reviewed against AI Engineering Bootstrap v9.

Do not re-bootstrap the repository from scratch.

The goal is to audit the v10 delta, preserve superior local solutions, apply only changes that materially improve the repository, verify the result, and only then record v10 as the reviewed baseline.

## Material changes

v10 is a small release. It tightens two existing rules without adding any new artifact, section, or vocabulary.

1. **Skill evaluations are judged on behavior, and kept blind where practical.** v9 introduced the evaluation-first bar for skills. v10 says how the evaluation is judged: on what the agent did (files read, commands run, artifact produced), not on what it reported, and with the evaluated run reading like an ordinary task rather than a test.
2. **Unattended work states its completion check up front and leaves an evidence trail.** v9 already required failures to be visible to the orchestrator. v10 extends that to work a person reviews only afterwards: the completion condition is a check that can pass or fail, stated before the work starts and never relaxed, and each decision points at its evidence.

### Evidence

Both changes entered through the link-triggered radar triage described in `MAINTENANCE.md`. The source is the `pstack` plugin in `cursor/plugins` (commit `be432a9`, 14 September 2026), a discovery-tier practitioner source. The underlying mechanisms are testable engineering claims rather than terminology:

- an agent that knows it is being evaluated behaves differently, so a self-reported "I followed the skill" is weaker evidence than the transcript of what it opened and ran
- a run without a pass-or-fail completion check can substitute motion for a result, and a run without an evidence trail forces the reviewer to reconstruct the work instead of auditing it

No numeric claim from the source appears in the baseline. Both additions are phrased as outcome-level guidance so they can be removed again under model-upgrade ablation if default behavior catches up.

## Added

### Behavior-judged, blind skill evaluation (section 5.7)

Judge a skill evaluation on the agent's observable actions and artifact, not its self-report. Where practical, keep the evaluated run blind: the task reads like an ordinary request and does not reveal that a skill is under test.

### Completion check and evidence trail for unattended work (section 5.9)

For work that runs unattended and is reviewed afterwards: state the completion condition as a check that can pass or fail before starting, never relax it to declare the work done, and leave a task-scoped trail of decisions with evidence pointers. Commit the trail only when a reviewer needs it to trust the result.

## Changed

### Skipped-version examples (sections 12 and README)

Updated to the current migration chain. No semantic change.

## Removed

Nothing was removed from the baseline in v10.

The subtractive review found no duplicated lines, no stale internal section references, and no obsolete tool assumption to retire. The two additions total five sentences. v10 does not deprecate any v9 guidance.

## Reassess

For a v9 repository, review these areas without assuming they require changes.

### 1. Existing skill evaluations

If the repository keeps evaluation records for its skills, check how they were judged. A record that rests on the agent's own claim of having followed the skill is weaker than one that rests on the transcript and the artifact. Re-run the evaluation only where the verdict would plausibly change.

### 2. Unattended or autonomous work

If the repository's agents run tasks that a person reviews only afterwards (scheduled runs, overnight jobs, long loops), check that such tasks state a pass-or-fail completion condition before they begin and leave an evidence trail a reviewer can follow. This is task-scoped practice, not a new persistent artifact.

## Preserve

Do not downgrade or remove:

- all v9 guidance, including the evaluation-first bar, the model-upgrade ablation, the agent-authored memory policy, and the scoped-rules preference
- project-specific invariants, hard boundaries, verified commands, and domain facts
- any local evaluation or decision-trail practice that is already stronger than the v10 wording

## Verification

Before recording v10:

1. inspect the current repository and existing AI setup
2. review the v9 to v10 delta
3. check how existing skill evaluations were judged and re-run only where the verdict would plausibly change
4. check that unattended work states a pass-or-fail completion condition and leaves an evidence trail
5. verify that no hard boundary, verified command, or domain invariant was removed
6. perform final instruction, artifact, and orchestration ablation
7. verify the exact upstream AI-Engineering commit reviewed
8. update the provenance marker to version 10 and that `source_commit` only after the audit succeeds

A valid v10 audit can conclude that nothing changes: a repository without skill evaluations or unattended runs records the review and moves on.

## Skipping directly to a later baseline

This migration is designed to be composed with adjacent migrations before and after it.

A repository moving from v8 directly to a later baseline should read `v8-to-v9`, this `v9-to-v10` guide, and every subsequent adjacent guide through the target version, determine the net desired current state, and perform one focused upgrade audit.

Do not replay obsolete intermediate states.

## Completion criteria

A repository can be marked as reviewed against v10 when:

1. the v10 delta has been considered
2. existing skill evaluations have been checked for how they were judged
3. unattended work, where it exists, has a stated completion check and an evidence trail
4. durable truth is intact
5. intentional deviations or important uncertainty are reported
6. the provenance marker, when used, records version 10 and the exact upstream source commit only after the review succeeds
