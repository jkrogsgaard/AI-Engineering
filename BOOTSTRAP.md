# AI Engineering Bootstrap

**Baseline version: v9**

## Target repository

Apply these instructions to the repository you are currently working in.

This AI-Engineering repository is the baseline source, not the target repository, unless the user explicitly says otherwise.

If the target repository already records an older AI Engineering baseline, treat this as an upgrade audit.

Before changing anything, read the adjacent migration guides from the recorded version through v9. If several versions were skipped, compose their guidance into the desired current target state. Do not mechanically replay obsolete intermediate states.

## Set up this repository for effective AI-assisted engineering

I want this repository to be easy, safe, and efficient for modern AI coding agents to work in over time.

Your task is to inspect the repository and establish or improve its AI engineering setup.

This prompt must work for both:

- a new or mostly empty project
- an existing production repository with established conventions, documentation, agent instructions, and automation

Do not blindly implement the structure below.

Treat it as my preferred starting point, not as an immutable specification.

Use your engineering judgment. Think critically about the setup, challenge assumptions, and simplify wherever possible.

If current best practice from the relevant agent tooling differs materially from this proposal, prefer the better current approach and explain the difference.

When internet access is available, check current primary-source documentation for the coding agents and tooling relevant to this repository. Prefer official documentation from the tool vendors and current specifications over community folklore, remembered conventions, blog posts, or outdated examples.

The goal is not to create the largest or most comprehensive collection of AI instructions.

The goal is:

> The smallest amount of durable context, documentation, tooling, and orchestration that reliably produces excellent engineering work in this repository.

---

# 1. Core principles

Persistent AI instructions should focus on information the agent cannot reliably infer, important project-specific constraints, recurring failure modes, and hard boundaries.

Do not use persistent context to teach capable coding agents generic software engineering unless a specific instruction demonstrably improves behavior in this repository.

Prefer deterministic enforcement over prose where practical.

Every persistent instruction should earn its context cost.

Every persistent file or compatibility layer should earn its maintenance cost.

Every delegation, execution stage, and coordination boundary should earn its coordination cost.

Ablate before creating, after creating, and again when the underlying agent models materially improve. Instructions written to compensate for a weaker model generation expire.

Apply the pre-creation, final, and model-upgrade ablation procedures in section 11.

---

# 2. Inspect before changing anything

First inspect the repository.

Do not create, replace, or substantially rewrite agent instruction files before understanding what already exists.

Inspect enough of the repository to understand:

- repository structure
- languages and frameworks
- package or workspace structure
- applications and services
- build system
- development commands
- test commands
- linting
- formatting
- type checking
- CI/CD
- deployment setup
- environments
- configuration
- architecture documentation
- domain documentation
- security documentation
- migrations
- scripts
- existing runbooks
- existing skills
- existing hooks
- existing AI-agent instructions
- nested, scoped, or conditionally loaded instruction files
- agent-authored memory or automatic note-taking state
- existing sub-agents or custom agents
- existing execution plans or planning conventions
- MCP or external tool configuration
- agent permissions and sandboxing
- worktree, branch, sandbox, or other task-isolation mechanisms
- shared task, issue, pull-request, or other cross-checkout coordination mechanisms
- task-claiming, branch-ownership, handoff, and stale-work conventions
- default-branch protection and integration rules
- existing orchestration or delegation rules
- an existing AI Engineering provenance marker

Search specifically for existing mechanisms such as:

- `AGENTS.md`
- `CLAUDE.md`
- `.claude/`, including `.claude/rules/` and `.claude/agents/`
- `.codex/`
- `.cursor/rules/`
- skills
- Copilot instructions
- Cursor rules
- Codex instructions
- execution-plan conventions such as `PLANS.md`
- MCP configuration
- orchestration or delegation instructions
- README files
- ADRs
- architecture docs
- contribution guides
- runbooks
- `.ai-engineering.yml` or equivalent provenance

Inspect package manifests, configuration files, scripts, CI definitions, and other authoritative sources to verify important commands instead of copying potentially stale documentation.

For an existing repository, preserve useful project knowledge even if its current placement is poor.

Do not reorganize the repository merely to match this proposal.

---

# 3. Determine the repository's actual needs

Before editing files, determine what the repository actually needs.

## Repository type

Identify whether this is primarily:

- a small single-service repository
- a frontend application
- a backend application
- a full-stack application
- a library
- a monorepo
- an infrastructure repository
- a data project
- an AI or agent system
- something else

## Agent environment and execution capabilities

Determine which AI coding tools the repository currently uses or is likely to use.

Do not assume all coding agents interpret repository instructions identically.

When internet access is available, verify current behavior using primary documentation for the relevant tools.

This may include:

- OpenAI Codex
- Anthropic Claude Code
- Cursor
- other coding agents actually used by the repository

