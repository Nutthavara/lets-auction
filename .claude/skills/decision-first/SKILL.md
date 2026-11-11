---
name: decision-first
description: Start every new project, app, service or large feature by discussing and recording decisions BEFORE writing any code. Use this whenever the user says they want to start, build, create, scaffold, kick off, plan or redesign a project or system, hands over a brief, requirements or exam spec, or asks "where do we begin" — even if they never say "decision", "architecture" or "plan". Also use when a docs/decision folder already exists and the work might contradict it. Produces a docs/decision/ log (README index + one file per topic) that the user signs off topic by topic, then hands off to planning/implementation.
---

# Decision first

Code written before the decisions are made gets rewritten, and the reasons behind it are lost.
The point of this skill is to make the user's choices explicit, one topic at a time, and leave a
written record that any later session (or the user in an interview, a review, six months on) can
read to learn what was decided and why. Writing code is the *last* step here, not the first.

## 1. Orient (no code, no questions yet)

Read what already exists: the brief / requirements / spec the user gave, `CLAUDE.md`, `README`,
and `docs/decision/README.md` if present.

- **`docs/decision/` already exists** → this is a resume, not a start. Read its README index,
  tell the user which topics are Decided and which are open, and only discuss what is open or
  what the new work would contradict (see "Keeping it alive").
- **Nothing exists** → continue below.

Then say back, in a few lines, what you understand the project to be, the hard constraints
(deadline, mandatory features, stack the user is stuck with), and which source wins if two
sources conflict (e.g. "the brief beats the example project"). Ask the user to correct you.
Getting this wrong poisons every later decision, so it is worth the pause.

## 2. Propose the topic list

Draft the list of decisions this particular project needs, ordered by **risk, not alphabet**:
the thing most likely to sink the project is decided first. Typical topics: scope, stack,
structure, auth, security, domain/data model, API shape, error handling, time/locale rules,
the project's one hard problem (concurrency, money, offline sync...), frontend, testing,
deployment. Drop what does not apply; add what does. Show the list and let the user cut or
add before you start — they know the project better than the template does.

## 3. Discuss one topic at a time

For each topic, in order:

1. **State the question** in one sentence and why it matters for *this* project.
2. **Give 2–3 real options** with the trade-off of each (cost, risk, what it rules out).
3. **Recommend one** and say why. A menu without a recommendation just hands the work back.
4. **Ask**, then wait. Use `AskUserQuestion` for genuine forks the user must own; where there
   is a conventional default, state it and proceed instead of asking. One topic per round —
   batching ten questions gets shallow answers.
5. **Record it immediately** (section 4) so nothing lives only in chat, then move on.

Two things to resist: deciding silently on the user's behalf because it feels obvious, and
reopening a decision the user already made. If new facts genuinely change it, say so and
record a supersession (section 5).

## 4. Record each decision

Create `docs/decision/<topic>.md` using `references/topic-template.md`, and keep
`docs/decision/README.md` as the index: one row per topic (file, status, one-line summary),
a "key decisions at a glance" list, open questions, and a glossary if the user's language
differs from the code's. Update the index in the same edit as the topic file, so it never
needs a full re-read to know what is current.

Every decision needs **What / Why / Trade-off / Source** (where the requirement or the user's
confirmation came from, with a date). The "why" and the rejected alternatives are the part
that is hardest to reconstruct later, so they are not optional.

Match the user's language preference for conversation. For the files, use the language the
user confirms (ask once; default to the language of their brief).

## 5. Keep the log alive

- Add (or confirm) a line in the project's `CLAUDE.md`: *read `docs/decision/README.md`
  before any work; update the relevant decision doc before changing code that contradicts it.*
  This is what makes the log binding on future sessions, not just a document.
- To change a decided topic, mark the old entry `Superseded (date): reason, see <new decision>`
  and add the new one. Never delete the old entry — the history is the evidence of why.
- Statuses: `Open` → `Decided` → `Superseded`. Only the user moves something to `Decided`.

## 6. Gate, then hand off

Do not start implementation until the user has said the decisions are good enough to build on
(at minimum: scope, stack, and the project's highest-risk topic are Decided). Summarise what
is decided, what is still open and why that is acceptable, then offer the next step:
`superpowers:writing-plans` for a task plan, or start building if the user prefers.

If the user says "skip the discussion, just build it", respect that for the current task, but
write down the assumptions you made as a short `docs/decision/assumptions.md` so they are
at least visible.
