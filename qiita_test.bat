@echo off
REM Qiita 投稿テストスクリプト
REM 使い方: qiita_test.bat

setlocal enabledelayedexpansion

echo.
echo ============================================
echo   Qiita 投稿テストスクリプト
echo ============================================
echo.

REM .env.qiita チェック
if not exist ".env.qiita" (
    echo [ERROR] .env.qiita が見つかりません
    echo.
    echo セットアップ手順:
    echo   1. .env.qiita.template をコピー
    echo      copy .env.qiita.template .env.qiita
    echo.
    echo   2. .env.qiita をテキストエディタで開く
    echo.
    echo   3. Qiita トークンを設定
    echo      https://qiita.com/settings/applications
    echo.
    echo   4. このスクリプトを再度実行
    echo.
    pause
    exit /b 1
)

REM テスト記事作成
echo [1/3] テスト記事を作成中...
if exist "samples\qiita_test_article.md" (
    echo        ✓ テスト記事: samples\qiita_test_article.md
) else (
    echo [ERROR] テスト記事が見つかりません
    pause
    exit /b 1
)

echo.
echo [2/3] 環境チェック...

REM Node.js チェック
for /f "tokens=*" %%A in ('where node 2^>nul') do set NODE_PATH=%%A
if not defined NODE_PATH (
    echo [ERROR] Node.js がインストールされていません
    echo        https://nodejs.org から LTS版をインストールしてください
    pause
    exit /b 1
)
echo        ✓ Node.js: %NODE_PATH%

REM npm チェック
for /f "tokens=*" %%A in ('where npm 2^>nul') do set NPM_PATH=%%A
if not defined NPM_PATH (
    echo [ERROR] npm がインストールされていません
    pause
    exit /b 1
)
echo        ✓ npm: %NPM_PATH%

echo.
echo [3/3] Qiita へテスト投稿...
echo.

REM 投稿実行（下書き=限定公開）
node qiita_post.mjs samples/qiita_test_article.md --draft

if errorlevel 1 (
    echo.
    echo [ERROR] 投稿に失敗しました
    echo.
    echo トラブルシューティング:
    echo   - .env.qiita のトークンが正しいか確認
    echo   - トークンの有効期限切れ？新しいトークンを生成
    echo   - ネットワーク接続を確認
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================
echo   ✅ テスト投稿完了！
echo ============================================
echo.
echo 次のステップ:
echo   1. 上記のリンクをクリックして投稿を確認
echo   2. Qiita 画面から編集・公開化が可能
echo   3. 実際の記事を投稿する場合:
echo      node qiita_post.mjs articles/your-article.md --draft
echo.
pause
