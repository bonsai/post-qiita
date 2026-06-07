# 使用方法

## コマンド

```powershell
node qiita_post.mjs <file.md> [--draft]
```

| 引数 | 説明 |
|------|------|
| `<file.md>` | **必須** Markdown ファイルのパス |
| `--draft` | **省略可** 限定公開（下書き）で投稿 |

## 使い分け

```powershell
# 下書き投稿（著者のみ閲覧可）
node qiita_post.mjs article.md --draft

# 本番公開（全ユーザー閲覧可）
node qiita_post.mjs article.md
```

## npm scripts

```powershell
npm run draft     # samples/ のテスト記事を下書き投稿
npm run publish   # samples/ のテスト記事を公開
```

## 投稿結果

成功時:
```
📝 投稿準備: "タイトル"
🚀 Qiita へ投稿中... ✅ 完了
🔗 https://qiita.com/vonsai/items/xxxxxxxxxxxxxxxx
   記事ID: xxxxxxxxxxxxxxxx
```

`記事ID` はシリーズ紐付けや更新時に使用。

## ワークフロー例

### 単発記事

```powershell
node qiita_post.mjs article.md --draft   # 下書き確認
# Qiita で編集 → 問題なければ公開
node qiita_post.mjs article.md           # 上書き公開
```

### シリーズ連載

```powershell
# 全話を下書き投稿
node qiita_post.mjs ep1.md --draft
node qiita_post.mjs ep2.md --draft
node qiita_post.mjs ep3.md --draft

# 記事 ID を _publish_slow.mjs に記録 → 遅延公開
node _publish_slow.mjs
```

詳細は [シリーズ管理 →](./04-series.md)

## シンク状態確認

```powershell
node sync-status.mjs
```

ローカルファイルと Qiita 上の記事をタイトル照合し、未投稿・公開済み・下書き中の状態を一覧表示。
