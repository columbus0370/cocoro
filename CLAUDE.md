# COCORO LP — Claude引き継ぎドキュメント

## プロジェクト概要

ダンサー「COCORO（温）」のオフィシャルランディングページ。

- **GitHub**: https://github.com/columbus0370/cocoro
- **公開URL**: https://columbus0370.github.io/cocoro/
- **ブランチ**: main のみ
- **構成**: 静的サイト（`index.html` 単一ファイル + `assets/` フォルダ）

---

## 技術スタック

- HTML / CSS / Vanilla JS — すべて `index.html` 内に記述（外部ファイル化しない）
- Google Fonts: Boogaloo / Dancing Script / Bebas Neue / Noto Sans JP / Oswald
- GitHub Pages でホスティング

### カラーパレット
| 変数 | 値 | 用途 |
|---|---|---|
| `--pink` | `#FF1493` | メインアクセント |
| `--silver` | `#C0C0C0` | サブアクセント |
| `--black` | `#080808` | ベース背景 |
| `--white` | `#FFFFFF` | テキスト |

---

## assets フォルダ構成

```
assets/
  profile.png        — プロフィール写真（HEROとABOUTで使用）
  sweetpop.jpg       — SWEET POP! vol.5 イベントフライヤー
  hero-bg.png        — ダンサーネオンシルエット（現在未使用）
  logo-cocoro.png    — COCOROグリッターロゴ（HEROの背景装飾として使用中）
  glitter-splash.png — ピンクスターバースト（HEROとCONTACTの装飾）
```

---

## セクション構成

1. **HERO** — グリッターCanvas・COCOROロゴ背景装飾・プロフィール写真・キャッチコピー
2. **ABOUT** — プロフィール文・写真・タグ
3. **DANCE VIDEOS** — Instagram Reels × 3本 + TikTok × 2本（横スクロール）
4. **ACTIVITY** — TEAM / LESSON / CHOREOGRAPHY / MEDIA（2カラムグリッド）
5. **EVENT** — イベントリスト（フィーチャードカード + 通常リスト）
6. **CONTACT** — Instagram DM誘導 + SNSリンク
7. **FOOTER**

---

## 主要な実装詳細

### Canvas グリッター
- 85個のパーティクル、シルバー48% / ピンク45% / ホワイト7%
- `position: fixed`（スクロールに追従）
- タブ非表示時は `cancelAnimationFrame` で停止

### 動画埋め込み
- Instagram: `/reel/[ID]/embed/` iframeで in-page再生、wrapper `height:498px overflow:hidden` でフッター隠し
- TikTok: `https://www.tiktok.com/embed/v2/[ID]`、iframe幅300pxでコンテナ280px `overflow:hidden` によりスクロールバーを非表示

### HERO ロゴ装飾
```css
.hero-logo-bg {
  position: absolute; bottom: 28%; left: 50%;
  transform: translateX(-50%);
  width: 110%; max-width: 480px;
  mix-blend-mode: screen; opacity: 0.45;
}
```
→ `mix-blend-mode: screen` で黒背景が透過しグリッターだけ浮かぶ

### フィーチャードイベントカード（SWEET POP! vol.5）
- タップでフライヤー画像を展開するアコーディオン形式
- `.event-featured-toggle` ボタン + `.event-featured-img-wrap.open` でmax-height transition

### Activity カードのタップ対応
- PCはCSS `:hover`、スマホはJS `click` で `.active` クラスをトグル（600msで解除）

### 動画横スクロール
- `.videos-scroll-wrapper` に `touch-action: pan-x` + `overscroll-behavior-x: contain`
- 縦スクロール（ページスクロール）と競合しない

---

## 表記ルール

- **HipHop表記**: スペースなし（`HIPHOP` / `HipHop`）— サイト全体で統一済み
- コミットメッセージ: 日本語で `feat/fix/docs` プレフィックス

---

## 運用ルール（重要）

1. 修正は `index.html` の直接編集のみ
2. CSSは `<style>` タグ内、JSは `<script>` タグ内（外部ファイル化しない）
3. `assets/` に画像を追加する場合はこのドキュメントのassets一覧も更新
4. **git push はユーザーが「push して」と指示した場合のみ実行**
5. Instagram埋め込みは `blockquote` ではなく `iframe` 形式を維持
6. Canvasパーティクルのカラー比率（silver48% / pink45% / white7%）は維持

---

## git push 認証

```
https://columbus0370:[PAT]@github.com/columbus0370/cocoro.git
```
PATは都度発行（使い回し禁止）。ユーザーから都度提供してもらう。

---

## 直近の変更履歴（新しい順）

| コミット | 内容 |
|---|---|
| `4d33885` | HIPHOP表記統一・背景装飾ロゴ版に切替 |
| `33075b2` | heroシルエット削除・ロゴを背景装飾として溶け込み配置 |
| `466e99e` | スマホレイアウト改善（ボタン幅・動画タッチ・Activityタップ・フライヤートグル） |
| `673fbff` | イベント画像アコーディオン展開・TikTokスクロールバー非表示 |
| `2917766` | SWEET POP! vol.5イベント追加（フィーチャードカード） |
| `98c269d` | 生成画像をLP反映（COCOROロゴ・グリッター装飾） |

---

## スマホClaudeへの引き継ぎ方法

このファイルのRaw URLをClaude.aiに渡してください：
```
https://raw.githubusercontent.com/columbus0370/cocoro/main/CLAUDE.md
```

または以下の書き出しプロンプトをコピーして貼り付け：

> 私はダンサーCOCOROのLP（https://columbus0370.github.io/cocoro/）を管理しています。
> GitHubリポジトリ https://github.com/columbus0370/cocoro の CLAUDE.md に引き継ぎ情報があります。
> index.html の単一ファイル構成の静的サイトです。修正の指示をします。
