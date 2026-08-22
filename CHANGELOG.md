# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.0] - 2026-08-22

### Added
- **`ai-agent-engineering-suite` (v5.0.0)**: Major enhancement integrating critical thinking, plan adherence, testing integrity, and assertiveness frameworks:
  - **Testing Integrity Principle**: Mandates real, interactive, exploratory testing (manual UI inspections, real API requests, database queries, file verification) and prohibits relying solely on test scripts.
  - **Plan Adherence & Critical Thinking**: Conflict detection triggers and `CriticalPlanAnalyzer` framework to evaluate and question contradictory plans.
  - **Constructive Disagreement Protocol**: 5-step communication model (Identify Conflict, Explain Implications, Provide Evidence, Offer Alternatives, Clarifying Questions).
  - **Enhanced Testing Approach**: `ManualVerification` protocol and comprehensive test reliability truth table.
  - **AI Assertiveness Framework**: Explicit push-back triggers with concrete real-world dialogue examples (security, architecture, technical debt).
  - **Enhanced Human-Craft Integration**: Architecture Decision Record (ADR) standards for code comments, CHANGELOGs, and PR discussions.
  - **Token Optimization Matrix**: Push-back priority levels (`critical`, `high`, `medium`, `low`) and token-aware quick conflict analysis.
  - **Master Verification Protocol**: Comprehensive pre-completion sign-off checklist across code verification, plan adherence, human-craft compliance, and documentation.

### Changed
- Synced updated `ai-agent-engineering-suite` skill definition across local workspace and global Antigravity configuration (`~/.gemini/config/skills/`).

---

## [2.0.0] - 2026-08-20

### Added
- **`security-privacy-auditor` (v3.0.0)**: Comprehensive auditing framework covering 8 core modules (Comments as decision records, semantic domain naming, OWASP Top 10, GDPR/CCPA privacy, anti-simulation enforcement, and pre-deployment blocking gates).
- **`ai-agent-engineering-suite`**: Master orchestrator and index routing tasks to specialized domain modules.
- **7 Modular AI Agent Skills**:
  - `agent-architecture-core`: ReAct loops, hierarchical planning, state machines, and structured tool frameworks.
  - `agent-context-rag-memory`: Context budgeting, prompt compression, hybrid search (BM25 + vector), and multi-tier memory (episodic, semantic, procedural).
  - `agent-mcp-development`: Model Context Protocol (MCP) server & client architecture, protocol compliance, tools, resources, and prompts.
  - `agent-multi-orchestration`: Multi-agent coordination, swarms, inter-agent message contracts, consensus, and human-in-the-loop escalation.
  - `agent-workflow-automation`: Event-driven automation, worker queues, DLQs, idempotency, and retry mechanisms with exponential backoff.
  - `agent-eval-testing`: Agent benchmarking, LLM-as-a-judge frameworks, chaos testing, and token/cost performance monitoring.
  - `agent-security-governance`: Prompt injection defense, data exfiltration prevention, output guardrails, and compliance governance.
- **`scripts/pre-push-validation.sh`**: Pre-push validation script checking git user identity, verifying staged secrets, and validating skill structure.
- **`.gitignore`**: Strict exclusion rules for `.env` files, certificates, private keys, build output, and temporary cache.

### Changed
- **`install.ps1`**: Upgraded Windows installer with multi-skill targeting (`-Target all`, `human-craft`, `security-privacy-auditor`, `agent-engineering`) and automatic global directory provisioning.
- **`install.sh`**: Upgraded Unix installer with multi-skill arguments and remote GitHub fallback fetching.
- **`README.md`**: Complete overhaul structured around the **Engineering Triad**, adding architecture diagrams, suite component breakdown, and quick-install one-liners.

### Security
- Added automated blocking gates to prevent commits containing exposed secrets (`.env`, `.pem`, `.key`, `credentials.json`) or invalid git author emails.

---

## [1.0.0] - 2026-08-20

### Added
- Initial release of `human-craft` universal engineering decision system.
- Enforceable hierarchy of authority, 6-month maintainability rule, semantic naming conventions, and visual restraint standards.
- Basic installers for Windows and macOS/Linux.
