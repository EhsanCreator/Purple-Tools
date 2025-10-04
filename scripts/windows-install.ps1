# install.ps1 - Setup script for Threat Hunting & Blue Team Toolkit (Windows)
# Run as Administrator

$LogFile = "$env:USERPROFILE\threat-hunting-toolkit-install.log"
Start-Transcript -Path $LogFile -Append

Write-Host "[$(Get-Date)] Starting setup for Threat Hunting & Blue Team Toolkit..." -ForegroundColor Cyan

# ------------------------
# Chocolatey Installation
# ------------------------
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "[$(Get-Date)] Installing Chocolatey..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey already installed." -ForegroundColor Green
}

# ------------------------
# Install dependencies
# ------------------------
Write-Host "[$(Get-Date)] Installing Git, Python, and Curl..." -ForegroundColor Yellow
choco install -y git python curl

# ------------------------
# Velociraptor
# ------------------------
Write-Host "[$(Get-Date)] Installing Velociraptor..." -ForegroundColor Yellow
$velociraptorPath = "C:\Velociraptor"
if (-not (Test-Path $velociraptorPath)) {
    $velociraptorUrl = "https://github.com/Velocidex/velociraptor/releases/latest/download/velociraptor-v0.8.4-windows-amd64.zip"
    $velociraptorZip = "$env:TEMP\velociraptor.zip"
    Invoke-WebRequest -Uri $velociraptorUrl -OutFile $velociraptorZip
    Expand-Archive -Path $velociraptorZip -DestinationPath $velociraptorPath -Force
    Remove-Item $velociraptorZip
} else {
    Write-Host "Velociraptor already installed." -ForegroundColor Green
}

# ------------------------
# THOR
# ------------------------
Write-Host "[$(Get-Date)] THOR is a commercial tool. Please download it manually: https://www.nextron-systems.com/thor/" -ForegroundColor Yellow

# ------------------------
# Volatility3
# ------------------------
Write-Host "[$(Get-Date)] Installing Volatility3..." -ForegroundColor Yellow
$volatilityPath = "$env:USERPROFILE\volatility3"
if (-not (Test-Path $volatilityPath)) {
    git clone https://github.com/volatilityfoundation/volatility3.git $volatilityPath
    python -m pip install -r "$volatilityPath\requirements.txt"
} else {
    Write-Host "Volatility3 already exists." -ForegroundColor Green
}

# ------------------------
# UAC
# ------------------------
Write-Host "[$(Get-Date)] UAC is Linux-only. Skipping installation on Windows." -ForegroundColor Yellow

Write-Host "[$(Get-Date)] ✅ Setup complete! Logs saved to $LogFile" -ForegroundColor Cyan
Stop-Transcript
