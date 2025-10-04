#!/bin/bash
# install.sh - Setup script for Threat Hunting & Blue Team Toolkit (Linux)

set -e

echo "Starting setup for Threat Hunting & Blue Team Toolkit..."
echo ""

# Update system
echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

# Install common dependencies
echo "[+] Installing dependencies..."
sudo apt install -y python3 python3-pip git curl wget unzip

# ------------------------
# Volatility3
# ------------------------
echo "[+] Installing Volatility3..."
if [ ! -d "$HOME/volatility3" ]; then
    git clone https://github.com/volatilityfoundation/volatility3.git $HOME/volatility3
    cd $HOME/volatility3
    python3 -m pip install -r requirements.txt
else
    echo "Volatility3 already exists."
fi

# ------------------------
# Velociraptor
# ------------------------
echo "[+] Installing Velociraptor..."
if ! command -v velociraptor &> /dev/null; then
    wget https://github.com/Velocidex/velociraptor/releases/latest/download/velociraptor-v0.8.4-linux-amd64.deb -O /tmp/velociraptor.deb
    sudo dpkg -i /tmp/velociraptor.deb || sudo apt install -f -y
    rm /tmp/velociraptor.deb
else
    echo "Velociraptor already installed."
fi

# ------------------------
# THOR
# ------------------------
echo "[+] Installing THOR..."
echo "THOR is a commercial tool. Please download it from the official site: https://www.nextron-systems.com/thor/"
echo ""

# ------------------------
# Linux Artifact Collector (UAC)
# ------------------------
echo "[+] Installing UAC (Linux Artifact Collector)..."
if [ ! -d "$HOME/uac" ]; then
    git clone https://github.com/tclahr/uac.git $HOME/uac
else
    echo "UAC already exists."
fi

echo ""
echo "✅ Setup complete! Check README.md for usage instructions."
