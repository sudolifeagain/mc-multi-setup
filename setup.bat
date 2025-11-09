@echo off
echo ============================================
echo  Cloudflared 初回セットアップ (v2)
echo ============================================
echo 
echo  重要: このスクリプトは管理者権限で実行する必要があります。
echo  右クリックから「管理者として実行」していない場合は、
echo  一度閉じてやり直してください。
echo 
pause

echo.
echo ---> cloudflared がインストールされているか確認します...
echo.

REM 'where' コマンドで cloudflared.exe のパスをチェック
where cloudflared.exe > nul 2>&1

REM %ERRORLEVEL% が 0 なら「見つかった」、それ以外は「見つからない」
if %ERRORLEVEL% == 0 (
    echo  [OK] cloudflared は既にインストールされています。
    echo       インストールをスキップします。
) else (
    echo  [!] cloudflared が見つかりません。
    echo       Winget を使ってインストールを開始します...
    echo.
    winget install --id Cloudflare.cloudflared --accept-package-agreements --accept-source-agreements
    
    REM インストールが成功したか再チェック
    where cloudflared.exe > nul 2>&1
    if not %ERRORLEVEL% == 0 (
        echo.
        echo  !!! インストールに失敗しました。!!!
        echo  !!! Winget が利用可能か確認してください。!!!
        echo.
        pause
        exit /b
    )
    echo.
    echo  [OK] インストールが完了しました。
)

echo.
echo ============================================
echo  Cloudflare 認証
echo ============================================
echo.
echo ---> ブラウザで認証を開始します...
echo      自動で開くブラウザで、ログイン・認証を完了してください。
echo      (すでに認証済みの場合、"already logged in" と表示されます)
echo.
cloudflared access login

echo.
echo ============================================
echo  セットアップ完了
echo ============================================
echo  このウィンドウを閉じ、今後は "connect.bat" を使ってください。
pause