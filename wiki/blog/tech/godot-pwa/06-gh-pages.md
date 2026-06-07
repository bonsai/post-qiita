---
title: "親子対話：GodotでPWAを作れるぞ（6）GitHub Pagesデプロイ編"
tags: ["GitHub", "デプロイ", "Godot", "PWA", "親子対話"]
---

父「PWAの準備はできた。どうやって公開するんだ」

娘「GitHub Pagesが一番手軽。無料でHTTPSも使える」

父「GitHubはもうある。どうすりゃいいんだ」

娘「リポジトリを作って、書き出したHTML5のファイルをプッシュするだけ」

父「そんな簡単なのか」

娘`Settings > Pages > Source` で `Deploy from a branch` を選んで `main` を指定」

父「設定はそれだけ？」

娘「あとはプッシュするたびに自動で公開される」

父「カスタムドメインは？」

娘`CNAME` ファイルを置くなり、Pagesの設定で指定すればOK」

父「PWAのService WorkerはGitHub Pagesで動くのか」

娘「動く。ただしHTTPS必須。GitHub PagesはデフォルトでHTTPSだから問題ない」

父「アクセス解析は？」

娘「Google Analyticsを仕込むなり、GitHubのアクセス統計を見るなり」

父「じゃあちょっとしたゲームならサクッと公開できるのか」

娘「数時間あれば作って公開までいける。ストア審査なし、サーバー代ゼロ」

父「つまり個人開発のハードルがめちゃくちゃ低い」

娘「そういう時代だね😎」