Also determine which execution capabilities are actually available, including where relevant:

- sub-agents or custom agents
- isolated sessions
- branches or worktrees
- scripted or programmatic orchestration of delegated work
- skills
- hooks
- MCP tools
- browser or computer-use tools
- sandbox controls
- permission controls
- execution-plan mechanisms
- persistent task state
- shared task ownership and status visible across machines and agent tools
- CI and automated verification

Do not recreate capabilities in repository instructions that the active agent harness already provides natively.

Do not add tool-specific files, custom agents, compatibility layers, or orchestration infrastructure unless they provide real value.

## Identify gaps before proposing artifacts

Describe the concrete gaps first.

Only then decide whether a persistent artifact is the smallest useful intervention.

For every proposed new file, instruction set, skill, runbook, agent definition, adapter, hook, or orchestration mechanism, apply the pre-creation ablation question from section 1.

Do not infer that a conceptual component in this bootstrap must exist physically in the repository.

---

# 4. Review existing AI instructions

Treat existing AI instructions as evidence, not automatically as truth.

Review them for:

- correctness
- duplication
- contradictions
- stale commands
- stale architecture
- outdated tooling assumptions
- generic advice modern agents no longer need
- compensatory instructions written for weaker model generations (section 11)
- task-specific context stored permanently
- procedures that belong in skills or runbooks
- durable knowledge that belongs in ordinary project documentation
- rules that should be enforced mechanically instead
- instructions that only apply to one subsystem and should be scoped more narrowly
- orchestration rules that create unnecessary complexity
- specialist agents whose responsibilities overlap
- permanent custom agents that serve only one-off tasks
- assumptions about capabilities the current agent harness already provides natively
- AI-specific context files that duplicate code or canonical project documentation

Do not delete useful instructions simply because they do not match this structure.

Consolidate duplicated guidance where practical.

Prefer one canonical source of truth with thin compatibility layers over several divergent copies.

---

# 5. Preferred information architecture

Use the following as a default conceptual model.

Change it when the repository or current tooling provides a simpler or better solution.

None of these components is mandatory merely because it appears here.

---

## 5.1 `AGENTS.md`

Prefer `AGENTS.md` as the canonical cross-agent repository instruction file when the active tooling supports it well.

If another native mechanism is clearly superior for this repository, use that instead and keep compatibility layers thin.

Keep the root instruction file short and high-signal.

Our default target is under 100 lines where practical.

Treat 150+ lines as a signal to review whether content should be removed, scoped, moved to documentation, or moved into a skill.

This target is grounded, not taste: current vendor guidance targets under 200 lines for an always-loaded instruction file and warns that longer files reduce adherence, and instruction-following research finds compliance degrades as concurrent rules accumulate. Aim below the vendor ceiling, not at it.

Tool-specific documented limits or recommendations take precedence.

`AGENTS.md` should primarily contain information an AI coding agent needs during a large proportion of engineering tasks in this repository.

Typical content may include:

### Project

A very short description of:

- what the project does
- its primary architecture
- major components

Only include this when it materially improves orientation.

### Repository structure

Document only non-obvious structure.

Do not restate self-explanatory directory names.

### Verified commands

Include exact commands for relevant operations such as:

- installation
- development
- tests
- focused tests
- linting
- formatting
- type checking
- build
- important local services

Verify commands from repository configuration and, where practical, by executing them.

Do not invent commands.

### Architecture boundaries

Include important non-obvious boundaries such as:

- service ownership
- data ownership
- source-of-truth rules
- dependency direction
- forbidden cross-layer access
- generated-code boundaries

### Domain invariants

Include important rules that must remain true and cannot reliably be inferred from generic engineering knowledge.

### Project conventions

Include only unusual or important conventions that agents are likely to get wrong.

### Safety and hard boundaries

Examples:

- never modify production data directly
- never commit secrets
- never bypass tenant isolation
- specific generated files must not be edited
- a subsystem is read-only
- a particular service or API is the source of truth

### Relevant documentation

Point to deeper documentation instead of duplicating it.

### Project-specific verification

Include verification requirements only when they are specific to this project or repeatedly prevent errors.

---

## 5.2 What should NOT normally be in `AGENTS.md`

Avoid generic statements such as:

- write clean code
- think carefully
- follow SOLID
- consider security

unless a concrete version of the rule addresses a recurring observed failure in this repository.

Also avoid large amounts of:

- architecture documentation
- product documentation
- detailed procedures
- historical context
- one-off task context
- speculative future requirements
- tool-specific instructions that apply only occasionally
- detailed orchestration recipes for work that is not performed frequently

Do not use persistent context merely because information is useful somewhere.

Use persistent context only when it is useful often enough to justify always loading it.

