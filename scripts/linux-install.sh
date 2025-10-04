#!/bin/bash
# install.sh - Setup script for Threat Hunting & Blue Team Toolkit (Linux)

set -e

LOGFILE="$HOME/threat-hunting-toolkit-install.log"
exec > >(tee -i $LOGFILE)
exec 2>&1

echo "[$(date)] Starting setup for Threat Hunting & Blue Team Toolkit..."

# Update system
echo "[$(date)] Updating system..."
sudo apt update && sudo apt upgrade -y

# Install dependencies
echo "[$(date)] Installing dependencies..."
sudo apt install -y python3 python3-pip git curl wget unzip

# ------------------------
# Volatility3
# ------------------------
echo "[$(date)] Installing Volatility3..."
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
echo "[$(date)] Installing Velociraptor..."
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
echo "[$(date)] THOR is commercial. Download manually: https://www.nextron-systems.com/thor/"

# ------------------------
# UAC (Linux Artifact Collector)
# ------------------------
echo "[$(date)] Installing UAC (Linux Artifact Collector)..."
if [ ! -d "$HOME/uac" ]; then
    git clone https://github.com/tclahr/uac.git $HOME/uac
else
    echo "UAC already exists."
fi

echo "[$(date)] ✅ Setup complete! Logs saved to $LOGFILE"
