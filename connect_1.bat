@echo off
chcp 437 > nul

echo ============================================
echo  Connecting to server (mc.re4lity.com)
echo ============================================
echo.

REM Check if port 20100 is already in use
echo Checking port availability...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":20100" ^| findstr LISTENING') do set PORT_PID=%%a
if defined PORT_PID (
    echo.
    echo [WARNING] Port 20100 is already in use by PID %PORT_PID%:
    tasklist /fi "PID eq %PORT_PID%" /fo table /nh
    echo.
    echo Please close the above process before continuing.
    echo If it's an old cloudflared instance, you can:
    echo   taskkill /PID %PORT_PID% /F
    echo.
    pause
    exit /b 1
)
echo Port 20100 is available.
echo.

REM Check if Cloudflare Access session is valid
echo Authenticating with Cloudflare Access...
echo A browser window will open for authentication.
echo Please complete the authentication and return here.
echo.
cloudflared access login mc.re4lity.com
if errorlevel 1 (
    echo.
    echo [ERROR] Failed to authenticate with Cloudflare Access
    echo.
    echo Possible issues:
    echo   - Application not configured at mc.re4lity.com
    echo   - Browser authentication not completed
    echo   - Network connection problems
    echo.
    echo Please verify the hostname and try again.
    pause
    exit /b 1
)

echo.
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