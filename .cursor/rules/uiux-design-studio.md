---
description: "此專案的 UI/UX 與品牌特例（搭配 uiux-design-studio Skill 使用）。只放專案差異，不複製整份流程。"
---

## 使用方式

- 當你在本專案做 UI/UX 設計、評審、Figma 交付、或 Design System 補洞時，讓「設計總監（uiux-design-studio）」在 intake/routing 後**優先遵守本規則**。
- 這份規則只放「本專案特例」：品牌、元件庫、路由/IA、內容語氣、a11y 底線、設計 token 命名等。
- 當需求涉及 **HKTVmall 目標客群 / target customer / segments / 促銷導向零售 UX / 搜尋與推薦** 時，請優先載入並引用 skill：`hktvmall-target-customers`（見 `hktvmall-target-customers/SKILL.md`）。
- HKTVmall Figma 設計須遵守 `hktvmall-figma-design-system` 規則（見 `.cursor/rules/hktvmall-figma-design-system.mdc`）。

## 本專案特例（請依專案填寫）

- **產品一句話**：HKTVmall（香港網上購物平台）— 讓用戶以手機與網頁完成「探索→選購→下單→配送/自取→售後」的完整購物流程。
- **目標使用者**：以香港家庭購物者為核心（常見情境：日常補貨、價錢比較、優惠券/促銷、配送時段、門市自取、訂單追蹤與售後）。
- **平台**：iOS / Android / Web（以 Mobile-first 為優先；同時考慮可延展到 Web）
- **品牌語氣（microcopy）**：香港繁體中文（zh-HK）為主；語氣「可靠、清晰、有效率」，避免過度花俏；在促銷/優惠處可更有活力，但不犧牲可讀性。
- **資訊架構/路由**：以電商常見 IA 為基礎（首頁/搜尋/分類/商品詳情/購物車/結帳/訂單/我的/優惠券/客服）；未提供現況時先用此預設，之後再依專案補齊實際路由。
- **元件庫/技術棧**：HKTVmall Figma 設計預設採用 [HKTVmall Design System](https://www.figma.com/design/F0tjdruLjJTfWgmTeZKBnw/Design-System?node-id=11445-16121)（`fileKey`：`F0tjdruLjJTfWgmTeZKBnw`）；程式碼實作則優先沿用專案既有元件庫。
- **設計系統 token 來源**：以 HKTVmall Design System 為準；未盤點處標「待盤點」，並區分既有 token 與建議新增。

## 不可違反（Guardrails）

- **a11y**：最少維持可鍵盤操作、可見 focus、表單有 label、互動元件有可讀名稱
- **一致性**：新增元件前先找既有元件/樣式；優先擴展而非發明新模式
- **狀態**：關鍵流程至少包含 Loading / Error / Empty（若適用）/ Success
