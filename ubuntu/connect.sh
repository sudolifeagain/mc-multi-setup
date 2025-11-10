#!/bin/bash
set -e

clear

echo "============================================"
echo " Connecting to server (mc.re4lity.com)"
echo "============================================"
echo

echo "Checking Cloudflare Access session..."
cloudflared access login mc.re4lity.com
if [ $? -ne 0 ]; then
    echo
    echo "[ERROR] Failed to authenticate with Cloudflare Access"
    echo "Please complete the authentication in your browser."
    read -p "Press Enter to exit..."
    exit 1
fi

echo "Session verified successfully!"
echo

echo " Starting connection..."
echo " (Keep this window open while playing)"
echo " (Press Ctrl+C or close this window to disconnect)"
echo

cloudflared access tcp --hostname mc.re4lity.com --url localhost:20100

echo

echo "Connection closed."
read -p "Press Enter to exit..."
