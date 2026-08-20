---
name: security-privacy-auditor
description: Comprehensive security, privacy, human-craft quality, and pre-deployment validation with token-efficient scanning protocols and Git configuration verification.
---

# Security & Privacy Auditor with Human-Craft Integration + Pre-Deployment Validation (v3.0.0)

A comprehensive auditing framework, decision system, and pre-deployment verification suite for assessing security posture, data privacy compliance, code quality, authentic human-craft engineering, and deployment readiness across any language, framework, or codebase.

---

## 1. Core Principles & Philosophy

1. **Security Through Authentic Engineering:** Security mechanisms must be real, functional, and verifiable. Simulated auth, mock tokens in production paths, and fake success states are classified as critical vulnerabilities.
2. **Human-Craft Quality Standard:** Audits assess not only security vulnerabilities but also code clarity, domain-rich naming, meaningful decision-record comments, and 6-month maintainability.
3. **Deployment Safety & Zero-Leak Guarantee:** Ensure builds pass, tests succeed, sensitive files (`.env`, `.pem`, keys) are never tracked, and Git author identity matches production standards before pushing.
4. **Token-Optimized Progressive Scanning:** Prioritize high-risk vectors (authentication, cryptography, data access, deployment configs) before expanding analysis to business logic and utility layers.
5. **Relentless Reality Check:** Document actual data flows, security boundaries, and deployment readiness as implemented in code, not assumed or intended states.

---

## 2. Enhanced Audit Framework (8 Core Modules)

### Module 1: Comment & Documentation Analysis (Human-Craft Enhanced)
- [ ] **Decision Records:** Comments must explain *WHY* an architectural or security decision was made, not restate *WHAT* the code does.
- [ ] **No Robotic Paraphrasing:** Flag robotic or auto-generated syntax comments (e.g., `// set user name`, `// get order id`).
- [ ] **TODO / FIXME / HACK Implications:** Audit all debt tags for security bypasses, unhandled exceptions, or unfinished authentication checks.
- [ ] **Sensitive Info in Comments:** Detect hardcoded credentials, test accounts, internal IPs, API keys, or staging credentials in code annotations.
- [ ] **Documentation Accuracy:** Flag discrepancies where comments describe behaviors that contradict the actual code implementation.
- [ ] **Domain-Rich Terminology:** Ensure terminology reflects actual business domains rather than generic programming jargon.

### Module 2: Codebase Structure & Architecture (Human-Craft Enhanced)
- [ ] **Semantic Domain Naming:** Ensure functions and entities reflect domain intent (`calculateProratedRefund` vs generic `handleData`, `processInfo`).
- [ ] **Dependency Tree & Attack Surface:** Identify unnecessary, unmaintained, or bloated third-party dependencies.
- [ ] **Dead Code & Zombie Endpoints:** Detect unreferenced routes, deprecated handlers, and unreachable logic that increase the attack surface.
- [ ] **Circular Dependencies & Duplication:** Identify tightly coupled modules and duplicated critical business logic.
- [ ] **6-Month Maintainability:** Assess whether an engineer unfamiliar with the project could safely modify the code in 6 months.
- [ ] **Convention Preservation:** Ensure security fixes and patterns preserve existing codebase idioms and styling.

### Module 3: Security Practices & Defenses (Human-Craft Enhanced)
- [ ] **Authentication:** Enforce secure credential verification, robust password hashing (bcrypt/argon2), and multi-factor/token validation. Zero tolerance for simulated auth.
- [ ] **Authorization & Access Control:** Verify role/permission checks on every protected endpoint and database query (prevent IDOR/BOLA).
- [ ] **Input Validation & Sanitization:** Validate all incoming parameters against strict schemas (type, length, format, regex).
- [ ] **Output Encoding & Sanitization:** Ensure safe rendering and escaping across HTML, JSON, CLI, and database outputs.
- [ ] **Cryptographic Implementations:** Audit cipher suites, key generation, IV randomness, and secure storage (no deprecated MD5/SHA1 for security).
- [ ] **Session Management:** Verify cookie flags (`Secure`, `HttpOnly`, `SameSite=Strict/Lax`), session timeouts, and token invalidation on logout.
- [ ] **Production Error Handling:** Ensure stack traces, database schemas, and system internals are never leaked to end users.

