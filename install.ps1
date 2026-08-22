# human-craft & AI Engineering Suite Installer for Windows (PowerShell)
# Installs skills into Antigravity global configuration (~/.gemini/config/skills/)

param (
    [string]$Target = "all"
)

$ErrorActionPreference = "Stop"
$GlobalSkillsDir = "$HOME\.gemini\config\skills"
$CurrentScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "===============================================================" -ForegroundColor Cyan
Write-Host "  Installing AI Engineering & Human-Craft Skills (Antigravity) " -ForegroundColor Cyan
Write-Host "===============================================================" -ForegroundColor Cyan

function Install-Skill {
    param (
        [string]$SkillName,
        [string]$SourcePath,
        [string]$RemoteUrl
    )

    $SkillDir = Join-Path $GlobalSkillsDir $SkillName
    $TargetFile = Join-Path $SkillDir "SKILL.md"

    if (-not (Test-Path $SkillDir)) {
        New-Item -ItemType Directory -Path $SkillDir -Force | Out-Null
    }

    if (Test-Path $SourcePath) {
        Copy-Item -Path $SourcePath -Destination $TargetFile -Force
        Write-Host "  [+] Installed $SkillName (from local repo)" -ForegroundColor Green
    } elseif ($RemoteUrl) {
        Invoke-WebRequest -Uri $RemoteUrl -OutFile $TargetFile
        Write-Host "  [+] Installed $SkillName (downloaded from GitHub)" -ForegroundColor Green
    } else {
        Write-Host "  [!] Skipping $SkillName (source not found)" -ForegroundColor Yellow
    }
}

# 1. Install human-craft
if ($Target -eq "all" -or $Target -eq "human-craft") {
    $hcSource = Join-Path $CurrentScriptDir "SKILL.md"
    $hcRemote = "https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/SKILL.md"
    Install-Skill -SkillName "human-craft" -SourcePath $hcSource -RemoteUrl $hcRemote
}

# 2. Install security-privacy-auditor
if ($Target -eq "all" -or $Target -eq "security-privacy-auditor") {
    $secSource = Join-Path $CurrentScriptDir "skills\security-privacy-auditor\SKILL.md"
    $secRemote = "https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/skills/security-privacy-auditor/SKILL.md"
    Install-Skill -SkillName "security-privacy-auditor" -SourcePath $secSource -RemoteUrl $secRemote
}

# 3. Install Modular AI Agent Engineering Suite
$agentSkills = @(
    "ai-agent-engineering-suite",
    "agent-architecture-core",
    "agent-context-rag-memory",
    "agent-mcp-development",
    "agent-multi-orchestration",
    "agent-workflow-automation",
    "agent-eval-testing",
    "agent-security-governance"
)

if ($Target -eq "all" -or $Target -eq "agent-engineering") {
    foreach ($skill in $agentSkills) {
        $skillSource = Join-Path $CurrentScriptDir "skills\$skill\SKILL.md"
        $skillRemote = "https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/skills/$skill/SKILL.md"
        Install-Skill -SkillName $skill -SourcePath $skillSource -RemoteUrl $skillRemote
    }
}

Write-Host ""
Write-Host "[+] All specified skills successfully configured in Antigravity global directory:" -ForegroundColor Green
Write-Host "  $GlobalSkillsDir" -ForegroundColor Gray
Write-Host "Antigravity will now automatically leverage these skills across all projects." -ForegroundColor Green
