#!/usr/bin/env bash
# human-craft & AI Engineering Suite Installer for macOS & Linux
# Installs skills into Antigravity global configuration (~/.gemini/config/skills/)

set -euo pipefail

TARGET="${1:-all}"
GLOBAL_SKILLS_DIR="$HOME/.gemini/config/skills"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "═══════════════════════════════════════════════════════════════"
echo "  Installing AI Engineering & Human-Craft Skills (Antigravity) "
echo "═══════════════════════════════════════════════════════════════"

install_skill() {
    local skill_name="$1"
    local source_path="$2"
    local remote_url="$3"
    local skill_dir="$GLOBAL_SKILLS_DIR/$skill_name"
    local target_file="$skill_dir/SKILL.md"

    mkdir -p "$skill_dir"

    if [ -f "$source_path" ]; then
        cp "$source_path" "$target_file"
        echo "  ✓ Installed $skill_name (from local repo)"
    elif [ -n "$remote_url" ]; then
        curl -fsSL "$remote_url" -o "$target_file"
        echo "  ✓ Installed $skill_name (downloaded from GitHub)"
    else
        echo "  ⚠ Skipping $skill_name (source not found)"
    fi
}

# 1. Install human-craft
if [ "$TARGET" = "all" ] || [ "$TARGET" = "human-craft" ]; then
    install_skill "human-craft" "$SCRIPT_DIR/SKILL.md" "https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/SKILL.md"
fi

# 2. Install security-privacy-auditor
if [ "$TARGET" = "all" ] || [ "$TARGET" = "security-privacy-auditor" ]; then
    install_skill "security-privacy-auditor" "$SCRIPT_DIR/skills/security-privacy-auditor/SKILL.md" "https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/skills/security-privacy-auditor/SKILL.md"
fi

# 3. Install Modular AI Agent Engineering Suite
AGENT_SKILLS=(
    "ai-agent-engineering-suite"
    "agent-architecture-core"
    "agent-context-rag-memory"
    "agent-mcp-development"
    "agent-multi-orchestration"
    "agent-workflow-automation"
    "agent-eval-testing"
    "agent-security-governance"
)

if [ "$TARGET" = "all" ] || [ "$TARGET" = "agent-engineering" ]; then
    for skill in "${AGENT_SKILLS[@]}"; do
        install_skill "$skill" "$SCRIPT_DIR/skills/$skill/SKILL.md" "https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/skills/$skill/SKILL.md"
    done
fi

echo ""
echo "✓ All specified skills successfully configured in Antigravity global directory:"
echo "  $GLOBAL_SKILLS_DIR"
echo "Antigravity will now automatically leverage these skills across all projects!"
