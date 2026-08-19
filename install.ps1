# human-craft Installer for Windows (PowerShell)
# Installs human-craft skill into Antigravity global configuration

$ErrorActionPreference = "Stop"

$TargetDir = "$HOME\.gemini\config\skills\human-craft"
$TargetFile = "$TargetDir\SKILL.md"

Write-Host "Installing human-craft skill..." -ForegroundColor Cyan

if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
}

$CurrentScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

if (Test-Path "$CurrentScriptDir\SKILL.md") {
    Copy-Item "$CurrentScriptDir\SKILL.md" -Destination $TargetFile -Force
} else {
    $SourceUrl = "https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/SKILL.md"
    Invoke-WebRequest -Uri $SourceUrl -OutFile $TargetFile
}

Write-Host "✓ Successfully installed human-craft to: $TargetFile" -ForegroundColor Green
Write-Host "Antigravity will now automatically apply human-craft across all projects." -ForegroundColor Green