When trimming, cut what a capable agent can derive from the codebase, such as directory layouts, dependency lists, and architecture overviews. Keep pitfalls, rationale, and conventions that differ from tool defaults.

---

## 5.3 `CLAUDE.md`

Do not maintain a second independent copy of the same repository instructions.

If Claude Code is used and current official documentation supports importing the canonical repository instructions, prefer a minimal compatibility layer.

For example, where currently supported:

```md
@AGENTS.md
```

Add Claude-specific content only when it is genuinely Claude-specific.

Use native Claude mechanisms when they are better suited, for example:

- path-scoped rules
- skills
- sub-agents
- hooks
- local settings

Before relying on syntax, imports, paths, or configuration behavior, verify them against current official Claude Code documentation.

If current recommended behavior has changed, use the current mechanism.

Keep `CLAUDE.md` concise.

Remember that imported files also enter Claude Code's context, so optimize the total loaded instruction context rather than the `CLAUDE.md` line count alone.

Do not create `CLAUDE.md` if the repository does not use Claude Code and it provides no clear value.

---

## 5.4 Other agent-specific rules

Use native mechanisms for other coding tools only where they provide real value.

Examples may include:

- Cursor rules
- nested or scoped `AGENTS.md`
- tool-specific skills
- custom or specialist agents
- local agent configuration

Prefer:

- one canonical source of shared truth
- small native adapters
- scoped rules where appropriate

Where the tooling supports it, prefer scoped rules that load conditionally, only when matching paths or files are touched. Conditional rules cost no context until they apply, which makes them the right home for subsystem-specific conventions that would otherwise inflate the root file.

Avoid maintaining several full copies of the same instructions.

---

## 5.5 `AI_ENGINEERING_PLAYBOOK.md`

Do **not** create a separate engineering playbook by default.

Create or maintain one only when the project demonstrates recurring need for reusable engineering methodology that materially improves agent performance beyond:

- the agent's native engineering capability
- project-specific instructions in `AGENTS.md`
- existing project documentation
- existing deterministic checks

Before creating or retaining the playbook, ask:

> Would a capable modern coding agent materially perform worse in this repository without this file?

If no, do not create it or remove it.

When justified, the playbook is deeper reference material and does not need to be loaded into the initial context of every task.

`AGENTS.md` may point to it for substantial engineering work.

The playbook should contain reusable engineering methodology rather than repository facts.

If a playbook is justified, seed it only with methodology this repository has demonstrably needed, phrased as brief outcome-level guidance rather than step-by-step procedure.

Do not import a generic list of software-engineering principles. Capable current models follow them by default, and over-prescriptive instruction can degrade their output.

Specialized procedures such as migrations, security reviews, browser verification, releases, incident response, or AI-specific testing usually belong in skills or runbooks rather than in the core playbook.

If an `AI_ENGINEERING_PLAYBOOK.md` is already supplied, treat it as evidence to review critically, not as protected baseline content.

Do not recreate or duplicate it from this prompt.

---

## 5.6 `docs/`

Use `docs/` for durable project knowledge that agents or humans should retrieve when relevant.

Potential documents may include:

- architecture overview
- domain model
- data model
- product concepts
- integration architecture
- security architecture
- deployment architecture
- ADRs
- operational documentation
- important external-system behavior

Do not create documents merely because these categories exist.

Only create documentation the project actually needs.

Prefer focused, discoverable documents over one enormous project encyclopedia.

Name durable project documentation for the domain or subject it explains, not merely for the fact that an AI agent may read it.

Do not create `AI_CONTEXT.md`, `AI_AGENT_CONTEXT.md`, or similar parallel context documents when the useful information already belongs in or can be retrieved from canonical product, architecture, domain, operational, security, integration, or code sources.

For larger documentation sets, consider a small index that helps agents identify the relevant document without loading everything.

Code remains the source of truth for implementation details that code expresses more clearly and reliably.

Documentation should primarily explain:

- architecture
- intent
- invariants
- trade-offs
- non-obvious behavior
- operational knowledge
- why important decisions were made

Empty architecture is not documentation.

---

## 5.7 Skills and runbooks

Use skills or runbooks for reusable multi-step procedures that matter occasionally but do not belong in every task's context.

Examples:

- database migrations
- production deployment
- dependency upgrades
- incident response
- security reviews
- browser or UI verification
- release procedures
- schema changes
- production debugging
- performance investigations
- recurring repository upgrade procedures

Prefer an open Agent Skills-compatible `SKILL.md` format when the active tooling supports it well. Multiple major agent tools now support the format natively, which makes it the default portable choice for procedures.

Do not assume one physical directory has native meaning across all agents.

Inspect the actual tools used by the repository and use their current native mechanisms.

Where several tools are supported, prefer:

- one canonical procedure
- thin tool-specific adapters where needed

rather than several divergent copies.

