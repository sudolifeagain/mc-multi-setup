@echo off
chcp 437 > nul

echo ============================================
echo  Connecting to server (mc.re4lity.com)
echo ============================================
echo.
echo  Starting connection...
echo  (Keep this window open while playing)
echo  (Press Ctrl+C or close this window to disconnect)
echo.

cloudflared access tcp --hostname mc.re4lity.com --url localhost:20100

echo Connection closed.
pause