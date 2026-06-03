# post-qiita

Markdown ファイルを Qiita API v2 で投稿する CLI ツール。

## Setup

```powershell
# 1. Qiita でアクセストークンを発行
#    https://qiita.com/settings/applications
#    scopes: read_qiita + write_qiita

# 2. .env.qiita にトークンを保存
echo QIITA_API_TOKEN=xxxxxxxxxx > .env.qiita
```

## File Format

```markdown
---
tags: [タグ1, タグ2]
---

# 記事タイトル

本文...
```

| 要素 | 説明 |
|------|------|
| `tags` (front matter) | Qiita タグ（カンマ区切り） |
| 最初の `# ` | 記事タイトル |
| front matter なし | ファイル名がタイトルになる |

## Usage

```powershell
# 下書き投稿
node qiita_post.mjs <file.md> --draft

# 本番公開
node qiita_post.mjs <file.md>
```

### npm scripts

```powershell
npm run draft    # 下書き投稿
npm run publish  # 本番公開
```

## Troubleshooting

| 症状 | 原因 | 対処 |
|------|------|------|
| 401 | トークン無効 | 再発行して `.env.qiita` に上書き |
| 422 | タイトル/本文/タグ空 | Markdown を確認 |
| 404 | エンドポイント誤り | `POST /api/v2/items` であること確認 |