Apply pre-creation ablation before adding a skill or runbook merely because the procedure might someday be useful.

Before persisting a skill, evaluate it: run a representative task without the skill first, and keep the skill only when it demonstrably outperforms the agent's default behavior. Current skill-authoring guidance is to create evaluations before writing extensive documentation.

Keep the skill roster small and each description precise. Agents select skills by description, and selection is the common failure point, so spend effort on the trigger rather than the body.

Keep bundled reference material one level deep from the entry file, and reserve prescriptive step-by-step detail for fragile operations where exact sequence matters.

---

## 5.8 Task, issue, or prompt

Changing context belongs with the current task.

A substantial engineering task should normally contain:

- desired outcome
- relevant product context
- constraints
- acceptance criteria
- relevant references
- expected deliverable

Do not permanently add task-specific details to `AGENTS.md` simply because they were important once.

Write tasks primarily in terms of outcomes and constraints.

Avoid prescribing implementation details unless they are genuinely required.

Allow the coding agent to inspect the repository and recommend the best implementation.

---

## 5.9 Execution topology and orchestration

For substantial tasks, consider whether the work is best executed as:

- one agent with a short iterative loop
- one agent with isolated delegated research or verification
- several independent parallel branches with a synchronization point
- a staged workflow with explicit dependencies
- an independent implementation and review or verification step

Default to the simplest topology that can reliably complete the work.

Do not introduce multi-agent orchestration merely because the tooling supports it.

Topology describes the shape of the work. Also decide what enforces it:

- the agent's own turn-by-turn judgment
- deterministic control flow the agent cannot skip or improvise

Model-directed delegation adapts well when the right next step genuinely depends on what earlier stages found.

Deterministic orchestration guarantees that a stage runs the same way for every item, every time.

Prefer deterministic control flow when a stage must not be skipped, reordered, or applied inconsistently across many items. Verification, gating, and aggregation over many items are the usual cases.

Prefer model-directed delegation while the plan is still being discovered. Do not encode a plan in control flow before that plan is stable.

This is the existing preference for deterministic enforcement over prose, applied to execution rather than to rules.

Keep deterministic work in code. Filtering, deduplication, thresholds, routing, and aggregation between stages belong in ordinary code rather than in an additional model call. Code is exact, auditable, and free.

Fan-out multiplies cost. Scale the number of parallel workers and the depth of verification to the value of the task rather than to what the tooling permits.

Use delegation when it materially improves one or more of:

- context isolation
- independent verification
- specialization
- parallel exploration
- wall-clock time for genuinely independent work

For delegated work, prefer bounded contracts:

- clear responsibility
- relevant inputs
- expected output
- completion or acceptance condition

When delegated results are aggregated, filtered, or routed programmatically, prefer a machine-checkable output contract such as a schema over prose.

Keep orchestration logic with the orchestrator rather than duplicating the whole workflow into every worker.

Prefer parallel read-heavy work over parallel writes.

When multiple agents may modify code, define ownership or isolation boundaries and an explicit integration and verification step.

Do not create permanent custom agents for one-off tasks.

Create reusable agent definitions only when the same specialist role has recurring value.

Apply the same rule to orchestration definitions. Keep a one-off orchestration task-scoped, and persist a reusable one only when the same orchestration actually recurs.

When independent verification matters, do not contaminate the reviewer with unnecessary implementation reasoning or conclusions.

Make failures visible to the orchestrator.

Do not allow a failed branch, incomplete delegated task, missing evidence, or skipped verification step to silently resemble success.

Prefer native orchestration mechanisms provided by the active tooling over repository-specific orchestration infrastructure unless the repository has demonstrated need for something more.

For long-running or multi-stage work, use task-scoped execution plans when the active tooling provides a useful native mechanism and the plan materially improves resumability, dependency management, or verification.

Do not require an execution plan for trivial work.

---

## 5.10 Cross-checkout coordination

Isolation and coordination solve different problems.

A branch, worktree, sandbox, or isolated session prevents concurrent writers from changing the same local files. It does not tell a person or agent in another checkout, on another machine, or in another agent harness that the task is already in progress.

When a repository is actively shared across people, machines, or independent agent tools, use a coordination surface that all relevant participants can observe. Prefer the repository's existing issue tracker, pull requests, remote branches, or equivalent shared system over local agent state or new repository-specific infrastructure.

For meaningful work that could overlap:

1. **Discover** — refresh shared state without overwriting local work, then inspect relevant active tasks, pull requests, and remote branches before implementation.
2. **Claim** — record an owner, scope, status, and intended branch or change area in the shared coordination surface before substantial writing begins.
3. **Isolate** — use a dedicated branch, worktree, sandbox, or equivalent checkout. Default to one active writer per branch; require explicit synchronization if a proven workflow shares one. If separate branches touch the same change area, agree on ownership or sequence before writing in parallel.
4. **Publish** — make longer-running work visible early enough to prevent duplicate effort, for example through a pushed branch, linked task, status update, or draft pull request.
5. **Integrate** — refresh against the current target, run the relevant verification, and merge through the repository's established review and integration path.
6. **Release** — mark completed, handed-off, blocked, or abandoned work explicitly, and remove stale claims and isolated checkouts when they are no longer needed.

