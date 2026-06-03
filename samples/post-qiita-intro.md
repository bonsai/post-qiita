---
tags: [Qiita, CLI, 親子対話, 自動化]
---

# 親子対話：post-qiita でQiita投稿をCLIから

父「また知らない子が出た」

父「`post-qiita` って何だ」

娘「Markdown から Qiita に記事を投稿するCLI」

父「Qiita ってブラウザで書くもんじゃないの」

娘「ブラウザでも書ける。でもCLIから投稿できると色々便利なのよ」

父「具体的には？」

娘「テンプレートから量産したり、CI/CDに組み込んだり」

娘「あと、好きなエディタで書ける」

父「なるほど。どうやって使うんだ」

娘「まず Qiita でアクセストークンを発行する」

```
https://qiita.com/settings/applications
```

娘「scopes は `read_qiita` + `write_qiita`」

父「トークンをもらったら？」

娘「`.env.qiita` に保存。あとは Markdown 書いてコマンド一発」

```powershell
node qiita_post.mjs article.md --draft
```

父「`--draft` って何だ」

娘「下書き投稿。外すと本番公開」

父「記事のフォーマットは？」

娘「YAML front matter でタグを指定。最初の `#` がタイトル」

```markdown
---
tags: [Qiita, CLI, 自動化]
---

# タイトル

本文...
```

父「なるほど。投稿できるとどうなる？」

娘「URL と記事ID が返ってくる」

父「エラーが出たらどうする」

娘「401 はトークン切れ。422 は本文かタグが空」

父「つまりブラウザ開かずにポンと投稿できるってわけか」

娘「そういうこと😉 ちなみにこの記事も post-qiita で投稿してる」

父「ソースは？」

娘「GitHub で公開してるよ → https://github.com/bonsai/post-qiita」

父「自分で自分を紹介してるのか」

娘「そういう時代だね😎」
