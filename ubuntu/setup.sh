#!/bin/bash
set -e

clear

echo "============================================"
echo " Cloudflared Setup (Powered by re4lity)"
echo "============================================"
echo

echo "[IMPORTANT]"
echo "This script may require sudo privileges."
echo
read -p "Press Enter to continue..."

echo

echo "Checking if cloudflared is installed..."
echo

if command -v cloudflared >/dev/null 2>&1; then
    echo " [OK] cloudflared is already installed. Skipping."
else
    echo " [!] cloudflared not found."
    echo "     Installing via apt..."
    echo
    if command -v sudo >/dev/null 2>&1; then
        sudo apt update
        sudo apt install -y cloudflared || {
            echo
            echo " !!! INSTALLATION FAILED. !!!"
            echo " !!! Please check your package manager or install manually. !!!"
            echo
            read -p "Press Enter to exit..."
            exit 1
        }
    else
        echo "sudo not found. Please install cloudflared manually."
        read -p "Press Enter to exit..."
        exit 1
    fi
    echo
    echo " [OK] Installation complete."
fi

echo

echo "============================================="
echo " Setup Complete"
echo "============================================="
echo " Installation check is finished."
echo " You can close this window."
echo " Please use \"connect.sh\" to play."
read -p "Press Enter to exit..."
