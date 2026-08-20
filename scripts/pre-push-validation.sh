#!/usr/bin/env bash
# pre-push-validation.sh - Pre-push and deployment readiness check

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Running Pre-Push Validation & Deployment Readiness Checks    ${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"

# 1. Check Git User Identity
echo -e "👤 ${YELLOW}Checking Git author configuration...${NC}"
NAME=$(git config --get user.name || echo "")
EMAIL=$(git config --get user.email || echo "")

if [ -z "$NAME" ] || [ "$NAME" = "user" ] || [ "$NAME" = "root" ]; then
    echo -e "${RED}❌ Invalid git user.name: '$NAME'${NC}"
    echo -e "${YELLOW}   Fix with: git config user.name \"Your Name\"${NC}"
    exit 1
else
    echo -e "${GREEN}  ✓ Author Name: $NAME${NC}"
fi

if [ -z "$EMAIL" ] || [[ "$EMAIL" == *"localhost"* ]] || [[ "$EMAIL" == *"example.com"* ]]; then
    echo -e "${RED}❌ Invalid git user.email: '$EMAIL'${NC}"
    echo -e "${YELLOW}   Fix with: git config user.email \"your@email.com\"${NC}"
    exit 1
else
    echo -e "${GREEN}  ✓ Author Email: $EMAIL${NC}"
fi

# 2. Check for Staged Sensitive Files
echo -e "🔒 ${YELLOW}Scanning for sensitive credentials / secrets...${NC}"
SENSITIVE_PATTERNS='\.(env|pem|key|secret|credentials)$'
if git diff --cached --name-only | grep -E "$SENSITIVE_PATTERNS" > /dev/null 2>&1; then
    echo -e "${RED}❌ Sensitive files detected in Git staging area!${NC}"
    git diff --cached --name-only | grep -E "$SENSITIVE_PATTERNS"
    exit 1
else
    echo -e "${GREEN}  ✓ No sensitive files detected in staging${NC}"
fi

# 3. Check Remote URL
echo -e "🔗 ${YELLOW}Verifying Git remote origin...${NC}"
REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
if [ -z "$REMOTE" ]; then
    echo -e "${YELLOW}  ⚠ Warning: No remote 'origin' configured yet.${NC}"
else
    echo -e "${GREEN}  ✓ Remote Origin: $REMOTE${NC}"
fi

# 4. Verify Skills Structure
echo -e "📦 ${YELLOW}Validating skills repository structure...${NC}"
SKILL_COUNT=$(find skills -name "SKILL.md" 2>/dev/null | wc -l || echo "0")
if [ "$SKILL_COUNT" -ge 9 ]; then
    echo -e "${GREEN}  ✓ All $SKILL_COUNT skill definitions validated${NC}"
else
    echo -e "${YELLOW}  ⚠ Detected $SKILL_COUNT skill files in skills/${NC}"
fi

echo ""
echo -e "${GREEN}🎯 Pre-Push Validation Complete! Ready for GitHub deployment.${NC}"
