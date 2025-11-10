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
    echo "     Installing cloudflared..."
    echo
    if command -v sudo >/dev/null 2>&1; then
        # Detect architecture
        ARCH=$(uname -m)
        if [ "$ARCH" = "x86_64" ]; then
            CLOUDFLARED_URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb"
        elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
            CLOUDFLARED_URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64.deb"
        elif [[ "$ARCH" == arm* ]]; then
            CLOUDFLARED_URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm.deb"
        else
            echo " !!! Unsupported architecture: $ARCH !!!"
            read -p "Press Enter to exit..."
            exit 1
        fi

        echo "     Downloading cloudflared .deb package for $ARCH..."
        curl -L --output cloudflared.deb "$CLOUDFLARED_URL" || {
            echo
            echo " !!! DOWNLOAD FAILED. !!!"
            echo " !!! Please check your internet connection. !!!"
            echo
            read -p "Press Enter to exit..."
            exit 1
        }

        echo "     Installing package..."
        sudo dpkg -i cloudflared.deb || {
            echo
            echo " !!! INSTALLATION FAILED. !!!"
            echo " !!! Attempting to fix dependencies... !!!"
            sudo apt-get install -f -y
        }

        rm -f cloudflared.deb
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
