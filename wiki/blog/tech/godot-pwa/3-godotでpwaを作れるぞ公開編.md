---
tags: [ゲーム開発, Godot, PWA, 親子対話]
---

# 親子対話：GodotでPWAを作れるぞ（3）公開編

父「ゲームはできた。次はどうする」

娘「HTML5に書き出す」

父「Godotの書き出し設定でHTML5を選ぶだけ？」

娘「ほぼそれだけ。でもPWAにするにはもうひと手間」

父「何が必要だ」

娘`Service Worker`と`manifest.json`

父「また知らない子が出た」

娘「Service Workerはオフラインでも動くようにするやつ。manifest.jsonはアプリの設定ファイル」

父「自分で書くのか」

娘「テンプレートがあるからコピペでいい」

```json
{
  "name": "Clicker Game",
  "start_url": ".",
  "display": "standalone",
  "icons": [{
    "src": "icon.png",
    "sizes": "512x512",
    "type": "image/png"
  }]
}
```

父「これだけでPWAになるのか」

娘`service-worker.js` も用意して、書き出したHTMLから読み込むようにすれば完成」

父「スマホのホーム画面にも追加できる？」

娘「Androidなら追加できる。iOSも最近対応した」

父「つまりGodotで作って、HTML5に出して、PWAの設定を足せば公開完了」

娘「そういうこと😉 無料のホスティング（GitHub Pagesとか）に置けば世界中に公開できる」

父「URLを送るだけで遊べるのか」

娘「ストア審査もなし。それがPWAの強み」

