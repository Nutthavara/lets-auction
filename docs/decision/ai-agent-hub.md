# AI agent hub

**Status:** Decided · **Effort:** S · **Deadline risk:** Low

## Context

Collaborators will use Claude Code and possibly other agents (unknown yet). All of them need
the same skills, knowledge, context and decisions, without maintaining N copies.

## Decisions

- **`AGENTS.md` is the single vendor-neutral entry point.** What: all rules live there;
  `CLAUDE.md` imports it with `@AGENTS.md`; Copilot and Cursor files only point to it. Why:
  unknown agent mix; one file to maintain. Trade-off: tool-specific features (Cursor globs,
  Claude hooks) must be added deliberately. Alternative rejected: separate full rule files per
  tool (they drift apart). Source: user said agents may vary, Claude Code confirmed, 2026-11-10.
- **Shared knowledge lives in `ai/`; decisions in `docs/decision/`.** What: `ai/context`,
  `ai/knowledge`, `ai/playbooks`. Why: one discoverable place, reviewed via PRs. Trade-off:
  needs discipline to keep current. Alternative rejected: wiki (not versioned with code, not
  visible to agents). Source: user request for a central hub, 2026-11-10.
- **Skills are canonical in `.claude/skills/<name>/SKILL.md`, no symlinks.** What: SKILL.md is
  an open format; other agents read the files manually per `AGENTS.md`. Why: Claude Code
  requires that path; symlinks break on Windows checkouts. Trade-off: path is Claude-named.
  Alternative rejected: `ai/skills/` + symlink/sync script (fragile on Windows). Source:
  proposed by Claude, 2026-11-10 — revisit if another agent gets first-class skill support.

- **Skills are committed as files, including third-party ones; nobody has to install a plugin.**
  What: own skills plus MIT-licensed copies from `obra/superpowers` and `mattpocock/skills`
  live in `.claude/skills/`, credited in `THIRD_PARTY.md`, license texts in `licenses/`.
  Why: collaborators may not use Claude Code or install recommended plugins; committed files
  work for everyone and change only through PRs. Trade-off: copies go stale and add ~150 KB;
  upstream updates are manual. Alternative rejected: declaring plugins in
  `.claude/settings.json` (Claude-only, each person must install). Also not copied: the
  superpowers session hook and its `using-superpowers` skill; `AGENTS.md` has the skill
  index instead. Source: user decision, 2026-11-10.

## Open questions

- Add a CI check that tool pointer files still reference `AGENTS.md`? (after stack decision)
