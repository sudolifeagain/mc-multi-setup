@echo off
chcp 437 > nul

echo ============================================
echo  Cloudflared Setup (Powerd by re4lity)
echo ============================================
echo.
echo  [IMPORTANT]
echo  This script must be run as an Administrator.
echo.
echo Press any key to continue...
pause > nul

echo.
echo Checking if cloudflared is installed...
echo.

REM Check path for cloudflared.exe
where cloudflared.exe > nul 2>&1

if %ERRORLEVEL% == 0 (
    echo  [OK] cloudflared is already installed. Skipping.
) else (
    echo  [!] cloudflared not found.
    echo      Installing via Winget...
    echo.
    winget install --id Cloudflare.cloudflared --accept-package-agreements --accept-source-agreements
    
    REM Re-check if installation was successful
    where cloudflared.exe > nul 2>&1
    if not %ERRORLEVEL% == 0 (
        echo.
        echo  !!! INSTALLATION FAILED. !!!
        echo  !!! Please check if Winget is available. !!!
        echo.
        echo Press any key to exit...
        pause > nul
        exit /b
    )
    echo.
    echo  [OK] Installation complete.
)

echo.
echo ============================================
echo  Setup Complete
echo ============================================
echo  Installation check is finished.
echo  You can close this window.
echo  Please use "connect.bat" to play.
echo Press any key to exit...
pause > nul