# Human Craft & AI Agent Engineering Suite

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Antigravity Compatible](https://img.shields.io/badge/Antigravity-Ready-brightgreen.svg)]()
[![Claude Code Compatible](https://img.shields.io/badge/Claude%20Code-Ready-blueviolet.svg)]()
[![Cursor Compatible](https://img.shields.io/badge/Cursor-Ready-orange.svg)]()

A portable, modular **engineering philosophy, security auditor, and AI agent engineering suite** that makes AI coding agents operate like elite senior software engineers, thoughtful product designers, and security professionals inside real production codebases.

---

## 🏛️ The Engineering Triad

```text
┌──────────────────────────────────────────────────────────────────┐
│ 1. human-craft                                                  │
│    Core engineering philosophy, maintainability & UI restraint   │
└─────────────────────────────────┬────────────────────────────────┘
                                  │
                                  ▼
┌──────────────────────────────────────────────────────────────────┐
│ 2. security-privacy-auditor (v3.0)                              │
│    Vulnerability detection, privacy & pre-deployment gates       │
└─────────────────────────────────┬────────────────────────────────┘
                                  │
                                  ▼
┌──────────────────────────────────────────────────────────────────┐
│ 3. ai-agent-engineering-suite (v5.0 Modular)                     │
│    Architecture, RAG, Memory, MCP, Multi-Agent & Evaluation     │
└──────────────────────────────────────────────────────────────────┘
```

---

## 📦 Suite Components

### 1. Core Engineering & Quality
- **[`human-craft`](./SKILL.md)**: Universal engineering philosophy, decision hierarchy, semantic domain naming, zero-simulation rule, and the 6-month maintainability standard.

### 2. Security, Privacy & Pre-Deployment
- **[`security-privacy-auditor`](./skills/security-privacy-auditor/SKILL.md)**: Comprehensive OWASP Top 10 auditing, comment analysis (decision records vs robotic comments), GDPR/CCPA privacy checks, anti-simulation enforcement, Git author identity verification, and pre-deployment blocking gates.

### 3. Modular AI Agent Engineering Suite
- **[`ai-agent-engineering-suite`](./skills/ai-agent-engineering-suite/SKILL.md)**: Master orchestrator and index routing tasks to specialized domain modules, enhanced with critical thinking, testing integrity, and plan adherence.
- **[`agent-architecture-core`](./skills/agent-architecture-core/SKILL.md)**: ReAct loops, hierarchical planning, state machines, and structured tool-use frameworks.
- **[`agent-context-rag-memory`](./skills/agent-context-rag-memory/SKILL.md)**: Context budgeting, prompt compression, hybrid search (BM25 + vector), and multi-tier memory (episodic, semantic, procedural).
- **[`agent-mcp-development`](./skills/agent-mcp-development/SKILL.md)**: Model Context Protocol (MCP) server & client development, JSON-RPC 2.0 compliance, and tool/resource exposure.
- **[`agent-multi-orchestration`](./skills/agent-multi-orchestration/SKILL.md)**: Multi-agent coordination, swarms, inter-agent message schemas, consensus mechanisms, and human-in-the-loop escalation.
- **[`agent-workflow-automation`](./skills/agent-workflow-automation/SKILL.md)**: Event-driven workflows, background workers, rate limiters, DLQs, and retry mechanisms with exponential backoff.
- **[`agent-eval-testing`](./skills/agent-eval-testing/SKILL.md)**: Trajectory benchmarks, LLM-as-a-judge frameworks, chaos testing, and token/cost performance monitoring.
- **[`agent-security-governance`](./skills/agent-security-governance/SKILL.md)**: Direct/indirect prompt injection defense, output guardrails, PII redaction, and compliance.

---

## 🚀 Quick Install (Global Antigravity)

### Windows (PowerShell)
```powershell
# Install all skills across all projects
iwr -useb https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/install.ps1 | iex

# Or install from local cloned repository
.\install.ps1 -Target all
```

### macOS / Linux (Bash)
```bash
# Install all skills across all projects
curl -fsSL https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/install.sh | bash -s -- all

# Or install from local cloned repository
./install.sh all
```

Skills are installed globally into `~/.gemini/config/skills/` (or `%USERPROFILE%\.gemini\config\skills\` on Windows) and become immediately active across every Antigravity workspace.

---

## 📁 Repository Structure

```text
.
├── SKILL.md                          # human-craft universal skill
├── install.ps1                       # Windows PowerShell installer
├── install.sh                        # macOS / Linux installer
├── .gitignore                        # Repository hygiene & secret filtering
├── scripts/
│   └── pre-push-validation.sh        # Pre-push deployment readiness checker
└── skills/
    ├── security-privacy-auditor/     # Security & Pre-Deployment Auditor (v3.0)
    ├── ai-agent-engineering-suite/   # Master AI Engineering Index
    ├── agent-architecture-core/      # Core Agent Architecture & State
    ├── agent-context-rag-memory/     # Context Budgets, RAG & Memory
    ├── agent-mcp-development/        # Model Context Protocol (MCP)
    ├── agent-multi-orchestration/    # Multi-Agent Coordination & HITL
    ├── agent-workflow-automation/    # AI Automation, Queues & DLQs
    ├── agent-eval-testing/           # Evaluation, Benchmarks & Metrics
    └── agent-security-governance/    # Prompt Defense & Guardrails
```

---

## 🛠️ Pre-Deployment Verification

Before committing and pushing changes to GitHub, run the pre-push validation script:

```bash
# Run validation check
bash scripts/pre-push-validation.sh
```

---

## 📄 License

This project is open-source under the [MIT License](./LICENSE).
