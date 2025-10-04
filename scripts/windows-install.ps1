# install.ps1 - Setup script for Threat Hunting & Blue Team Toolkit (Windows)
# Run as Administrator

Write-Host "Starting setup for Threat Hunting & Blue Team Toolkit..." -ForegroundColor Cyan

# ------------------------
# Chocolatey Installation
# ------------------------
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "[+] Installing Chocolatey..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey is already installed." -ForegroundColor Green
}

# ------------------------
# Install Git, Python, and Curl
# ------------------------
Write-Host "[+] Installing Git, Python, and Curl..." -ForegroundColor Yellow
choco install -y git python curl

# ------------------------
# Velociraptor
# ------------------------
Write-Host "[+] Installing Velociraptor..." -ForegroundColor Yellow
$velociraptorUrl = "https://github.com/Velocidex/velociraptor/releases/latest/download/velociraptor-v0.8.4-windows-amd64.zip"
$velociraptorZip = "$env:TEMP\velociraptor.zip"
Invoke-WebRequest -Uri $velociraptorUrl -OutFile $velociraptorZip
Expand-Archive -Path $velociraptorZip -DestinationPath "C:\Velociraptor" -Force
Remove-Item $velociraptorZip

# ------------------------
# THOR
# ------------------------
Write-Host "[+] THOR is a commercial tool. Please download it manually from https://www.nextron-systems.com/thor/" -ForegroundColor Yellow

# ------------------------
# Volatility3
# ------------------------
Write-Host "[+] Installing Volatility3..." -ForegroundColor Yellow
$volatilityPath = "$env:USERPROFILE\volatility3"
if (-not (Test-Path $volatilityPath)) {
    git clone https://github.com/volatilityfoundation/volatility3.git $volatilityPath
    python -m pip install -r "$volatilityPath\requirements.txt"
} else {
    Write-Host "Volatility3 already exists." -ForegroundColor Green
}

# ------------------------
# UAC (Linux Artifact Collector) - Windows users cannot run this natively
# ------------------------
Write-Host "[+] UAC is Linux-only. Skipping installation on Windows." -ForegroundColor Yellow

Write-Host "✅ Setup complete! Check README.md for usage instructions." -ForegroundColor Cyan
