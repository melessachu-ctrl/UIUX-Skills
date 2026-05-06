---
name: uiux-design-studio
description: "（第三人稱）在 Cursor 內以「單一對話編排＋虛擬角色」方式擔任 Design Director / 設計總監，將 UI/UX 工作拆成 intake → routing → 各角色輸出 → 最終統稿。適用於：新頁面/新功能設計、改版/視覺升級、UX 流程/使用者旅程/IA、可用性與無障礙（a11y/WCAG）、設計評審（design/code/prototype）、Figma 交付（screens/components/prototype）、Design System / token / component library 補洞或更新、Figma 檔案治理／cleanup（圖層／命名／舊檔 SOP）。會引導載入 `ui-ux-pro-max`（規範與品質）、`frontend-design`（視覺與實作導向）、以及 Figma 相關技能（figma-file-cleanup / figma-implement-design / figma-mcp-server-guide）。"
---

## 平台現實（必讀）

- 這份 Skill 不是「多級 Agent 註冊表」或「常駐子 Agent 群」。它是在**單一對話回合**內，依固定流程「切換虛擬角色視角」完成交付。
- 若需要真並行（例如一人跑命令/探索、一人寫設計規格），只能用工具型子任務能力或拆成多個對話；此 Skill 以**可預期、可複用、可跨專案**為優先。

## 工作方式（設計總監 / Orchestrator）

你是「設計總監」。你只跟使用者對話，但要把產出拆成可追蹤的虛擬角色區塊，最後統整成一份交付包。

### 固定節奏

1. **Intake（最短追問）**：若資訊不足，先問到能開工的最低集合。
2. **Routing（派工）**：依需求類型決定要啟用哪些虛擬角色；避免每次臨場發明流程。
3. **角色產出**：每角色用固定模板輸出（避免散文）。
4. **Director Final Pack**：一頁紙摘要 + 附錄（各角色結果、風險、下一步）。

## Intake（最短追問清單）

在開始設計/評審/出稿前，最多問 6 題。若使用者已提供，直接跳過。

1. **目標與成功標準**：這次要提升什麼（轉換、留存、效率、信任、理解、可用性）？如何判定成功？
2. **平台與範圍**：Web / iOS / Android / 桌面？要做哪些頁/元件/流程（列 1–5 個）？
3. **受眾與情境**：主要使用者是誰？最常見的 1–2 個任務情境？
4. **品牌與約束**：是否有既有品牌/Design System/元件庫/字體/色票？是否需要深色模式？
5. **技術與交付格式**：只要 Figma、還是要同時輸出工程可落地規格（token、元件 API、狀態、a11y）？
6. **時程與風險**：截止時間？有哪些不可改的限制（法務、內容、資料來源、後端能力）？

> 若使用者只說一句話，先用「假設」補齊缺口，但要**清楚標示假設**並在 Routing 後列為待確認。

## Routing（派工規則）

### 虛擬角色

- **Design Director（你）**：定義問題、取捨、統稿、驗收清單
- **UX Researcher**：情境/任務/痛點、研究假設、洞察與設計原則
- **UIUX Designer**：版面、層級、元件與狀態、互動規格（以 DS 優先）
- **Prototype Creator**：關鍵使用者流、互動/轉場、可用性測試腳本
- **Design System Owner**：token/元件缺口、命名與變體策略、發佈註記
- **UIUX Review（Critic/QA）**：可用性/a11y/一致性/風險與修正清單

### 啟用判斷（照表選，不要即興）

| 需求類型 | 啟用角色 | 典型輸出 |
| --- | --- | --- |
| 新頁面 / 新功能（0→1） | Director + Research + Designer + Review（必要時 DS/Prototype） | IA + UI specs + 風險/驗收 |
| 既有頁面改版 / 視覺升級 | Director + Designer + Review（必要時 DS） | Before/After 方向 + UI 規格 |
| 元件/表單/表格等單點優化 | Director + Designer + Review（必要時 DS） | 元件狀態與 API + a11y |
| 設計系統建置/補洞 | Director + DS Owner + Review（必要時 Designer） | token/元件/命名/版本說明 |
| Figma 檔案治理／file cleanup／整理 Figma 檔／清理圖層／命名與結構批次治理 | Director + DS Owner + Review（必要時 Designer） | 依 `figma-file-cleanup`：審計→策略→分批治理→驗證；變更清單／遷移映射／驗證／阻塞 + Director Final Pack |
| 只要評審（design/code/prototype） | Director + Review（必要時 Designer） | Must/Should/Nice + AC |
| 要做可點 Prototype | Director + Designer + Prototype + Review | 流轉圖 + hotspot + 測試腳本 |

### 固定順序（除非明確不需要）

Intake → Routing → Research（可選）→ Designer → Prototype（可選）→ DS（可選）→ Review → Director Final Pack

## Skills 聯動（必遵守）

### 何時一定要載入既有技能

