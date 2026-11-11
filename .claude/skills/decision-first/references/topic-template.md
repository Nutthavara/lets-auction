# Topic file template — `docs/decision/<topic>.md`

Copy this structure. Keep each decision to a short paragraph; link to other topic files
instead of repeating them.

```markdown
# <Topic>

**Status:** Open | Decided | Superseded (YYYY-MM-DD) · **Effort:** S/M/L · **Deadline risk:** Low/Med/High + one line why

## Context

Which requirement(s) this serves (brief slide / issue / user goal), and why this topic
needed a decision for this project in particular.

## Decisions

- **<Decision in one line>.** What: <the concrete choice>. Why: <the reason, tied to this
  project's constraints>. Trade-off: <what we give up>. Alternative rejected: <option and
  why not>. Source: <brief section / user confirmation, YYYY-MM-DD>.
- ...

## Rules / examples

Concrete examples, tables, signatures or snippets that make the decision unambiguous
(e.g. endpoint + status code table, error catalog row, formula, sample request).

## Likely questions (optional)

Questions a reviewer or interviewer would ask about this topic, with the short defence.

## Open questions

Anything undecided, who needs to answer, and what it blocks.
```

## README index row

```markdown
| <Topic> | [<topic>.md](<topic>.md) | Decided | <one-line summary of the decision> |
```

## Superseding a decision

Leave the old bullet in place and prefix it:

```markdown
- ~~**<old decision>.**~~ **Superseded (YYYY-MM-DD):** <reason>, see <new decision / file>.
```