### Module 4: Vulnerability & OWASP Top 10 Detection
- [ ] **Injection Flaws:** SQL injection (ensure parameterized queries/ORMs), Command injection, LDAP injection, NoSQL injection.
- [ ] **Cross-Site Scripting (XSS):** Audit DOM manipulation, `dangerouslySetInnerHTML`, unescaped template variables.
- [ ] **Cross-Site Request Forgery (CSRF):** Verify anti-CSRF tokens or strict SameSite cookies on state-changing requests.
- [ ] **Server-Side Request Forgery (SSRF):** Inspect outbound HTTP clients requesting URLs derived from user input.
- [ ] **Path Traversal / LFI / RFI:** Audit file system access (`fs.readFile`, `open()`, path joins) for un-sanitized relative paths.
- [ ] **Buffer Overflows & Race Conditions:** Identify check-then-act race conditions in financial, inventory, or authentication operations.

### Module 5: Privacy, Data Governance & Compliance (GDPR / CCPA)
- [ ] **PII Identification & Flow:** Map collection, storage, and transmission of Personally Identifiable Information (emails, phones, SSNs, location).
- [ ] **Data Retention & Deletion:** Verify data lifecycle mechanisms, soft-delete policies, and "Right to be Forgotten" support.
- [ ] **Third-Party Telemetry & Trackers:** Audit tracking scripts, SDKs, and network calls sharing user data with external vendors.
- [ ] **User Consent Verification:** Verify explicit consent capture before firing tracking cookies or processing sensitive personal data.
- [ ] **Encryption at Rest & in Transit:** Enforce TLS 1.3/1.2 in transit and AES-GCM / KMS-managed encryption for data at rest.

### Module 6: Hardcoded Values & Strict Anti-Simulation
- [ ] **Zero Hardcoded Secrets:** Scan for exposed API keys, private keys, database connection strings, JWT secrets, and AWS/GCP credentials.
- [ ] **Strict Anti-Simulation Protocol:**
  - Every API endpoint called must be a real, operational backend or valid service contract.
  - Every database query must target an actual schema with realistic constraints.
  - Interactive components must have real state transitions, not static mock triggers.
  - No mock/placeholder data allowed in production build configurations.

### Module 7: Human-Written Verification & Authorship (Human-Craft Core)
- [ ] **Authentic Engineering Patterns:** Code exhibits domain-specific vocabulary, non-obvious constraints, and documented tradeoffs.
- [ ] **Suppression of Generic AI Boilerplate:** Replace bloated over-abstractions with clean, idiomatic, direct implementations.
- [ ] **Understanding Before Modification:** Evidence of understanding full dependency chains and side-effects before refactoring.

### Module 8: Pre-Deployment Validation (NEW)
- [ ] **Build & Compilation Verification:**
  - Application builds cleanly without errors (`npm run build`, `cargo build`, `go build`, etc.).
  - No TypeScript or compiler errors (`npm run type-check`).
  - No linting violations (`npm run lint`, `flake8`, `golangci-lint`).
  - All unit, integration, and end-to-end tests pass cleanly.
  - Zero runtime startup exceptions or unhandled promise rejections.
- [ ] **Git Configuration & Author Identity:**
  - `git config user.name` is configured with the correct author name (not default `user`, `root`, or blank).
  - `git config user.email` matches intended GitHub/GitLab account (no `localhost`, `example.com`, or accidental personal/work email crossover).
  - Remote repository URL (`git remote -v`) points to the correct destination repository.
  - Target branch is appropriate (feature branch vs direct main push verification).
- [ ] **Repository Hygiene & Leak Prevention:**
  - Zero `.env`, `.pem`, `.key`, or credentials files tracked in Git stage (`git diff --cached`).
  - `.gitignore` properly covers build artifacts (`node_modules`, `dist`, `.next`, target dirs).
  - No temporary debug code left in production (`console.log`, `debugger`, `var_dump`, `print`).
  - No accidental tracking of large binary files.
- [ ] **Hosting & Provider Readiness:**
  - Environment variables configured in hosting provider (Vercel, Netlify, Cloudflare, GCP).
  - Production domain, SSL certificates, and CI/CD pipelines configured and validated.

---

## 3. Token-Optimized Scanning Strategy

