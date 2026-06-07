# API リファレンス

Qiita API v2 の主要エンドポイント。

## ベース

```
https://qiita.com/api/v2
Authorization: Bearer <access_token>
```

## エンドポイント

| Method | Path | 説明 |
|--------|------|------|
| POST | `/items` | 記事投稿 |
| GET | `/items/{id}` | 記事取得 |
| PATCH | `/items/{id}` | 記事更新 |
| DELETE | `/items/{id}` | 記事削除 |
| GET | `/authenticated_user/items` | 認証ユーザーの記事一覧 |

### POST /items

```json
{
  "title": "タイトル",
  "body": "本文（Markdown）",
  "tags": [{ "name": "Qiita" }],
  "series_id": "my-series",
  "private": false,
  "tweet": false
}
```

### PATCH /items/{id} — 用途別

```json
// 下書き → 公開
{ "private": false }

// シリーズ追加
{ "series_id": "my-series" }
```

## データ型 (Article)

| フィールド | 型 | 説明 |
|-----------|-----|------|
| `id` | string (20桁 hex) | 記事 ID |
| `title` | string | タイトル |
| `body` | string (Markdown) | 本文 |
| `url` | string | 記事 URL |
| `private` | boolean | 限定公開フラグ |
| `created_at` | ISO 8601 | 作成日時 |
| `updated_at` | ISO 8601 | 更新日時 |
| `tags` | array | `[{name, versions}]` |

## レート制限

- **1000 リクエスト / 時間**（認証済み）
- ヘッダー `X-RateLimit-Remaining` で残数確認

## エラーステータス

| ステータス | 意味 |
|-----------|------|
| 401 | 認証エラー（トークン無効） |
| 403 | 権限不足（scope 確認） |
| 404 | リソースなし |
| 422 | バリデーションエラー |
| 429 | レート制限超過 |

## 参考

- [Qiita API v2 公式](https://qiita.com/api/v2/docs)
