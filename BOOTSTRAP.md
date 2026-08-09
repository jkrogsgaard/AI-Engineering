# AI Engineering Bootstrap

**Baseline version: v5**

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

Every delegation, execution stage, and coordination boundary should earn its coordination cost.

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
- nested or scoped instruction files
- existing sub-agents or custom agents
- existing execution plans or planning conventions
- MCP or external tool configuration
- agent permissions and sandboxing
- worktree, branch, sandbox, or other task-isolation mechanisms
- existing orchestration or delegation rules

Search specifically for existing mechanisms such as:

- `AGENTS.md`
- `CLAUDE.md`
- `.claude/`
- `.claude/agents/`
- `.codex/`
- `.codex/agents/`
- `.cursor/rules/`
- skills
- prompts
- coding instructions
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

Inspect package manifests, configuration files, scripts, CI definitions, and other authoritative sources to verify important commands instead of copying potentially stale documentation.

For an existing repository, preserve useful project knowledge even if its current placement is poor.

Do not reorganize the repository merely to match this proposal.

---

# 3. Determine the repository's actual needs

Before editing files, determine:

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
- skills
- hooks
- MCP tools
- browser or computer-use tools
- sandbox controls
- permission controls
- execution-plan mechanisms
- persistent task state
- CI and automated verification

Do not recreate capabilities in repository instructions that the active agent harness already provides natively.

Do not add tool-specific files, custom agents, compatibility layers, or orchestration infrastructure unless they provide real value.

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
- task-specific context stored permanently
- procedures that belong in skills or runbooks
- durable knowledge that belongs in `docs/`
- rules that should be enforced mechanically instead
- instructions that only apply to one subsystem and should be scoped more narrowly
- orchestration rules that create unnecessary complexity
- specialist agents whose responsibilities overlap
- permanent custom agents that serve only one-off tasks
- assumptions about capabilities the current agent harness already provides natively

Do not delete useful instructions simply because they do not match this structure.

Consolidate duplicated guidance where practical.

Prefer one canonical source of truth with thin compatibility layers over several divergent copies.

---

# 5. Preferred information architecture

Use the following as a default conceptual model.

Change it when the repository or current tooling provides a simpler or better solution.

---

## 5.1 `AGENTS.md`

Prefer `AGENTS.md` as the canonical cross-agent repository instruction file when the active tooling supports it well.

If another native mechanism is clearly superior for this repository, use that instead and keep compatibility layers thin.

Keep the root instruction file short and high-signal.

Our default target is under 100 lines where practical.

Treat 150+ lines as a signal to review whether content should be removed, scoped, moved to documentation, or moved into a skill.

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
- handle errors
- think carefully
- use good naming
- write maintainable code
- follow SOLID
- use small functions
- avoid bugs
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

Follow current official guidance for practical size and loading behavior.

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

Avoid maintaining several full copies of the same instructions.

---

## 5.5 `AI_ENGINEERING_PLAYBOOK.md`

Create or maintain a reusable engineering playbook for AI coding agents when the project benefits from one.

This is deeper reference material.

It does not need to be loaded into the initial context of every task.

`AGENTS.md` may point to it for substantial engineering work.

The playbook should contain general engineering methodology rather than repository facts.

Use these core principles as the default seed:

1. Understand before changing.
2. Optimize for the requested outcome, not merely the literal wording, while keeping scope to the smallest change necessary to achieve that outcome.
3. Prefer the simplest sufficient solution.
4. Make surgical changes.
5. Work in small vertical slices.
6. Use short implementation and verification loops.
7. Verify actual behavior rather than plausible-looking code.
8. Never allow failure to silently resemble success.
9. Separate verified facts, inference, and unknowns.
10. Enforce hard security and correctness boundaries mechanically.
11. Choose the simplest sufficient execution topology. Default to one capable agent and a tight loop. Use sub-agents, parallel branches, or independent reviewers only when isolation, parallelism, specialization, or independent verification materially improves the result. Give each delegated task a bounded responsibility and explicit expected output. Avoid parallel writes to overlapping code unless the tooling provides safe isolation and an intentional integration step.
12. Challenge the solution before declaring it complete.
13. Never report unverified work as done.
14. Generalize only after repeated evidence.
15. Remove instructions that no longer improve agent behavior.
16. Make every delegation, execution stage, and coordination boundary earn its coordination cost.

Treat these principles as a default seed, not a mandatory minimum.

Do not expand them into a large handbook unless the repository has demonstrated recurring need for the expanded guidance.

Remove, scope, or relocate principles that do not materially improve agent behavior.

Add deeper sections only when they provide recurring value across the repository.

Specialized procedures such as migrations, security reviews, browser verification, releases, incident response, or AI-specific testing usually belong in skills or runbooks rather than in the core playbook.

