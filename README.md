# Human Craft (`human-craft`)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Antigravity Compatible](https://img.shields.io/badge/Antigravity-Ready-brightgreen.svg)]()
[![Claude Code Compatible](https://img.shields.io/badge/Claude%20Code-Ready-blueviolet.svg)]()
[![Cursor Compatible](https://img.shields.io/badge/Cursor-Ready-orange.svg)]()

A portable, framework-agnostic **engineering philosophy, decision system, and quality standard** that makes AI coding agents operate like elite senior software engineers and thoughtful product designers inside real human codebases.

---

## 🎯 The Mission

> **“Make the agent behave like a thoughtful senior engineer and product designer working inside an existing human codebase—not like a code generator following a checklist.”**

Most coding assistants default to AI generator anti-patterns: shallow copy-paste fixes, dead buttons masquerading as working UI, simulated API responses, noisy opportunistic refactors, and robotic commentary.

`human-craft` provides an enforceable decision hierarchy that prioritizes:
1. **Preserving existing conventions** over personal AI preferences.
2. **Real implementations** over mock simulations.
3. **Intentional visual restraint** over gratuitous gradients and card sprawl.
4. **The 6-Month Comprehension Rule** for long-term maintainability.
5. **Factual truth** in documentation.

---

## 🚀 Quick Install

### 1. Antigravity (Google)
#### Global (All Workspaces):
```bash
# Windows PowerShell
iwr -useb https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/install.ps1 | iex

# macOS / Linux
curl -fsSL https://raw.githubusercontent.com/EldrexDelosReyesBula/human-craft/main/install.sh | bash -s -- antigravity
```
Or copy [`SKILL.md`](./SKILL.md) directly to `~/.gemini/config/skills/human-craft/SKILL.md` (or `%USERPROFILE%\.gemini\config\skills\human-craft\SKILL.md` on Windows).

#### Project-Specific:
Copy `SKILL.md` to `.agents/skills/human-craft/SKILL.md` within your project repository.

---

### 2. Claude Code
Append or import `human-craft` in your `CLAUDE.md`:
```markdown
## Engineering Philosophy & Decision System
See: .claude/skills/human-craft/SKILL.md
```
Or copy [`SKILL.md`](./SKILL.md) to `.claude/skills/human-craft/SKILL.md`.

---

### 3. Cursor
Add a reference in `.cursorrules` or `.cursor/rules/human-craft.mdc`:
```markdown
# Human Craft Quality Standards
Adhere strictly to the engineering and product design standards defined in human-craft:
- Real implementations by default (strict anti-simulation)
- Semantic domain naming
- Visual restraint and layered hierarchy in UI
- 6-month maintainability rule
```

---

### 4. Windsurf / GitHub Copilot / General Agents
Add `SKILL.md` to your workspace instructions directory (e.g., `.windsurfrules` or `.github/copilot-instructions.md`).

---

## 🏛️ Universal Hierarchy of Authority

```text
1. Platform Safety & Operational Constraints
         ↓
2. User's Explicit Request & In-Turn Directives
         ↓
3. Repository-Specific Instructions (AGENTS.md, CLAUDE.md)
         ↓
4. Existing Codebase Conventions & Idioms
         ↓
5. Established Project Architecture & Design System
         ↓
6. human-craft Universal Skill
         ↓
7. Generic AI Biases & Personal Preferences
```

---

## 💎 Core Tenets

| Tenet | Meaning |
| :--- | :--- |
| **Understand Before Modifying** | Inspect and trace dependencies progressively before editing. |
| **The 6-Month Rule** | Write code that an unfamiliar engineer can safely modify 6 months from now during an outage. |
| **Domain-Rich Naming** | Use the language of the business domain (`calculateProratedRefund`), not generic mechanics (`handleData`). |
| **Comments as Decision Records** | Explain non-obvious constraints, edge cases, and tradeoffs—never paraphrase obvious syntax. |
| **Visual Restraint Doctrine** | Build beauty through typography, spacing, and contrast. Hard ban on gratuitous gradients, blurry glassmorphism, and card-in-card clutter. |
| **Strict Anti-Simulation** | Every interactive element, API call, and database query must be functional. Never create fake success states without explicit consent. |
| **Verifiable Reality in Docs** | Document what actually runs today, never what was intended or imagined. |

---

## 📋 8-Step Engineering Workflow

```text
1. UNDERSTAND ──► Clarify intent, constraints, and success criteria.
2. INSPECT    ──► Discover existing patterns, files, and dependencies.
3. PLAN       ──► Determine the smallest coherent implementation.
4. IMPLEMENT  ──► Write clean, domain-aligned, human-like code.
5. INTEGRATE  ──► Connect properly to existing state, routes, and styles.
6. VERIFY     ──► Run linters, types, tests, and manual validation.
7. CLEAN UP   ──► Remove debug logs, unused imports, and temp files.
8. DOCUMENT   ──► Update documentation to reflect actual changes.
9. Verify changes on production.
```

---

## 📄 License

MIT © [Eldrex Delos Reyes Bula](LICENSE)
