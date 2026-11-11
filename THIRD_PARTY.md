# Third-party material

Some skills in `.claude/skills/` are copied from open-source projects under the MIT license,
which requires keeping their copyright and license notice. Full license texts are in
[`licenses/`](licenses/).

| Source | Version | License | Copyright | Skills copied |
|---|---|---|---|---|
| [obra/superpowers](https://github.com/obra/superpowers) | 7.0.2 (commit `22f0b46`, 2026-11-03) | MIT — [text](licenses/superpowers-LICENSE.txt) | © 2025 Jesse Vincent | `brainstorming`, `writing-plans`, `executing-plans`, `subagent-driven-development`, `test-driven-development`, `systematic-debugging`, `verification-before-completion`, `requesting-code-review`, `receiving-code-review`, `using-git-worktrees`, `finishing-a-development-branch` |
| [mattpocock/skills](https://github.com/mattpocock/skills) | 1.2.3 | MIT — [text](licenses/mattpocock-skills-LICENSE.txt) | © 2026 Matt Pocock | `code-review`, `domain-modeling`, `grilling`, `resolving-merge-conflicts` |

Everything else in `.claude/skills/` (`decision-first`, `record-decision`, `update-ai-hub`,
`security-review`) is original to this project.

## Changes made to the copies

In the original `we-auction` repo, the first commit on the `chore/shared-skills` branch holds
the files verbatim; later commits show every edit. (That history was not carried over to
`lets-auction`.) Summary:

- Removed the `superpowers:` plugin prefix from skill cross-references (names are plain here).
- `docs/superpowers/plans|specs/` → `docs/plans/` and `docs/specs/`. Scratch state still goes
  to `.superpowers/` (git-ignored).
- `executing-plans`: removed a pointer to the `using-superpowers` skill, which is not copied.
- `code-review`: issue tracker is GitHub Issues instead of `docs/agents/issue-tracker.md`.
- `domain-modeling`: glossary is `ai/context/glossary.md` and ADRs are `docs/decision/`.

## Not copied on purpose

Upstream `superpowers` ships a session hook that forces skill use at every session start, and
a skill that explains it (`using-superpowers`). Neither is copied; `AGENTS.md` tells agents
when to use which skill instead.

## Updating a copied skill

Do it in a PR: diff against the upstream version, re-apply the changes listed above, then
update the version in the table. Never edit a copied skill silently.
