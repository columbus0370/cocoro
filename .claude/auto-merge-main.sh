#!/bin/bash
# Stopフック: 作業ブランチをmainへ自動マージしてpush

REPO="/home/user/cocoro"

# このリポジトリ以外では何もしない
if ! git -C "$REPO" rev-parse --git-dir >/dev/null 2>&1; then
  exit 0
fi

BRANCH=$(git -C "$REPO" rev-parse --abbrev-ref HEAD 2>/dev/null)

# mainブランチ上の場合はスキップ
if [ -z "$BRANCH" ] || [ "$BRANCH" = "main" ]; then
  exit 0
fi

# feature branchに未pushコミットがあるか確認
AHEAD_FEATURE=$(git -C "$REPO" rev-list "origin/$BRANCH..HEAD" --count 2>/dev/null) || AHEAD_FEATURE=0

# mainブランチより先にfeature branchを push（グローバルhookの重複チェック回避）
if [ "$AHEAD_FEATURE" -gt 0 ]; then
  git -C "$REPO" push origin "$BRANCH" 2>/dev/null || true
fi

# mainにマージするコミットがあるか確認
AHEAD_MAIN=$(git -C "$REPO" rev-list "main..$BRANCH" --count 2>/dev/null) || AHEAD_MAIN=0

if [ "$AHEAD_MAIN" -eq 0 ]; then
  exit 0
fi

# git config を設定（Unverifiedコミット防止）
git -C "$REPO" config user.email noreply@anthropic.com
git -C "$REPO" config user.name Claude

# mainへマージ＆push
git -C "$REPO" checkout main 2>/dev/null && \
  git -C "$REPO" merge "$BRANCH" --no-ff -m "Auto-merge $BRANCH into main" 2>/dev/null && \
  git -C "$REPO" push origin main 2>/dev/null && \
  git -C "$REPO" checkout "$BRANCH" 2>/dev/null

exit 0