If an `AI_ENGINEERING_PLAYBOOK.md` is supplied with this task, treat it as the proposed canonical starting point.

Review it critically.

Do not recreate or duplicate it from this prompt.

Simplify, relocate, or remove parts that are outdated, redundant, too generic, tool-specific, or better enforced elsewhere.

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

Prefer an open Agent Skills-compatible `SKILL.md` format when the active tooling supports it well.

Do not assume one physical directory has native meaning across all agents.

Inspect the actual tools used by the repository and use their current native mechanisms.

Where several tools are supported, prefer:

- one canonical procedure
- thin tool-specific adapters where needed

rather than several divergent copies.

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

Keep orchestration logic with the orchestrator rather than duplicating the whole workflow into every worker.

Prefer parallel read-heavy work over parallel writes.

When multiple agents may modify code, define ownership or isolation boundaries and an explicit integration and verification step.

Do not create permanent custom agents for one-off tasks.

Create reusable agent definitions only when the same specialist role has recurring value.

When independent verification matters, do not contaminate the reviewer with unnecessary implementation reasoning or conclusions.

Make failures visible to the orchestrator.

Do not allow a failed branch, incomplete delegated task, missing evidence, or skipped verification step to silently resemble success.

Prefer native orchestration mechanisms provided by the active tooling over repository-specific orchestration infrastructure unless the repository has demonstrated need for something more.

For long-running or multi-stage work, use task-scoped execution plans when the active tooling provides a useful native mechanism and the plan materially improves resumability, dependency management, or verification.

Do not require an execution plan for trivial work.

---

# 6. Context placement test

For every piece of information, ask:

| Question | Preferred placement |
|---|---|
| Does an agent need this during almost every meaningful task? | Root persistent instructions such as `AGENTS.md` |
| Does it apply only to a package, service, path, or subsystem? | Scoped or nested tool-native instructions |
| Is it a reusable multi-step procedure? | Skill or runbook |
| Is it durable knowledge that should be retrieved when relevant? | `docs/` |
| Is it specific to the current task? | Task, issue, or prompt |
| Can a capable agent reliably infer it from the repository? | Usually do not document it |
| Can it be enforced mechanically? | Prefer code, tests, types, schemas, permissions, hooks, linting, CI, or other deterministic controls |
| Does this work benefit materially from isolated or parallel reasoning? | Delegate to a sub-agent or separate execution branch |
| Does the same specialist role recur across tasks? | Reusable native sub-agent or custom-agent definition |
| Does the task contain several dependent stages or require durable progress tracking? | Task-scoped execution plan when useful |

Use the narrowest useful scope.

---

# 7. Avoid duplication

Prefer a structure conceptually like:

```text
AGENTS.md
    │
    ├── project facts
    ├── hard invariants
    ├── verified commands
    └── pointers
         │
         ├── AI_ENGINEERING_PLAYBOOK.md
         ├── docs/
         └── skills / runbooks

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

Avoid:

```text
AGENTS.md
CLAUDE.md
RULES.md
PLAYBOOK.md
README.md

→ several partially overlapping copies of the same instructions
```

Also avoid several specialist agents that contain mostly the same instructions with different names.

When the same rule exists in several places, consolidate it unless tooling genuinely requires limited duplication.

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
| required independent verification | separate review stage or automated check |
| prohibited tools or production actions | permissions, sandboxing, or hooks |

Do not necessarily implement every possible control as part of this task.

Identify the highest-value opportunities, especially hard boundaries currently carried only by prose.

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
12. propose the smallest useful consolidation
13. preserve important project-specific knowledge
14. migrate incrementally

Maintain compatibility where doing so is inexpensive and useful.

If the existing structure is already better than this proposal, keep it.

---

# 10. New repositories

If this is a new or nearly empty repository:

Start minimal.

Do not create a documentation hierarchy before the project has meaningful information to place in it.

A suitable initial setup may be only:

```text
AGENTS.md
AI_ENGINEERING_PLAYBOOK.md
```

plus a thin tool-specific compatibility file if actually useful.

Create `docs/`, scoped rules, skills, runbooks, custom agents, or orchestration infrastructure only when the project has information or recurring work worthy of them.

Do not create empty process infrastructure.

Do not create a permanent team of specialist agents before recurring needs demonstrate that those roles are valuable.

---

# 11. Instruction and orchestration ablation

Treat all persistent instructions as removable until they prove their value.

For every persistent instruction, ask:

> If this instruction were removed, would a current capable coding agent realistically perform worse in this repository?

If the answer is no, remove it.

Also remove, rewrite, scope, or relocate instructions that are obsolete, duplicated, rarely relevant, misplaced, mechanically enforceable, or no longer materially improve outcomes.

Apply the same principle to orchestration.

For every permanent custom agent, delegation rule, stage, gate, or coordination boundary, ask:

> Would one capable agent with a tight implementation and verification loop perform materially worse without this?

If the answer is no, simplify the topology.

When an agent repeatedly makes a preventable mistake:

1. identify the root cause
2. choose the smallest intervention
3. place it at the narrowest appropriate scope
4. prefer deterministic enforcement where practical

Do not allow instruction files or orchestration graphs to grow monotonically forever.

---

# 12. Baseline provenance and future upgrades

If this repository participates in a centrally versioned AI engineering baseline, record enough provenance to determine which baseline the repository was last reviewed against.

Prefer a small machine-readable marker rather than copying the entire bootstrap prompt into every repository.

A conceptual example is:

```yaml
baseline:
  id: ai-engineering-bootstrap
  version: 5
  last_reviewed: 2026-08-09
