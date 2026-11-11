@AGENTS.md

# Claude Code specifics

- Read `docs/decision/README.md` before any work; update the relevant decision doc before
  changing code that contradicts it.
- Shared skills live in `.claude/skills/`. Use `record-decision` when a decision is made and
  `update-ai-hub` when context/knowledge changes.
- Personal overrides go in `CLAUDE.local.md` and `.claude/settings.local.json` (git-ignored).
