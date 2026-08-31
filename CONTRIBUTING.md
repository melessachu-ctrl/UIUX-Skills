# 貢獻指南

本 repo 是 Melessa 的 **下游分發包**。協作規則以「單一真源」為原則。

## 真源與下游

| Repo | 角色 |
| --- | --- |
| [Melessa-AI-Agent](https://github.com/melessachu-ctrl/Melessa-AI-Agent) | Skill 內容真源（`02_Knowledge_Base/skills/`） |
| **UIUX-Skills**（本 repo） | 分發、onboarding、CHANGELOG |

Melessa push 到 `main` 後，GitHub Actions 會自動 sync 到本 repo 的 `skills/` 與 `rules/`，並在 `CHANGELOG.md` 追加一行。

## 改 skill 內容（首選流程）

1. Fork [Melessa-AI-Agent](https://github.com/melessachu-ctrl/Melessa-AI-Agent)
2. 在 `02_Knowledge_Base/skills/<skill-name>/` 修改
3. 開 PR 到 Melessa `main`
4. Review 通過並 merge 後，等待自動 sync（或請 maintainer 手動觸發 **Sync UIUX-Skills** workflow）
5. 本機 `git pull` + 重跑 `./scripts/install-skills.sh`

## 只在本 repo 發現問題時

若你只能在 UIUX-Skills 先修：

1. 開 branch（命名：`fix/skill-name-short-desc` 或 `feat/uiux-studio-routing`）
2. **同時**開 PR 到 Melessa，帶相同 diff
3. **Melessa 先 merge**；本 repo 的改動會被下次 sync 覆蓋或可直接關閉 PR

緊急下游修補：允許先 PR 本 repo，但須在 **24 小時內** 開對應 Melessa PR，否則視為技術債。

## 可以直接改本 repo 的內容

以下檔案**不會**被 sync 覆蓋，可直接 PR：

- `README.md`
- `CONTRIBUTING.md`
- `docs/**`
- `scripts/**`
- `.cursor/**`（專案範例 rules，非 sync 目標）

**不要**直接改 `skills/` 或 `rules/` 當真源——下次 sync 會覆蓋。

## PR 檢查清單

- [ ] 若改 skill 內容：是否已開／計劃開 Melessa PR？
- [ ] 若新增外部依賴：是否已更新 `docs/DEPENDENCIES.md`？
- [ ] 若改 install 流程：是否已更新 `README.md`？

## Branch 保護建議（maintainer）

- `main` 允許 `github-actions[bot]` 直接 push（sync）
- 人類 contributor 建議透過 PR merge