Treat task ownership as a coordination signal, not as a permanent lock. A claim should be easy to inspect, hand off, and release.

Do not use an unpushed branch, local session metadata, or a local lock file as the only coordination signal for work that spans machines or tools.

Do not require an issue, branch, or pull request for every trivial edit. Scale coordination overhead to the realistic risk and cost of collision or duplicate work.

If no shared coordination surface is available, make the user or task orchestrator the explicit synchronization point and report the overlap risk rather than silently assuming exclusive ownership.

Prefer repository-host controls for important integration boundaries. Protected default branches, required checks, required review, code ownership, or merge queues may be appropriate when the repository's collaboration volume and risk justify them.

Do not add custom lock services, agent registries, or coordination files merely because multiple agent tools are present. Persist additional coordination infrastructure only after the existing shared development platform has proved insufficient.

---

## 5.11 Agent-authored memory

Some harnesses let the agent persist its own notes across sessions and load them automatically. In current Claude Code this automatic memory is enabled by default.

Agent-authored memory is persistent context and follows the same rule as everything else: it must earn its context cost.

Decide explicitly per repository whether it stays enabled. Do not leave it unmanaged.

Where it is enabled:

- audit it periodically and delete stale or wrong notes
- promote a lesson that proves durable into the canonical instruction file, a scoped rule, or documentation, then delete the note
- do not let it duplicate or contradict canonical instructions

Agent memory is typically machine-local. Never treat it as shared coordination or team documentation.

---

# 6. Context placement test

For every piece of information, ask:

| Question | Preferred placement |
|---|---|
| Does an agent need this during almost every meaningful task? | Root persistent instructions such as `AGENTS.md` |
| Does it apply only to a package, service, path, or subsystem? | Scoped tool-native rules, preferably loaded conditionally when matching paths are touched |
| Is it a reusable multi-step procedure with demonstrated recurring value? | Skill or runbook |
| Is it durable project knowledge that should be retrieved when relevant? | Ordinary domain-appropriate `docs/` |
| Is it specific to the current task? | Task, issue, or prompt |
| Is it a lesson the agent learned while working? | Agent-authored memory where enabled; promote it into canonical instructions or docs once durable, then delete the note |
| Can a capable agent reliably infer it from the repository? | Usually do not document it |
| Can it be enforced mechanically? | Prefer code, tests, types, schemas, permissions, hooks, linting, CI, or other deterministic controls |
| Does this work benefit materially from isolated or parallel reasoning? | Delegate to a sub-agent or separate execution branch |
| Must ownership or status be visible across checkouts, machines, or agent tools? | Shared issue, pull request, remote branch, or existing team coordination system |
| Must a stage run the same way for every item, regardless of model judgment? | Deterministic control flow, gate, or automated check rather than a prose instruction |
| Does the same specialist role recur across tasks? | Reusable native sub-agent or custom-agent definition |
| Does the same orchestration recur across tasks? | Reusable orchestration definition, otherwise keep it task-scoped |
| Does the task contain several dependent stages or require durable progress tracking? | Task-scoped execution plan when useful |

Use the narrowest useful scope.

Before creating the chosen artifact, apply the pre-creation ablation test.

---

# 7. Avoid duplication

Prefer a structure conceptually like:

```text
AGENTS.md
    │
    ├── project facts
    ├── hard invariants
    ├── verified commands
    └── pointers only where needed
         │
         ├── ordinary project docs
         └── skills / runbooks with demonstrated value

CLAUDE.md or other tool-specific adapter
    │
    └── thin compatibility layer + genuinely tool-specific instructions

Reusable specialist agents
    │
    └── only recurring roles with distinct responsibilities

Task / issue
    │
    └── current changing context + task-scoped execution topology
```

A separate engineering playbook may exist when it has earned its place. It is not part of the default skeleton.

Avoid:

```text
AGENTS.md
CLAUDE.md
RULES.md
PLAYBOOK.md
AI_CONTEXT.md
README.md

→ several partially overlapping copies of the same instructions or project knowledge
```

Also avoid several specialist agents that contain mostly the same instructions with different names.

When the same rule or fact exists in several places, consolidate it unless tooling genuinely requires limited duplication.

---

# 8. Mechanical enforcement review

Identify important prose instructions that would be more reliable if enforced mechanically.

Examples:

