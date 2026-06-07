# セットアップ

## 前提

- Node.js 16+
- Qiita アカウント

## 1. アクセストークン発行

[Qiita 管理画面](https://qiita.com/settings/applications) → 「アクセストークンを生成する」

スコープ: `read_qiita` + `write_qiita` を選択して生成

## 2. 環境変数設定

```powershell
echo QIITA_API_TOKEN=<発行したトークン> > .env.qiita
```

`.env.qiita` は `.gitignore` で Git 管理外。

## 3. 動作確認

```powershell
npm run draft
```

成功出力例:

```
📝 投稿準備: "テスト記事のタイトル"
🚀 Qiita へ投稿中... ✅ 完了
🔗 https://qiita.com/your-name/items/xxxxxxxxxxxxxxxx
```

## トラブル

| 症状 | 対処 |
|------|------|
| `.env.qiita が見つかりません` | 上記 step 2 を実行 |
| `401 Unauthorized` | トークン再発行 |
| `403 Forbidden` | トークンの scope に `write_qiita` があるか確認 |

[詳細なトラブルシューティング →](./07-troubleshooting.md)