```

Choose the actual filename, format, and location according to the repository and surrounding tooling.

Do not create this marker if there is no centrally managed baseline or upgrade process.

A baseline upgrade is an audit, not a blind synchronization operation.

When a newer baseline becomes available:

1. identify the repository's currently recorded baseline version
2. inspect the changes between that baseline and the new version
3. inspect the repository's current AI engineering setup
4. determine which baseline changes are relevant
5. preserve project-specific facts, constraints, conventions, and superior local solutions
6. apply only changes that materially improve this repository
7. verify the resulting setup
8. perform instruction and orchestration ablation
9. update the recorded baseline version only after the review succeeds

Do not overwrite repository-specific instructions merely because the baseline changed.

Do not downgrade a repository-specific solution that is already better than the new baseline.

Prefer explicit baseline changelogs or migration notes so upgrade agents can reason about the delta instead of repeatedly re-evaluating every historical baseline version.

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

## Verify commands

Important commands in persistent instructions must be verified from repository configuration and, where practical, executed.

Do not invent commands.

## Verify agent-specific behavior

Where tool-specific compatibility mechanisms are used, verify them against current official documentation when internet access is available.

Do not rely on remembered syntax for changing tools.

## Verify orchestration

If reusable sub-agents, custom agents, execution plans, or orchestration rules were added:

- verify that each has a distinct recurring purpose
- verify that responsibilities do not unnecessarily overlap
- verify that delegated work has a clear expected output
- verify that parallel writers cannot accidentally modify the same ownership area without intentional isolation
- verify that failures propagate visibly to the orchestrator
- verify that an independent review is actually independent when independence matters
- verify that synchronization and integration points are explicit where needed
- verify that the setup is simpler, faster, safer, or more reliable than using one capable agent

## Perform an ablation review

Challenge every persistent instruction and permanent orchestration primitive.

Remove instructions, agents, stages, or rules that do not appear likely to materially improve agent performance.

## Verify baseline provenance

If a baseline marker is used:

- verify that it reflects the baseline actually reviewed
- do not advance the version merely because files were copied
- report any intentional deviations from the baseline

## Report uncertainty

Clearly state anything important that could not be verified.

---

# 14. Expected conceptual result

The repository should end up with the simplest appropriate version of something like:

```text
Repository
│
├── AGENTS.md
│   ├── project facts
│   ├── verified commands
│   ├── invariants
│   ├── hard boundaries
│   └── pointers
│
├── CLAUDE.md or other adapters       # only where useful
│   └── thin compatibility + genuine tool-specific context
│
├── AI_ENGINEERING_PLAYBOOK.md        # reusable methodology, on demand
│
├── docs/                             # only where useful
│   └── durable project knowledge
│
├── agent-native skills / runbooks    # only where useful
│   └── reusable specialist workflows
│
├── reusable specialist agents        # only for recurring distinct roles
│   └── bounded responsibility
│
├── baseline marker                   # only when centrally managed
│   └── last reviewed baseline version
│
└── tasks / issues / prompts
    ├── current changing context
    └── task-scoped execution topology where useful
```

This is a conceptual architecture, not a mandatory directory structure.

Choose actual filenames, paths, and mechanisms according to current tooling and the repository's real needs.

---

# 15. Final output

When finished, report:

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
- what remains task-specific

## 4. Mechanical enforcement opportunities

Identify important instructions that should eventually move from prose to deterministic enforcement.

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

State which instructions, specialist agents, stages, or rules were removed, scoped, relocated, or deliberately not created because they did not earn their context or coordination cost.

## 8. Baseline provenance

If baseline versioning is used, report:

- previous baseline version
- new baseline version
- material baseline changes adopted
- material baseline changes deliberately not adopted
- reason for any intentional deviation

## 9. Recommended next improvement

Only include one if it has clear practical value.

Do not judge success by how many files, rules, documents, agents, or workflow stages were created.

Judge success by whether future coding agents receive the right information at the right time, execute work with the simplest reliable topology, and operate with the least unnecessary context and coordination overhead.
