---
name: ai-engineering-upgrade
description: >-
  Runs the AI Engineering baseline audit for the current repository: reads the
  .ai-engineering.yml provenance marker, fetches the canonical baseline
  (jkrogsgaard/AI-Engineering) at an exact commit, composes the adjacent
  migration guides, audits the repository against the net target state, and
  updates the marker only after verification. Use whenever the user asks to set
  up, bootstrap, upgrade, audit, or re-review a repository against the AI
  Engineering baseline or bootstrap, mentions .ai-engineering.yml or a baseline
  version ("we're on v7"), or points at the AI-Engineering repository — even
  phrased casually ("run the bootstrap", "opdater baseline", "kør en
  baseline-audit").
license: MIT
---

# AI Engineering baseline audit

This skill is a thin adapter over the canonical bootstrap. The fetched
`BOOTSTRAP.md` carries the actual audit instructions; the skill supplies the
procedure around it: pin an exact upstream snapshot, compose the right
migration guides, and record provenance honestly. Do not restate or improvise
the bootstrap's content from memory — memory of it goes stale the moment a new
baseline is released.

## Guard: never run target adoption on the baseline source

If the working repository contains `BOOTSTRAP.md`, `MAINTENANCE.md`, and
`templates/.ai-engineering.yml` together, it IS the baseline source
repository. Stop and say so. The source repository is maintained per its own
`MAINTENANCE.md`; ordinary adoption steps must not be applied to it (no root
`.ai-engineering.yml`, no instruction files created merely because the
bootstrap describes them).

## Procedure

Copy this checklist and check items off as you go:

```
Baseline audit progress:
- [ ] 1. Read local provenance
- [ ] 2. Fetch upstream snapshot at an exact commit
- [ ] 3. Determine mode (first bootstrap / upgrade / current)
- [ ] 4. Run the audit from the fetched BOOTSTRAP.md
- [ ] 5. Verify
- [ ] 6. Update the marker
- [ ] 7. Report and clean up
```

### 1. Read local provenance

Read `.ai-engineering.yml` at the repository root. Capture `version` and
`source_commit`.

No marker means this is a first bootstrap, not an upgrade (see step 3).

### 2. Fetch upstream snapshot at an exact commit

```bash
tmp=$(mktemp -d)
git clone --depth 1 https://github.com/jkrogsgaard/AI-Engineering.git "$tmp/baseline"
SNAPSHOT_SHA=$(git -C "$tmp/baseline" rev-parse HEAD)
cat "$tmp/baseline/VERSION"
```

Everything read in later steps comes from this one snapshot, so the content
audited and the `source_commit` recorded cannot drift apart.

If the clone fails (no network, no access), stop and ask the user to supply
`BOOTSTRAP.md`, `VERSION`, the relevant `migrations/` guides, and the exact
upstream commit they correspond to. Never audit from memory of the baseline,
and never guess or fabricate a commit.

### 3. Determine mode

Compare the recorded version with the fetched `VERSION`:

- **First bootstrap** (no marker): the audit input is `BOOTSTRAP.md` alone.
- **Upgrade** (recorded < upstream): read every adjacent migration guide in
  `migrations/`, from `v<recorded>-to-v<recorded+1>` through the current
  version, in order. Compose their net effect (Added, Changed, Removed,
  Reassess, Preserve, Verification). Do not replay obsolete intermediate
  states — audit once against the net target.
- **Current** (recorded == upstream): report that the repository is up to
  date. A re-review is still valid when asked for — in particular, the
  bootstrap's model-upgrade ablation applies whenever the models in use have
  materially improved since `last_reviewed`, whatever the baseline version
  says. Offer it rather than manufacturing changes.
- **Recorded > upstream**: something is wrong (a hand-moved marker or an
  unpublished baseline). Stop and report; do not "downgrade" the repository.

### 4. Run the audit from the fetched BOOTSTRAP.md

Read `$tmp/baseline/BOOTSTRAP.md` and follow it as the canonical audit
instructions. In upgrade mode, the composed migration guidance steers what to
reassess, preserve, and remove.

The bootstrap's own rules govern everything here — inspect before changing,
ablate before creating, preserve project-specific truth. Two reminders for the
cases upgrades most often get wrong:

- "Little to change" is a valid audit result. Do not manufacture changes to
  justify the run.
- Preserve hard boundaries, verified commands, domain invariants, and
  evidence-backed local practices. Test compensatory-looking instructions
  against current default behavior before removing them; emphatic is not the
  same as expired.

### 5. Verify

Apply the bootstrap's verification section, scaled to the size of the audit.
Where the audit touched documented commands, verify them against repository
configuration and run them where practical.

### 6. Update the marker

Only after the audit and verification succeed, write `.ai-engineering.yml` at
the repository root following the format of
`$tmp/baseline/templates/.ai-engineering.yml`:

- `version`: the fetched `VERSION`
- `source_commit`: `$SNAPSHOT_SHA` — the full 40-character commit, never a
  branch name
- `last_reviewed`: today's date

If the audit did not complete or verification failed, leave the marker
untouched and report why.

### 7. Report and clean up

Report per the bootstrap's final-output section, scaled to the audit. Remove
the temporary clone (`rm -rf "$tmp"`).

Committing the resulting changes follows the host repository's and the
session's normal conventions; this skill does not push branches or open pull
requests on its own.
