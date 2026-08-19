#!/usr/bin/env bash
# human-craft Installer for macOS & Linux
# Installs human-craft into Antigravity or Claude Code

set -euo pipefail

TARGET_AGENT="${1:-antigravity}"

if [ "$TARGET_AGENT" = "antigravity" ]; then
    TARGET_DIR="$HOME/.gemini/config/skills/human-craft"
elif [ "$TARGET_AGENT" = "claude" ]; then
    TARGET_DIR="$HOME/.claude/skills/human-craft"
else
    echo "Unknown agent: $TARGET_AGENT. Supported: antigravity, claude"
    exit 1
fi

mkdir -p "$TARGET_DIR"
TARGET_FILE="$TARGET_DIR/SKILL.md"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$SCRIPT_DIR/SKILL.md" ]; then
    cp "$SCRIPT_DIR/SKILL.md" "$TARGET_FILE"
else
    SOURCE_URL="https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/SKILL.md"
    curl -fsSL "$SOURCE_URL" -o "$TARGET_FILE"
fi

echo "✓ Successfully installed human-craft for $TARGET_AGENT to: $TARGET_FILE"
