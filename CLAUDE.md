# post-qiita プロジェクト設定

## プロジェクト概要

**post-qiita** は Markdown から Qiita へ記事を CLI で投稿するツール。

- 親子対話形式で技術を分かりやすく説明
- CLI による自動投稿・シリーズ管理
- Qiita API v2 ベース

## ファイル構成

```
post-qiita/
├─ scripts/
│  ├─ qiita_post.mjs            (メイン投稿スクリプト)
│  ├─ sync-status.mjs           (ローカル vs Qiita シンク状態確認)
│  └─ _publish_slow.mjs         (複数記事の遅延公開) [samples/ から移行予定]
├─ docs/                        (Wiki - 技術ドキュメント)
│  ├─ README.md                 (エントリポイント)
│  ├─ 01-setup.md               (セットアップ)
│  ├─ 02-usage.md               (使用方法)
│  ├─ 03-format.md              (Markdown フォーマット)
│  ├─ 04-series.md              (シリーズ管理)
│  ├─ 05-api.md                 (API リファレンス)
│  ├─ 06-handoff.md             (プロジェクト状況・作業予定・開発体験)
│  └─ 07-troubleshooting.md     (トラブルシューティング)
├─ wiki/
│  └─ blog/tech/                (ブログ記事)
├─ samples/                     (テスト用記事)
├─ package.json
├─ .env.qiita                   (API トークン、Git管理外)
└─ .env.qiita.template
```

## 投稿ワークフロー

```powershell
# 下書き投稿
node scripts/qiita_post.mjs wiki/blog/tech/article.md --draft

# 本番公開
node scripts/qiita_post.mjs wiki/blog/tech/article.md

# シンク状態確認
node scripts/sync-status.mjs
```

### npm scripts

```powershell
npm run draft    # テスト記事を下書き投稿
npm run publish  # テスト記事を公開
```

## ブログ記事管理

- **保存場所**: `wiki/blog/tech/`
- **命名規則**: `NN-article-name.md`
- **Front matter**: `tags: [タグ1, タグ2]` 必須
- **タイトル**: 本文の最初の `#` から自動抽出
- **親子対話**: 父・娘の会話形式、最後のセリフは独自のものに

## セキュリティ

- `.env.qiita` は Git 管理外（`.gitignore` 済み）
- トークンを公開しない

## 参考

- [docs/README.md](./docs/README.md)
- [docs/06-handoff.md](./docs/06-handoff.md) — プロジェクト状況・作業予定・開発体験
- [Qiita API v2](https://qiita.com/api/v2/docs)
