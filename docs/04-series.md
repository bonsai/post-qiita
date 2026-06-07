# シリーズ管理

複数記事を連載として管理・公開する方法。

## 制限

Qiita API v2 は series の作成をサポートしていないため、ブラウザ + CLI の組み合わせで対応。

## 手順

### 1. ブラウザでシリーズ作成

[Qiita シリーズ作成ページ](https://qiita.com/series/new) で作成 → URL からシリーズ ID を控える。

```
https://qiita.com/series/{series_id}
```

### 2. 記事を下書き投稿

```powershell
node qiita_post.mjs ep1.md --draft   # → 記事ID: xxx1
node qiita_post.mjs ep2.md --draft   # → 記事ID: xxx2
```

### 3. シリーズに紐付け（PATCH）

```javascript
// 例: qiita_post.mjs や別スクリプトで
const res = await fetch(`https://qiita.com/api/v2/items/${itemId}`, {
  method: 'PATCH',
  headers: { Authorization: `Bearer ${token}` },
  body: JSON.stringify({
    title, body, tags,
    series_id: 'my-series-id',
    private: false
  })
});
```

### 4. 遅延公開（バッチ投稿用）

`_publish_slow.mjs` で記事 ID を指定 → 10 秒間隔で順次公開。

## 実績

godot-pwa シリーズ（全8編）は本方式で公開済み。
