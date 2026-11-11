---
name: update-ai-hub
description: Use when you learn something non-obvious about lets-auction (a convention, gotcha, domain term, background fact) or finish work that changes project context — files it in ai/context, ai/knowledge or ai/playbooks so every collaborator and agent shares it.
---

# Update the shared AI hub

Read `ai/README.md` for the map. Then:

| Learned... | Write to |
|---|---|
| What the project is / constraints / users | `ai/context/project.md` |
| A term with a specific meaning (Thai/English) | `ai/context/glossary.md` |
| A gotcha, convention, "how X works here" | `ai/knowledge/<topic>.md` (include `Last verified: YYYY-MM-DD`) |
| A repeatable procedure | `ai/playbooks/<name>.md`; list it in `ai/playbooks/README.md` |
| A choice with a reason | Use skill `record-decision` instead |

Rules: one topic per file, link rather than copy, never include secrets or personal data
(public repo), and replace stale facts instead of appending contradictions. Hub changes go
through a PR like code.
