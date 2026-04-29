---
name: cloud-codebase-runbook
description: Practical Cloud agent runbook for this skills repository. Use when a Cloud agent needs to set up, run, validate, or update this codebase, especially before editing skill docs, UI/UX data, or search scripts.
---

# Cloud Codebase Runbook

This repository is a collection of Cursor skills, not a web app. There is no app server to start, no package install step, no product login, and no feature flag system in the repo.

## First Steps in Cloud

1. Work from `/workspace`.
2. Check the branch and working tree before editing:
   - `git status --short --branch`
3. Use a task branch for changes:
   - `git checkout -b cursor/<short-change-name>-dbfe`
4. Use `python3` for all runnable checks. The UI/UX search tooling uses only the Python standard library.

## Environment, Login, and Flags

- Login: none required for local repo work.
- MCP/auth: only authenticate or use external tools when the user explicitly asks for Figma, Slack, GitHub, or another connected service workflow.
- App startup: none. Validate by reading skill docs and running the Python search CLI.
- Feature flags: none in this codebase. If a user asks for flag-specific behavior, document the assumption in the skill change and test the closest local path. Do not invent flag files.
- Generated files: write smoke-test outputs to `/tmp`, not the repository, unless the task explicitly asks to persist generated design systems.

## Codebase Areas

### `frontend-design/`

Purpose: one lightweight skill for high-quality frontend design guidance.

Common edits:
- Tighten or expand design principles.
- Add or clarify UI implementation guidance.
- Keep the frontmatter minimal: `name` and `description`.

Testing workflow:
1. Read the rendered Markdown source for broken headings, duplicated rules, or unclear triggers.
2. Verify the skill has valid frontmatter:
   ```bash
   python3 - <<'PY'
   from pathlib import Path
   p = Path("frontend-design/SKILL.md")
   text = p.read_text()
   assert text.startswith("---\n"), "missing opening frontmatter"
   end = text.find("\n---\n", 4)
   assert end != -1, "missing closing frontmatter"
   frontmatter = text[4:end]
   assert "name:" in frontmatter and "description:" in frontmatter
   print("frontend-design frontmatter ok")
   PY
   ```
3. For UI guidance changes, manually compare against the final response requirements for UI work: concrete aesthetic direction, accessibility, responsiveness, and evidence expectations.

### `ui-ux-pro-max/SKILL.md`

Purpose: comprehensive UI/UX design intelligence and CLI usage guide.

Common edits:
- Update usage instructions, UX checklists, or examples.
- Keep CLI examples aligned with `ui-ux-pro-max/scripts/search.py`.
- Keep stack/domain names in docs aligned with `ui-ux-pro-max/scripts/core.py`.

Testing workflow:
1. Run a domain search:
   - `python3 ui-ux-pro-max/scripts/search.py "landing accessibility motion" --domain ux -n 2`
2. Run a stack search:
   - `python3 ui-ux-pro-max/scripts/search.py "memo bundle performance" --stack react -n 2`
3. Run a design-system generation smoke test:
   - `python3 ui-ux-pro-max/scripts/search.py "SaaS dashboard clean" --design-system -p "Smoke Test" -f markdown`
4. If docs mention persistence, test it outside the repo:
   - `rm -rf /tmp/ui-ux-pro-max-smoke && python3 ui-ux-pro-max/scripts/search.py "fintech dashboard" --design-system --persist -p "Smoke Test" --page dashboard -o /tmp/ui-ux-pro-max-smoke`

### `ui-ux-pro-max/scripts/`

Purpose: standard-library Python search, stack lookup, and design-system generation.

Common edits:
- `search.py`: CLI arguments and output formatting.
- `core.py`: CSV configuration, BM25 ranking, domain/stack search.
- `design_system.py`: multi-domain aggregation and persisted design-system output.

Testing workflow:
1. Compile scripts:
   - `python3 -m compileall ui-ux-pro-max/scripts`
2. Exercise changed CLI paths with representative searches.
3. If changing argument names or supported domains/stacks, update `ui-ux-pro-max/SKILL.md` and re-run at least one domain search, one stack search, and one design-system command.

### `ui-ux-pro-max/data/`

Purpose: CSV-backed knowledge base for UI/UX recommendations.

Common edits:
- Add rows, update recommendations, or adjust stack guidance.
- Preserve CSV headers and quoting.
- Keep examples short enough for terminal output; `search.py` truncates long values.

Testing workflow:
1. Run the search path that should surface the new or edited row:
   - `python3 ui-ux-pro-max/scripts/search.py "<keywords from the row>" --domain <domain> -n 3`
2. For stack CSV changes, run:
   - `python3 ui-ux-pro-max/scripts/search.py "<keywords from the row>" --stack <stack> -n 3`
3. Confirm the expected row appears and important columns are populated.

## Delivery Checklist

- Check `git diff --check`.
- Run the smallest relevant smoke test for each changed area.
- If a UI/UX CLI behavior changed, include the exact CLI output in your final testing evidence.
- Commit and push the feature branch, then create or update the PR for that branch.

## Updating This Skill

When you discover a new setup trick, failing command, local workaround, or reliable smoke test:

1. Add it to the section for the affected codebase area.
2. Prefer exact commands over prose.
3. Include where generated files should go, especially when outputs must stay out of the repo.
4. Remove stale instructions immediately when scripts, domains, stacks, or file paths change.
5. Keep this runbook minimal; link to deeper docs only after the first command a Cloud agent needs is visible here.
