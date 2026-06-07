# post-qiita

Qiita に記事を投稿するたび、ブラウザでエディタを開いて、タグを選んで、下書き保存して、公開して…を繰り返すのが面倒だった。Markdown は好きなエディタで書きたい。git で履歴管理したい。連載を書くときはシリーズとしてちゃんと管理したい。でも Qiita のブラウザ UI ではそれができない。そういうストレスからこのツールは生まれた。

解決したのは以下の3つ。第一に、ローカルの Markdown ファイルをコマンド一発で Qiita に投稿できる。`node scripts/qiita_post.mjs article.md --draft` で下書き、`--draft` を外せば本番公開。第二に、記事に独自の ID（例: `godot-pwa-03`）を付与して、ローカルと Qiita の状態を管理できる。`node scripts/sync-status.mjs` を実行すれば「未投稿」「下書き中」「公開済み」とIDの有無が一覧でわかる。第三に、シリーズとして連載を管理できる。ブラウザでシリーズを作成し、記事を紐付け、遅延公開スクリプトで順次公開まで自動化した。godot-pwa シリーズ（全8編）はこの仕組みで公開済みだ。

今後やりたいことは3つある。ひとつは YAML ベースの自動公開。`series.yml` に連載の予定を書いておけば、投稿・紐付け・公開まで全自動でやってくれる仕組み。ふたつめは GitHub Actions との統合で、プッシュ時に下書き投稿 → レビュー → merge で公開、という CI パイプライン。みっつめは Qiita 以外のプラットフォーム（Zenn, Dev.to など）への対応で、一つの Markdown から複数プラットフォームに投稿できるようにしたい。

[docs/README.md](./README.md) | [01-setup.md](./01-setup.md) | [02-usage.md](./02-usage.md) | [03-format.md](./03-format.md) | [04-series.md](./04-series.md) | [05-api.md](./05-api.md) | [06-handoff.md](./06-handoff.md) | [07-troubleshooting.md](./07-troubleshooting.md)
