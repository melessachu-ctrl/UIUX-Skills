# 外部依賴

本 repo 的 skills 會鏈式載入其他 Cursor skills 與 MCP。以下說明 teammate 需自行準備的項目。

## 必備：Figma MCP Plugin

以下 skills **不在本 repo**，由 Cursor 官方 **Figma plugin** 提供：

| Skill | 用途 | 何時需要 |
| --- | --- | --- |
| `figma-use` | `use_figma` 寫入前必讀 | Figma 出稿、cleanup、DS 對齊 |
| `figma-implement-design` | 設計稿 → code | 從 Figma 實作 UI |
| `figma-generate-design` | 版面生成 | 元件化、從 DS 組裝 |
| `figma-design-to-code` | `get_design_context` 前必讀 | 讀取 Figma 設計上下文 |

### 安裝方式

1. 在 Cursor 開啟 **Extensions / Plugins**
2. 搜尋並啟用 **Figma** 官方 plugin
3. 完成 Figma OAuth 授權（首次使用 MCP 時）

### 疑難排解

若 agent 回報找不到 `figma-use` 或路徑含 `plugins/cache/cursor-public/figma/...`：

- 確認 Figma plugin 已啟用且為最新版
- 重啟 Cursor
- 不要手動拷貝 plugin skills 到 `~/.cursor/skills/`（路徑會隨版本變更）

## 建議：Cursor Rules

HKTVmall / Lite App 相關工作建議安裝本 repo `rules/`：

```bash
cp rules/*.mdc ~/.cursor/rules/
```

| Rule | 用途 |
| --- | --- |
| `hktvmall-figma-design-system.mdc` | HKTVmall Figma DS 預設 |
| `lite-app-figma-design-tokens.mdc` | Lite App 字體必須 link tokens |

## 本 repo 內 skills 依賴圖（摘要）

```
uiux-design-studio
├── hktvmall-target-customers
├── ricky-design-guideline
├── uiux-review → ui-ux-pro-max
├── frontend-design
├── figma-mcp-server-guide
├── figma-file-cleanup → figma-use (plugin), figma-generate-design (plugin)
├── apply-design-system → audit-design-system
├── audit-design-system
└── fix-design-system-finding
```

## MCP Servers

| MCP | 用途 |
| --- | --- |
| Figma MCP | 讀寫 Figma、search_design_system |
| （可選）其他專案 MCP | 依實際專案而定 |

Figma MCP 設定見 `skills/figma-mcp-server-guide/SKILL.md`。
