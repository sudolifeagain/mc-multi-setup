@echo off
chcp 437 > nul

echo ============================================
echo  Cloudflared Setup (v3)
echo ============================================
echo.
echo  [IMPORTANT]
echo  This script must be run as an Administrator.
echo  If you did not Right-Click > "Run as administrator",
echo  please close this and try again.
echo.
pause

echo.
echo ---> Checking if cloudflared is installed...
echo.

where cloudflared.exe > nul 2>&1

if %ERRORLEVEL% == 0 (
    echo  [OK] cloudflared is already installed. Skipping.
) else (
    echo  [!] cloudflared not found.
    echo      Installing via Winget...
    echo.
    winget install --id Cloudflare.cloudflared --accept-package-agreements --accept-source-agreements
    
    where cloudflared.exe > nul 2>&1
    if not %ERRORLEVEL% == 0 (
        echo.
        echo  !!! INSTALLATION FAILED. !!!
        echo  !!! Please check if Winget is available. !!!
        echo.
        pause
        exit /b
    )
    echo.
    echo  [OK] Installation complete.
)

echo.
echo ============================================
echo  Cloudflare Authentication
echo ============================================
echo.
echo ---> Starting browser authentication...
echo      Please complete the login in your browser.
echo      (If already logged in, it will say "already logged in")
echo.
cloudflared access login

echo.
echo ============================================
echo  Setup Complete
echo ============================================
echo  You can close this window.
echo  Please use "connect.bat" from now on.
pause