---
tags: [Qiita, CLI, シリーズ, 連載, 自動化]
---

# 親子対話：post-qiita でシリーズ（連載）を管理する

https://github.com/bonsai/post-qiita

父「前回の post-qiita の話、覚えてるぞ」

父「今度は何だ」

娘「シリーズ対応の話」

父「シリーズ？」

娘「Qiita の連載機能。複数の記事をまとめて『シリーズ』として公開できる」

父「ブラウザでもできるじゃないか」

娘「できる。でも CLI から自動管理できると、連載予定が立てやすいのよ」

父「具体的には？」

娘「5 回連載の記事を用意して、毎日一つずつ公開、みたいなことが自動でできる」

父「なるほど。post-qiita で対応した？」

娘「した。ただ Qiita API は series 作成に対応してないから、ちょっと工夫が必要」

父「どんな工夫だ」

娘「2 ステップで対応してる」

## ステップ 1: ブラウザでシリーズ作成

父「まずはブラウザ？」

娘「そう。シリーズはブラウザで手動作成」

```
https://qiita.com/series/new
```

娘「シリーズ名と説明を入力して作成」

父「作成したら？」

娘「URL を見るとシリーズ ID が含まれてる」

```
https://qiita.com/series/my-cli-tutorial
                          ↑
                      シリーズID
```

父「その ID を使うんだ」

娘「そういうこと」

## ステップ 2: CLI で記事をシリーズに紐付け

父「post-qiita でどうやるんだ」

娘「記事投稿時に `series_id` を指定する」

```javascript
// Markdown 投稿
const article = await createArticle({
  title: '第1回：環境構築',
  body: '...',
  tags: ['Qiita', 'CLI'],
  series_id: 'my-cli-tutorial'  // ← シリーズID を指定
});
```

父「PATCH で更新するのか」

娘「そう。API には `POST /items` で記事作成、`PATCH /items/{id}` で更新という 2 つの方法がある」

父「既存の記事もシリーズに追加できる？」

娘「できる。記事 ID さえあれば PATCH で series_id を指定すればいい」

```javascript
await fetch(`https://qiita.com/api/v2/items/${article_id}`, {
  method: 'PATCH',
  headers: { 'Authorization': `Bearer ${token}` },
  body: JSON.stringify({
    title: article.title,
    body: article.body,
    tags: article.tags,
    series_id: 'my-cli-tutorial'
  })
});
```

## 連載を毎日公開する

父「毎日公開ってどうやるんだ」

娘「`_publish_slow.mjs` を使う」

父「このスクリプトが遅延公開？」

娘「10 秒間隔で複数の記事を公開するスクリプト」

```javascript
const ids = [
  'article_id_day1',
  'article_id_day2',
  'article_id_day3',
  'article_id_day4',
  'article_id_day5',
];

async function publish(id) {
  const res = await fetch(
    `https://qiita.com/api/v2/items/${id}`,
    {
      method: 'PATCH',
      body: JSON.stringify({ private: false })
    }
  );
  console.log(`公開: ${id}`);
}

for (const id of ids) {
  await new Promise(r => setTimeout(r, 10000)); // 10 秒待つ
  await publish(id);
}
```

父「10 秒？」

娘「API レート制限のためのウェイト。実際には設定で調整できる」

父「つまり、こういう流れか」

娘「そう」

1. ブラウザでシリーズを作成（シリーズ ID を記録）
2. Markdown で 5 記事を用意
3. 各記事を下書き投稿（`private: true`）
4. 記事 ID を `_publish_slow.mjs` に記録
5. スクリプト実行 → 10 秒間隔で 5 記事が公開される

父「完全自動化じゃないか」

娘「ね」

## 発展系：YAML で管理

父「記事 ID を毎回手動入力？」

娘「めんどいね。次のバージョンでは YAML で管理する予定」

```yaml
# series.yml
series_id: my-cli-tutorial
series_name: post-qiita 完全ガイド
schedule:
  - file: articles/episode-1.md
    publish_at: 2026-06-10
  - file: articles/episode-2.md
    publish_at: 2026-06-11
  - file: articles/episode-3.md
    publish_at: 2026-06-12
```

父「こうなると全部自動か」

娘「スクリプトで：投稿 → シリーズ紐付け → 指定時刻に公開、が全部できる」

父「API レート制限は？」

娘「設定で調整。Qiita API は 1 時間 1000 リクエストまで」

父「記事多い連載だと？」

娘「その時は公開日時を分散させるとか、夜間バッチ実行とか」

父「つまり、CLI だから好きに工夫できるってわけか」

娘「そういうこと」

## まとめ

娘「post-qiita でシリーズ対応」

- ✅ ブラウザでシリーズを作成
- ✅ CLI で `series_id` を指定して記事投稿
- ✅ 複数記事を遅延公開
- ✅ 今後：YAML による完全自動化

父「これでブラウザ開く回数がぐっと減るな」

娘「ね。エディタだけで連載が管理できる」

父「CLI 最高だな」

娘「でしょ」

https://github.com/bonsai/post-qiita
