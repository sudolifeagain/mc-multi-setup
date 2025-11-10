@echo off
chcp 437 > nul

echo ============================================
echo  Connecting to server (mc.re4lity.com)
echo ============================================
echo.

REM Check if Cloudflare Access session is valid
echo Checking Cloudflare Access session...
cloudflared access login mc.re4lity.com
if errorlevel 1 (
    echo.
    echo [ERROR] Failed to authenticate with Cloudflare Access
    echo Please complete the authentication in your browser.
    pause
    exit /b 1
)

echo Session verified successfully!
echo.
echo  Starting connection...
echo  (Keep this window open while playing)
echo  (Press Ctrl+C or close this window to disconnect)
echo.

cloudflared access tcp --hostname mc.re4lity.com --url localhost:20100

echo.
echo Connection closed.
pause