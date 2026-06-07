---
title: "親子対話：GodotでPWAを作れるぞ（8）Firebase デプロイ編"
tags: ["デプロイ", "Firebase", "Godot", "PWA", "親子対話"]
---

父「GitHub Pages以外にもあるのか」

娘「Firebase Hosting。こっちのほうがPWAとの相性がいい」

父「どう違うんだ」

娘「Firebaseは元々Googleのサービス。Cloud FunctionsやFirestoreと連携しやすい」

父「ゲームにバックエンドが必要な場合か」

娘「そう。スコアの保存とか、ユーザー認証とか、リアルタイム通信とか」

父「GitHub Pagesじゃできないのか」

娘「できないことはないけど、Firebaseの方が準備が整ってる」

父「料金は？」

娘「無料枠（Sparkプラン）で十分。1GBのストレージと月10GBの転送が無料」

父「設定方法は？」

娘`firebase-tools` をインストールして、プロジェクトを作成するだけ」

```powershell
npm install -g firebase-tools
firebase login
firebase init hosting
```

父「Godotの書き出しファイルはどこに置くんだ」

娘`firebase init hosting` で公開ディレクトリを指定。GodotのHTML5書き出し先をそのまま使う」

父「デプロイは？」

娘`firebase deploy` 一発」

```powershell
firebase deploy --only hosting
```

父「PWAの動作確認は？」

娘`firebase serve` でローカルプレビューしてからデプロイすれば安心」

父「カスタムドメインは？」

娘「Firebase Hostingでも設定できる。GitHub Pagesより手順は少し多いけど、SSL証明書も自動取得」

父「つまり規模や要件で使い分けろと」

娘「そういうこと😉 小規模ゲームならGitHub Pages、後で機能追加したいならFirebaseがおすすめ」

父「とりあえずGitHub Pagesで始めて、必要になったらFirebaseに移行でもいいのか」

娘「それでいい。どっちも設定ファイルを置くだけだから移行も簡単」