| Requirement | Prefer |
|---|---|
| formatting | formatter |
| import order | linter |
| type safety | type checker |
| dependency boundaries | architecture test or lint rule |
| generated files | CI check |
| forbidden secrets | secret scanning |
| schema invariants | database constraints |
| API shape | schema or contract test |
| read-only access | permissions |
| required tests | CI |
| code ownership | CODEOWNERS or review rules |
| write isolation | branches, worktrees, sandboxes, or ownership boundaries |
| cross-checkout task ownership | shared issue or pull-request assignment and visible status |
| protected integration branch | repository rules requiring pull requests, checks, or review |
| required independent verification | separate review stage or automated check |
| a stage that must never be skipped | deterministic control flow or a CI gate |
| delegated result format | schema or other machine-checkable output contract |
| prohibited tools or production actions | permissions, sandboxing, or hooks |

Do not necessarily implement every possible control as part of this task.

Identify the highest-value opportunities, especially hard boundaries currently carried only by prose.

Mechanical enforcement must itself be understandable and reliable. A guardrail that fails legitimate work silently or opaquely is a defect to investigate, not evidence that the work is invalid.

---

# 9. Existing repositories

If the repository already contains AI-agent infrastructure:

Do not overwrite it blindly.

Instead:

1. inventory the current setup
2. identify what is useful
3. identify duplication
4. identify stale rules
5. identify conflicting rules
6. identify misplaced information
7. identify missing high-value project facts
8. identify opportunities for narrower scoping
9. identify rules better enforced mechanically
10. identify unnecessary orchestration complexity
11. identify recurring specialist roles worth preserving
12. identify persistent artifacts that would fail pre-creation ablation if proposed today
13. propose the smallest useful consolidation
14. preserve important project-specific knowledge
15. migrate incrementally

Maintain compatibility where doing so is inexpensive and useful.

If the existing structure is already better than this proposal, keep it.

Evidence-backed local practices may be more elaborate than the baseline default and should not be downgraded merely for consistency.

---

# 10. New repositories

If this is a new or nearly empty repository:

Start minimal.

Do not create a documentation hierarchy before the project has meaningful information to place in it.

A suitable initial AI setup may be only:

```text
AGENTS.md
```

and even that file should contain only high-value project-specific information a capable agent cannot reliably infer.

Add a thin tool-specific compatibility file only if the project actually uses the tool and the adapter provides value.

Do not create `AI_ENGINEERING_PLAYBOOK.md`, `docs/`, scoped rules, skills, runbooks, custom agents, or orchestration infrastructure until a concrete recurring need demonstrates that the artifact earns its maintenance, context, or coordination cost.

Do not create empty process infrastructure.

Do not create generic AI-context documentation merely to summarize an otherwise understandable repository.

Do not create a permanent team of specialist agents before recurring needs demonstrate that those roles are valuable.

---

# 11. Instruction, artifact, and orchestration ablation

Ablation happens three times: **before creation**, **after the resulting setup exists**, and **again when the underlying models materially improve**.

## Pre-creation ablation

Before creating any persistent AI-related artifact, ask:

> Would a capable modern coding agent materially perform worse in this repository without this?

Apply this to:

- persistent instructions
- compatibility files
- engineering playbooks
- AI-specific context documents
- skills
- runbooks
- custom agents
- scoped rules
- hooks
- execution-plan conventions
- orchestration infrastructure

If the answer is no, do not create it.

If the value can be achieved more reliably through existing code, ordinary project documentation, tests, types, schemas, permissions, or CI, prefer that source.

## Final ablation

Treat all persistent instructions and AI infrastructure as removable until they prove their value.

For every persistent instruction, ask:

> If this instruction were removed, would a current capable coding agent realistically perform worse in this repository?

If the answer is no, remove it.

Also remove, rewrite, scope, or relocate instructions that are obsolete, duplicated, rarely relevant, misplaced, mechanically enforceable, or no longer materially improve outcomes.

Apply the same principle to orchestration.

For every permanent custom agent, delegation rule, stage, gate, or coordination boundary, ask:

> Would one capable agent with a tight implementation and verification loop perform materially worse without this?

If the answer is no, simplify the topology.

For every persisted orchestration definition, also ask whether the same orchestration has actually recurred. If it has not, keep the work task-scoped instead.

## Model-upgrade ablation

Persistent instructions encode two different things: durable repository truth, and compensation for the weaknesses of the model generation in use when they were written. The first kind ages well. The second expires.

When the models powering repository work materially improve, re-run final ablation across persistent instructions, skills, playbooks, agent definitions, and orchestration with that distinction in mind.

Look specifically for compensatory patterns:

- aggressive emphasis such as CRITICAL or YOU MUST, and the same constraint restated several ways
- defensive triggers such as "if in doubt, do X"
- explicit self-verification steps such as "double-check your answer before finishing"
- instructions to restate or echo internal reasoning
- long enumerations of cases that one brief instruction now covers
- step-by-step procedure where outcome-level guidance suffices

