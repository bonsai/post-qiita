# トラブルシューティング

## セットアップ系

### `.env.qiita が見つかりません`

```powershell
echo QIITA_API_TOKEN=<トークン> > .env.qiita
```

### トークンが無効 / 401

- トークンの有効期限切れ → [Qiita 管理画面](https://qiita.com/settings/applications) で再発行
- scope 不足 → `read_qiita` + `write_qiita` が必須
- トークンのコピーミス → `.env.qiita` の内容を確認

### 403 Forbidden

トークンに `write_qiita` scope がないか、既に公開済みの記事と重複。

## 投稿系

### 422 Unprocessable Entity

チェックリスト:

- [ ] YAML front matter が `---` で正しく囲まれている
- [ ] `tags` が空配列でない（`tags: []` は NG）
- [ ] H1（`# タイトル`）が本文にある
- [ ] 本文が空でない

### ファイルが見つからない

パスを確認:

```powershell
ls wiki/blog/tech/your-article.md
node qiita_post.mjs wiki/blog/tech/your-article.md --draft
```

### 重複投稿エラー

既に公開済みの内容を再度 POST すると 403。PATCH で更新する。

## シリーズ系

| 症状 | 原因 | 対処 |
|------|------|------|
| シリーズ未反映 | series_id 誤り | Qiita のシリーズ URL と一致確認 |
| 記事が追加されない | PATCH に必須フィールド不足 | title, body, tags も含めて送信 |

## レート制限

**1000 リクエスト/時間** 超過で 429。

確認:

```javascript
const res = await fetch('/api/v2/authenticated_user', {
  headers: { Authorization: `Bearer ${token}` }
});
console.log(res.headers.get('X-RateLimit-Remaining'));
```

対策: リクエスト間に 1-10 秒の遅延を入れる（`_publish_slow.mjs` 参照）。

## デバッグ

```javascript
// qiita_post.mjs に追加
console.log('Request:', JSON.stringify(body, null, 2));
console.log('Status:', res.status);
console.log('Response:', await res.clone().json());
```

## FAQ

### 同じ記事を複数回投稿できる？
不可。既存記事は PATCH で更新。削除 → 再投稿は可能（削除は非可逆）。

### 投稿後に編集できる？
PATCH で更新可能。title, body, tags, private, series_id を指定。

### 下書き（限定公開）記事は誰が見られる？
著者のみ。Qiita の「限定公開」状態。

### 削除した記事は復元できる？
不可。DELETE は非可逆。

## それでも解決しない場合

[GitHub Issues](https://github.com/bonsai/post-qiita/issues) で検索・報告。
