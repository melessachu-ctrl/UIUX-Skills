# UIUX-Skills

Melessa 團隊的 **Cursor Agent Skills 下游分發包**，供設計師在 Cursor 使用 `uiux-design-studio` 編排與相關 UI/UX skills。

> **重要**：本 repo 不是 skill 內容真源。真源在 [Melessa-AI-Agent](https://github.com/melessachu-ctrl/Melessa-AI-Agent) 的 `02_Knowledge_Base/skills/`。Push 到 Melessa `main` 後會自動 sync 到本 repo。

## 內含什麼

| 路徑 | 說明 |
| --- | --- |
| `skills/` | 11 個 UI/UX skills（由 Melessa 自動同步） |
| `rules/` | HKTVmall / Lite App 跨專案 Cursor rules |
| `scripts/install-skills.sh` | 一鍵 symlink 到 `~/.cursor/skills/`（首次安裝用） |
| `scripts/update-skills.sh` | **更新用**：`git pull` + 重建 symlink（請用這個，不要只 pull） |
| `docs/DEPENDENCIES.md` | 外部 plugin / MCP 依賴說明 |
| `CHANGELOG.md` | 每次 sync 記錄 |

## 前置條件

1. [Cursor](https://cursor.com) 已安裝
2. **Figma MCP plugin** 已啟用（HKTVmall / Figma 相關工作必備，見 [docs/DEPENDENCIES.md](docs/DEPENDENCIES.md)）
3. （HKTVmall 工作時）相關 Figma Design System 存取權

## 安裝（首次）

```bash
git clone https://github.com/melessachu-ctrl/UIUX-Skills.git
cd UIUX-Skills
./scripts/install-skills.sh
```

安裝 Cursor rules（建議，HKTVmall / Lite App 工作時）：

```bash
mkdir -p ~/.cursor/rules
cp rules/*.mdc ~/.cursor/rules/
```

或只複製到特定專案的 `.cursor/rules/`。

## 更新

請用 **一條命令** 更新（不要只做 `git pull`）：

```bash
cd UIUX-Skills
./scripts/update-skills.sh
```

這會自動執行 `git pull` + `install-skills.sh`，確保 symlink 仍指向正確路徑。

若 `rules/` 有更新，可再執行：

```bash
cp rules/*.mdc ~/.cursor/rules/
```

查看最新版本：打開 [CHANGELOG.md](CHANGELOG.md) 最上方一行。

## 如何使用

在 Cursor 對話中描述 UI/UX 任務，例如：

- 「用 uiux-design-studio 幫我設計結帳流程改版」
- 「幫我做這個 Figma frame 的設計評審」
- 「整理這份 Figma 檔的圖層命名」

Agent 會依 `uiux-design-studio` 的 intake → routing → 角色產出 → Director Final Pack 流程執行。

## 主要 skills

| Skill | 用途 |
| --- | --- |
| `uiux-design-studio` | 設計總監編排（主入口） |
| `uiux-review` | 設計評審 SOP |
| `hktvmall-target-customers` | HKTVmall 目標客群 |
| `ricky-design-guideline` | HKTVmall 設計原則 |
| `ui-ux-pro-max` | 規範與品質基準 |
| `figma-file-cleanup` | Figma 檔案治理 |
| `apply-design-system` / `audit-design-system` | DS 對齊與審計 |

完整清單見 `skills/` 目錄。

## 想改 skill 內容？

請閱讀 [CONTRIBUTING.md](CONTRIBUTING.md)。Skill 內容請 **PR 到 Melessa**，不要只改本 repo（下次 sync 會覆蓋）。

## 疑難排解

| 問題 | 解法 |
| --- | --- |
| Agent 找不到 `figma-use` | 確認 Figma MCP plugin 已啟用（見 DEPENDENCIES.md） |
| Skill 沒更新 | 跑 `./scripts/update-skills.sh`（不要只 `git pull`） |
| Symlink 失效 | 用 `./scripts/install-skills.sh --force` 重建 |