Where practical, test the candidate against the current model's default behavior. If default performance is at least as good, remove the instruction. Current vendor guidance states that instructions and skills developed for prior models are often too prescriptive for newer ones and can degrade output quality.

Durable content normally survives this pass: verified commands, hard boundaries, domain invariants, and non-obvious project facts are not compensation.

When an agent repeatedly makes a preventable mistake:

1. identify the root cause
2. choose the smallest intervention
3. place it at the narrowest appropriate scope
4. prefer deterministic enforcement where practical

Do not allow instruction files, context documents, playbooks, skills, or orchestration graphs to grow monotonically forever.

---

# 12. Baseline provenance and future upgrades

If this repository participates in the centrally versioned AI Engineering baseline, record enough provenance to determine both the release identity and the exact upstream baseline state last reviewed.

Prefer a small machine-readable marker rather than copying the entire bootstrap prompt into every repository.

The recommended marker is:

```yaml
baseline:
  id: ai-engineering-bootstrap
  repository: jkrogsgaard/AI-Engineering
  version: 9
  source_commit: <exact-upstream-commit>
  last_reviewed: YYYY-MM-DD
```

`version` is the human-readable baseline release.

`source_commit` is the exact immutable commit in the upstream AI-Engineering repository that was actually reviewed.

Do not substitute `main` or another moving branch name for `source_commit`.

Do not guess a historical source commit when reliable evidence is unavailable.

Do not create this marker if there is no centrally managed baseline or upgrade process.

## Upgrade audit

A baseline upgrade is an audit, not a blind synchronization operation.

When a newer baseline becomes available:

1. identify the repository's currently recorded baseline version
2. identify the current upstream baseline version
3. read the relevant adjacent migration guides from the recorded version through the current version
4. compose their guidance into the net desired current target state
5. inspect the repository's current AI engineering setup
6. determine which net baseline changes are relevant
7. preserve project-specific facts, constraints, conventions, evidence-backed practices, and superior local solutions
8. apply only changes that materially improve this repository
9. verify the resulting setup
10. perform final instruction, artifact, and orchestration ablation
11. verify the exact upstream source commit used for the successful audit
12. update the recorded version, source commit, and review date only after the review succeeds

Do not overwrite repository-specific instructions merely because the baseline changed.

Do not downgrade a repository-specific solution that is already better than the new baseline.

## Skipped versions

Migration guides are adjacent and composable.

If a repository's recorded version is older than the immediately previous baseline, read every adjacent migration guide in order through the current version.

For example, a repository moving from v6 directly to v9 should read:

```text
migrations/v6-to-v7.md
migrations/v7-to-v8.md
migrations/v8-to-v9.md
```

Reason about the combined Added, Changed, Removed, Reassess, Preserve, and Verification guidance.

Perform one focused current-state audit.

Do **not** mechanically replay each historical baseline.

If an earlier migration adds an artifact that a later migration changes or removes, do not create the obsolete intermediate artifact merely to delete it again.

Do not create intermediate commits simply to mark v7 and v8 on the way to v9.

The repository marker should move directly from the previously verified baseline to the newly verified current baseline after the complete audit succeeds.

Adjacent migrations are the canonical upgrade history. Avoid maintaining every possible version-to-version combination unless real evidence later justifies a compressed checkpoint migration.

---

# 13. Verification of the AI setup

After creating or improving the setup:

## Show the resulting structure

Show the relevant files and directories.

## Explain material files

For each created or materially changed file, explain:

- why it exists
- what belongs there
- what deliberately does not belong there

## Verify instructions

Check for:

- contradictions
- duplication
- stale references
- broken references
- unsupported syntax
- unnecessary verbosity
- accidental tool lock-in
- compensatory instructions retained without evidence they still help

## Verify commands

Important commands in persistent instructions must be verified from repository configuration and, where practical, executed.

Do not invent commands.

## Verify agent-specific behavior

Where tool-specific compatibility mechanisms are used, verify them against current official documentation when internet access is available.

Do not rely on remembered syntax for changing tools.

## Verify orchestration

If reusable sub-agents, custom agents, execution plans, or orchestration rules were added or retained:

- verify that each has a distinct recurring purpose
- verify that stages which must not be skipped are enforced by control flow or an automated check rather than by prose
- verify that persisted orchestration definitions correspond to recurring work rather than to a single past task
- verify that responsibilities do not unnecessarily overlap
- verify that delegated work has a clear expected output
- verify that parallel writers cannot accidentally modify the same ownership area without intentional isolation
- verify that failures propagate visibly to the orchestrator
- verify that an independent review is actually independent when independence matters
- verify that synchronization and integration points are explicit where needed
- verify that the setup is simpler, faster, safer, or more reliable than using one capable agent