```text
┌─────────────────────────────────────────────────────────────────────────┐
│ Tier 1: Critical Vectors (100% In-Depth Scan & Deployment Blockers)     │
│ - Auth modules, crypto, payment flows, PII, Git config, secrets, build  │
└────────────────────────────────────┬────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ Tier 2: High Priority (Targeted AST & Boundary Analysis)                │
│ - API routes, controllers, database models, file I/O, deployment config │
└────────────────────────────────────┬────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ Tier 3: Medium Priority (Pattern Matching & Sampling)                   │
│ - Business logic, state management, validation layers, build scripts    │
└────────────────────────────────────┬────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ Tier 4: Low Priority (Lightweight Regex & Sanity Checks)                │
│ - Static configs, styling tokens, utilities, helpers, documentation     │
└─────────────────────────────────────────────────────────────────────────┘
```

### Custom Rules Engine (with Deployment Gates)

```yaml
custom_rules:
  - name: "sql_injection_risk"
    pattern: "(execute|raw|query)\\s*\\(\\s*[`\"'].*\\$\\{"
    severity: "CRITICAL"
    human_craft_impact: "Security through proper parameterization"
    deployment_blocking: true
    
  - name: "hardcoded_secret"
    pattern: "(?i)(api[_-]?key|secret|password|private[_-]?key|token)\\s*=\\s*['\"][A-Za-z0-9_\\-]{16,}['\"]"
    severity: "CRITICAL"
    human_craft_impact: "Exposed credentials risk data compromise"
    deployment_blocking: true

  - name: "sensitive_file_tracked"
    pattern: "\\.(env|pem|key|secret|credentials)$"
    severity: "CRITICAL"
    human_craft_impact: "Configuration leakage in version control"
    deployment_blocking: true

  - name: "invalid_git_config"
    pattern: "user\\.email.*(localhost|example\\.com)"
    severity: "CRITICAL"
    human_craft_impact: "Incorrect authorship and broken commit attribution"
    deployment_blocking: true

  - name: "simulation_or_stub"
    pattern: "\\b(mock_response|fake_token|simulate_auth|dummy_data)\\b"
    severity: "HIGH"
    human_craft_impact: "Simulation pattern masking real system state"
    deployment_blocking: true

  - name: "debug_code_present"
    pattern: "\\b(console\\.log|debugger|var_dump|print\\()\\b"
    severity: "MEDIUM"
    human_craft_impact: "Debug telemetry left in production path"
    deployment_blocking: false

  - name: "generic_naming"
    pattern: "\\b(function|const|let|def)\\s+(handleData|processInfo|doTask|manageItem)\\b"
    severity: "MEDIUM"
    human_craft_impact: "Domain-rich naming required"
    deployment_blocking: false

  - name: "robotic_comments"
    pattern: "^\\s*(//|#|/\\*)\\s*(get|set|return|call|initialize)\\s+\\w+\\s*$"
    severity: "LOW"
    human_craft_impact: "Comments as decision records"
    deployment_blocking: false
```

---

## 4. Pre-Push Validation Script Template

```bash
#!/bin/bash
# pre-push-validation.sh - Complete pre-push and pre-deployment checklist

echo "🔍 Running Comprehensive Pre-Push Validation..."

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

check_command() {
    if $1 &>/dev/null; then
        echo -e "${GREEN}✅ $2${NC}"
        return 0
    else
        echo -e "${RED}❌ $2${NC}"
        return 1
    fi
}

# 1. Build Check
echo "📦 Checking build..."
check_command "npm run build" "Build successful" || exit 1

# 2. Test Check
echo "🧪 Running tests..."
check_command "npm run test" "Tests passed" || exit 1

# 3. Lint Check
echo "🔍 Running linter..."
check_command "npm run lint" "Linting passed" || exit 1

# 4. Git Config Validation
echo "👤 Validating git configuration..."
NAME=$(git config --get user.name)
EMAIL=$(git config --get user.email)

if [[ -z "$NAME" ]] || [[ "$NAME" == "user" ]]; then
    echo -e "${RED}❌ Invalid git user.name: '$NAME'${NC}"
    echo -e "${YELLOW}   Fix: git config user.name \"Your Name\"${NC}"
    exit 1
else
    echo -e "${GREEN}✅ Git user.name: $NAME${NC}"
fi