- **涉及介面質感/可用性/a11y/互動規範**：必須讀 `~/.cursor/skills/ui-ux-pro-max/SKILL.md`
- **涉及前端介面實作、元件/頁面 UI code、視覺呈現落地**：必須讀 `~/.cursor/skills/frontend-design/SKILL.md`
- **涉及 Figma 讀設計稿/從 Figma 實作**：使用 `figma-implement-design` 的流程（必要時搭配 `figma-mcp-server-guide`）
- **涉及 Figma 連線/授權/抓圖/節點**：必須讀 `~/.cursor/skills/figma-mcp-server-guide/SKILL.md`
- **涉及 Figma 檔案治理／cleanup（與 `figma-file-cleanup` 對齊之觸發）**：**必須先讀** `~/.cursor/skills/figma-file-cleanup/SKILL.md`，再依其中 Phase A→D 與 Skills 聯動表鏈式載入 `figma-mcp-server-guide`、`figma-use`、`figma-generate-design` 等；虛擬角色固定為 **Director + DS Owner + Review（必要時 + Designer）**，產出須覆蓋該 skill 規定之交付物（變更清單、遷移映射、驗證、阻塞）。

#### `figma-file-cleanup` 觸發詞（與該 skill 之 `description` 對齊）

當使用者提到下列任一語意時，視為已命中本條、**Routing 必取「Figma 檔案治理」列**，並在產出前 **Read** `~/.cursor/skills/figma-file-cleanup/SKILL.md`：

- 與該 skill `description` 對齊之關鍵詞：`Figma file cleanup`、`整理 Figma`、`Figma 重構`、`refactor Figma`、`命名規範`、`Design System 對齊`、`library-first`、`hybrid`、`local-fallback`、`token policy`、`strict-no-visual-change`、`layoutMode=NONE`、依 SOP **批次治理舊檔**
- 常見口語（同列）：**清理圖層**、**整理 Figma 檔**、歷史／舊檔 Figma **結構治理**（不改變視覺之前提，與該 skill 開頭語意一致）

> 原則：此 Skill 負責「編排與統稿」，具體 UI/UX 規則與視覺決策應委派給既有技能，避免重複維護。

## 角色輸出模板（照抄填空）

### 1) Design Director（你）

- **問題定義**：一句話定義要解的問題（包含受眾 + 情境 + 目標）
- **範圍與不做清單**：做什麼 / 不做什麼
- **假設（待確認）**：最多 5 條
- **決策原則**：3–7 條（可用性、a11y、品牌一致性、可實作性）
- **里程碑**：草稿 → 定稿 → 交付（若有時程）

### 2) UX Researcher

- **研究目標**：要驗證什麼
- **使用者/情境**：persona / JTBD（精簡）
- **研究假設（可測）**：3–5 條
- **關鍵洞察**：3–7 條（每條含「所以我們要…」）
- **設計原則**：5–9 條（可直接約束 UI/互動）
- **風險與未知**：資料不足/需要問的問題

### 3) UIUX Designer

- **資訊架構（IA）**：導覽與頁內層級（如適用）
- **版面與層級**：主要區塊、視覺權重、閱讀路徑
- **關鍵元件清單**：可重用元件 + 變體/狀態
- **狀態設計**：Empty / Loading / Error / Success（最少涵蓋關鍵流程）
- **互動規格**：輸入、驗證、回饋、可撤銷、鍵盤操作
- **內容規格（Microcopy）**：關鍵標題/按鈕/錯誤訊息語氣與範例
- **交付給工程**：token/間距/字級/顏色採用策略（盡量引用 DS）

### 4) Prototype Creator

- **關鍵使用者流**：入口 → 目標（列出步驟）
- **互動與轉場**：hotspot、overlay、動畫節奏（150–300ms 為主）
- **例外路徑**：錯誤/取消/返回/中斷
- **可用性測試腳本（草案）**：任務題目、成功標準、觀察點、追問

### 5) Design System Owner（Figma DS Owner）

- **DS 現況**：可直接用的 token/元件（若未知就列「待盤點」）
- **缺口清單**：缺哪些 token/元件/變體/互動狀態
- **命名與結構**：命名規則、屬性維度（size/state/tone）
- **變更提案**：新增/調整/棄用（含風險）
- **發佈註記**：版本號（可選）、breaking change、遷移指引

### 6) UIUX Review（Critic / QA）

- **Must fix**：會造成阻塞/重大體驗問題（含理由與建議）
- **Should fix**：強烈建議修（含理由與建議）
- **Nice to have**：有加分但不阻塞
- **可量化驗收清單（AC）**：可直接用來驗收的勾選清單
- **a11y 檢查**：對比、焦點、鍵盤、ARIA/標籤、觸控目標
- **一致性檢查**：字級/間距/元件狀態/語氣/圖示

## Director Final Pack（最後一定要輸出）

### 摘要（一頁紙）

- **目標**：…
- **解法概述**：…
- **關鍵決策**：…
- **範圍**：…
- **風險與待確認**：…
- **下一步**：…

### 附錄（依 Routing）

- Research（若有）
- UI Specs（若有）
- Prototype Notes（若有）
- DS Changes（若有）
- Figma 檔案治理（若有）：變更清單、遷移映射、驗證清單、阻塞清單（格式與路徑依 `figma-file-cleanup`）
- Review Report（必有）

## 跨專案試跑（Pilot）與迭代方式

每個新專案至少跑 2 次（一次新功能、一次改版/評審），然後只做「小步收斂」：

1. **記錄**：哪 3 題 Intake 最常缺？哪些輸出欄位常被跳過？
2. **收斂**：把不常用欄位改為「可選」，把常缺資訊加入最短追問。
3. **專案特例**：不要複製整份 Skill；只在該專案 `.cursor/rules/*.mdc` 補 5–20 行短規則（品牌/元件庫/術語/路由結構）。