## Verify cross-checkout coordination

If the repository is shared across people, machines, or independent agent tools:

- verify that meaningful in-progress work and ownership are discoverable from another checkout
- verify that a participant checks shared active work before beginning an overlapping change
- verify that two writers do not silently share one branch or checkout
- verify that task claims can be handed off, released, and distinguished from stale work
- verify that local worktrees or session state are not mistaken for cross-machine coordination
- verify that integration uses the repository's current target state and required checks or review
- verify that the chosen protocol is lighter than the duplicate work or collision risk it addresses

Do not manufacture task trackers, pull requests, or branch rules for a repository whose actual collaboration pattern does not justify them.

## Verify agent-authored memory

If the active tooling persists agent-authored memory:

- verify that it is either deliberately enabled with an audit practice or disabled
- verify that durable lessons are promoted into canonical instructions or documentation and stale notes removed, rather than accumulating indefinitely

## Perform a final ablation review

Challenge every persistent instruction, file, adapter, playbook, AI-context document, skill, agent, and permanent orchestration primitive that was created, changed, or retained as part of the audit.

Remove or avoid anything that does not appear likely to materially improve agent performance.

## Verify baseline provenance

If a baseline marker is used:

- verify that it reflects the baseline actually reviewed
- verify that `source_commit` is the exact upstream commit actually reviewed
- do not advance the version or source commit merely because files were copied or referenced
- report any intentional deviations from the baseline

## Verify skipped-version upgrades

If multiple baseline versions were skipped:

- verify that every adjacent migration guide in the chain was considered
- verify that obsolete intermediate states were not replayed unnecessarily
- verify that the final repository was audited against the current target state

## Report uncertainty

Clearly state anything important that could not be verified.

---

# 14. Expected conceptual result

The repository should end up with the simplest appropriate version of something like:

```text
Repository
│
├── AGENTS.md                          # when useful
│   ├── project facts
│   ├── verified commands
│   ├── invariants
│   ├── hard boundaries
│   └── pointers
│
├── CLAUDE.md or other adapters        # only where useful
│   └── thin compatibility + genuine tool-specific context
│
├── ordinary project docs              # only where useful
│   └── durable project knowledge
│
├── playbook / skills / runbooks       # only after demonstrated recurring need
│   └── reusable methodology or procedures
│
├── reusable specialist agents         # only for recurring distinct roles
│   └── bounded responsibility
│
├── reusable orchestration            # only for recurring orchestration
│   └── deterministic stages that must not be skipped
│
├── baseline marker                    # when centrally managed
│   ├── reviewed baseline version
│   └── exact upstream source commit
│
└── tasks / issues / prompts
    ├── current changing context
    └── task-scoped execution topology where useful
```

This is a conceptual architecture, not a mandatory directory structure.

A valid result may contain only a small subset of these components.

Choose actual filenames, paths, and mechanisms according to current tooling and the repository's real needs.

---

# 15. Final output

When finished, report on the points below.

Scale the report to the size of the audit. For a small repository, a few paragraphs covering the material points are enough.

## 1. Assessment

- current state
- major issues found
- whether the proposed structure was appropriate

## 2. Resulting AI setup

- files created
- files changed
- files removed or consolidated
- files deliberately not created

## 3. Key decisions

- canonical source of truth
- tool-specific compatibility decisions
- global versus scoped context
- documentation versus skills
- execution topology and delegation decisions
- shared task ownership and cross-checkout coordination decisions
- what remains task-specific

## 4. Mechanical enforcement opportunities

Identify important instructions that should eventually move from prose to deterministic enforcement.

Only include opportunities with clear practical value.

## 5. Verification performed

Report:

- commands verified or run
- references checked
- agent-tool documentation checked
- contradictions or duplication checks
- compatibility mechanisms verified
- orchestration behavior verified where relevant

## 6. Unverified items

State anything important that could not be established.

## 7. Ablation result

State which proposed or existing instructions, files, playbooks, context documents, skills, specialist agents, stages, or rules were removed, scoped, relocated, or deliberately not created because they did not earn their context, maintenance, or coordination cost.

Include meaningful pre-creation decisions, not only things removed at the end.

## 8. Baseline provenance

If baseline versioning is used, report:

- previous baseline version
- new baseline version
- exact upstream source commit reviewed
- material baseline changes adopted
- material baseline changes deliberately not adopted
- reason for any intentional deviation

If multiple versions were skipped, state which adjacent migration guides were composed.

## 9. Recommended next improvement

Only include one if it has clear practical value.

Do not judge success by how many files, rules, documents, agents, or workflow stages were created.

Judge success by whether future coding agents receive the right information at the right time, execute work with the simplest reliable topology, and operate with the least unnecessary context, maintenance, and coordination overhead.