if [[ -z "$EMAIL" ]] || [[ "$EMAIL" == *"localhost"* ]] || [[ "$EMAIL" == *"example.com"* ]]; then
    echo -e "${RED}❌ Invalid git user.email: '$EMAIL'${NC}"
    echo -e "${YELLOW}   Fix: git config user.email \"your@email.com\"${NC}"
    exit 1
else
    echo -e "${GREEN}✅ Git user.email: $EMAIL${NC}"
fi

# 5. Sensitive Files Check
echo "🔒 Checking for sensitive files..."
SENSITIVE_PATTERNS='\.(env|pem|key|secret|credentials)'
if git diff --cached --name-only | grep -E "$SENSITIVE_PATTERNS"; then
    echo -e "${RED}❌ Sensitive files detected in commit stage!${NC}"
    exit 1
else
    echo -e "${GREEN}✅ No sensitive files detected${NC}"
fi

# 6. Remote Check
echo "🔗 Checking remote..."
REMOTE=$(git remote get-url origin 2>/dev/null)
if [[ -z "$REMOTE" ]]; then
    echo -e "${RED}❌ No remote 'origin' configured${NC}"
    exit 1
else
    echo -e "${GREEN}✅ Remote: $REMOTE${NC}"
fi

echo ""
echo -e "${GREEN}🎯 Pre-Push Validation Complete! Safe to push.${NC}"
```

---

## 5. Comprehensive Audit Report Template

```markdown
# Security, Human-Craft & Deployment Audit Report

## Executive Summary
- **Overall Risk Level:** [CRITICAL | HIGH | MEDIUM | LOW]
- **Human-Craft Compliance:** [Score: 0-100%]
- **Deployment Readiness:** [READY | NOT READY]
- **Total Files Audited:** [Count]
- **Vulnerabilities Found:** [Critical: X | High: Y | Medium: Z | Low: W]

---

## Deployment Readiness Assessment

### Build & Runtime Status
- **Build Status:** [PASS | FAIL]
- **Type Checking:** [PASS | FAIL]
- **Test Suite:** [PASS | FAIL | Coverage: %]
- **Startup Exceptions:** [NONE | DETECTED]

### Git Configuration & Identity
- **Configured Author:** `[user.name] <[user.email]>`
- **Identity Valid:** [YES | NO]
- **Remote Origin:** `[url]`
- **Target Branch:** `[branch]`

### Sensitive Data & Hygiene
- **Environment / Secret Files Tracked:** [NONE | DETECTED]
- **Hardcoded Secrets:** [NONE | DETECTED]
- **Debug Artifacts Present:** [NONE | DETECTED]

---

## Critical & High Vulnerabilities

### 1. [Vulnerability Title]
- **Severity:** `CRITICAL` / `HIGH`
- **Location:** `[filepath:line]`
- **OWASP Category:** [e.g., A03:2021-Injection]
- **Deployment Blocking:** `YES` / `NO`
- **Description:** [Concise technical summary]
- **Remediation Plan:**
  ```diff
  - vulnerableCode();
  + secureCode();
  ```

---

## Human-Craft Findings
- **Anti-Simulation Checks:** [PASSED / FAILED]
- **Semantic Domain Naming:** [PASSED / NEEDS IMPROVEMENT]
- **Decision Record Comments:** [PASSED / NEEDS IMPROVEMENT]

---

## Prioritized Remediation Roadmap
1. **Immediate Blockers (Pre-Deployment):** [List blocking items]
2. **Short-Term Security Fixes:** [List high/medium items]
3. **Long-Term Human-Craft Refactoring:** [List maintainability improvements]
```

---

## 6. Pre-Audit & Pre-Deployment Verification Checklist

```markdown
## Pre-Audit Verification
- [ ] All interactive elements and endpoints are functional.
- [ ] No fake or simulated API responses mask errors.
- [ ] Domain-specific, semantic terminology is used consistently.
- [ ] Comments document rationale, edge cases, and non-obvious constraints.

## Pre-Deployment Gate
- [ ] Application builds without errors (`npm run build`).
- [ ] All test suites pass without failures (`npm run test`).
- [ ] Git `user.name` and `user.email` are validated.
- [ ] Zero sensitive files or credentials in git stage.
- [ ] Debug logging and breakpoints removed from production paths.
- [ ] Remote origin URL and branch target verified.
- [ ] CI/CD pipeline and environment variables verified.
```
