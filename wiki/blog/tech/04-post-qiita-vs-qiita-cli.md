---
tags: [Qiita, CLI, 比較, Node.js, 自動化]
---

# 親子対話：post-qiita vs Qiita CLI — 自分で作る vs 公式を使う

https://github.com/bonsai/post-qiita

父「Qiita CLI ってのがあるらしいね」

娘「あ、あるある。公式のやつ」

父「post-qiita と何が違うんだ」

娘「いい質問だ。図解してみよう」

## 公式 Qiita CLI とは

父「公式が出してるから、post-qiita より優れてるんじゃないか」

娘「確かに機能は多い。リポジトリ管理、GitHub Actions 連携、自動投稿...」

父「そっちの方が良さそうだな」

娘「待って待ってｗ。使い分けの話なんだよ」

## 比較表

| 項目 | post-qiita | Qiita CLI |
|------|-----------|----------|
| **セットアップ** | 5分 | 15分 |
| **依存関係** | Node.js のみ | Node.js + git + GitHub |
| **学習コスト** | 低い（シンプル） | 中程度（GitHub Actions） |
| **シリーズ対応** | ✅ 自分で実装可能 | ✅ サポート |
| **GitHub 連携** | ❌ 別途実装 | ✅ 自動 |
| **カスタマイズ** | ✅ コード見放題 | ❌ 固定機能 |
| **更新速度** | ⚡️ 数秒 | ⚡️⚡️ 自動 |
| **削除機能** | ✅ API で可能 | ❌ Qiita 上から |

父「なるほど。得意分野が違うんか」

娘「そういうこと」

## post-qiita が得意な場面

### 1️⃣ シンプルにやりたい

父「複雑なことは不要」

娘「post-qiita はシンプルが売り」

```powershell
# ファイル指定して投稿するだけ
node qiita_post.mjs article.md --draft
```

### 2️⃣ 記事ごとに細かく制御したい

父「遅延公開とか、特殊な処理がしたい」

娘「コード見られるから、カスタマイズ自由」

```javascript
// _publish_slow.mjs - 10秒ごとに公開
async function publish(id) {
  await new Promise(r => setTimeout(r, 10000)); // ← 好きに変更可能
  const res = await fetch(...);
}
```

### 3️⃣ ローカルだけで完結させたい

父「GitHub Actions とか使いたくないんだけど」

娘「post-qiita ならローカルコマンドだけ。設定ファイル一切不要」

### 4️⃣ 実装を学びたい

父「Qiita API がどう動くのか知りたい」

娘「コード読める。qiita_post.mjs 全体が 170 行」

```javascript
// API 呼び出しが丸見え
const res = await fetch(`${API_BASE}/items`, {
  method: 'POST',
  headers: { 'Authorization': `Bearer ${token}` },
  body: JSON.stringify({ title, body, tags, ... })
});
```

## Qiita CLI が得意な場面

父「向こうが優れてる場面は？」

娘「ちゃんとあるよ」

### 1️⃣ GitHub リポジトリで完全管理

娘「post-qiita は投稿だけ。Qiita CLI は管理も連携も全部やる」

```yaml
# GitHub Actions で自動投稿
- name: Publish articles to Qiita
  run: npx qiita publish
```

### 2️⃣ 複数人で同時編集

父「チーム開発」

娘「post-qiita は個人向け。Qiita CLI なら PR レビューとかできる」

### 3️⃣ 完全自動化を求める

父「投稿から公開まで全自動」

娘「post-qiita は手動指定。Qiita CLI は GitHub にコミットすれば自動」

### 4️⃣ サポートが必要

父「問題が出たら誰に聞く」

娘「Qiita CLI は公式だから Discussions や Issue で聞ける。post-qiita は...あ、僕たちに聞いてくださいｗ」

## 使い分け例

### シナリオ 1: 個人で毎日記事を書く

```
→ post-qiita がぴったり

理由:
  - セットアップが簡単
  - コマンド一発で投稿
  - GitHub なしで完結
```

### シナリオ 2: チームで記事を共同管理

```
→ Qiita CLI がおすすめ

理由:
  - GitHub で PR レビュー可能
  - 変更履歴が自動記録
  - リリース前の段階管理ができる
```

### シナリオ 3: 自動化とカスタマイズを両立

```
→ post-qiita をベースに拡張

理由:
  - シンプルなコード
  - カスタマイズ自由
  - 小さく始めて育てられる
```

## post-qiita の強み

父「では post-qiita の利点は」

娘「3つ」

### 1️⃣ コードがシンプル

```
qiita_post.mjs: 170 行
_publish_slow.mjs: 37 行
```

娘「全部読める」

### 2️⃣ セットアップが軽い

```powershell
# これだけ
echo QIITA_API_TOKEN=xxx > .env.qiita
```

### 3️⃣ カスタマイズが簡単

```javascript
// 実装がシンプルだから、追加機能も簡単
// 例：タイムスタンプ自動挿入
// 例：複数タグの自動付与
// 例：下書きから公開への自動スケジュール
```

## まとめ

父「で、post-qiita を選ぶべき？」

娘「それは使い方次第」

| 選ぶ基準 | post-qiita | Qiita CLI |
|---------|-----------|----------|
| 📱 シンプルさを重視 | ✅ | ❌ |
| 🔧 カスタマイズしたい | ✅ | ❌ |
| 👥 チーム管理 | ❌ | ✅ |
| 🚀 完全自動化 | ❌ | ✅ |
| 📚 実装を学びたい | ✅ | ❌ |

父「なるほど。post-qiita は『シンプルで学べるツール』か」

娘「そういうこと。Qiita CLI はプロ仕様で、post-qiita は『自分で作ってみた』の良さ」

父「でも、その『自分で作った』感が好きだな」

娘「😎」

## 次のステップ

### post-qiita を選んだ人へ

- [セットアップガイド](../docs/01-setup.md)
- [シリーズ対応](../docs/04-series.md)
- [コード解説](./04-post-qiita-architecture.md)（予定）

### Qiita CLI を選んだ人へ

- [公式: Qiita CLIのREADME](https://github.com/Qiita/qiita-cli)
- [公式ガイド](https://qiita.com/Qiita/items/32c6829b92707e3bb635)

## 最後に

父「結局、両方あってもいいってことか」

娘「そう。Qiita CLI で管理して、post-qiita でローカルテスト、みたいな使い方も」

父「いい時代だな」

娘「エンジニアが選択肢を持つのはいいこと」

父「その通り 👍」

---

**Happy Coding! 🚀**

https://github.com/bonsai/post-qiita
