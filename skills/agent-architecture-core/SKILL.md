---
name: agent-architecture-core
description: Core AI agent architecture, planning systems, tool use frameworks, state management, execution engines, and API integration with human-craft quality standards.
---

# Agent Architecture & Core Engineering

Architectural patterns, execution frameworks, state management, and tool-use systems for building production-grade autonomous and semi-autonomous AI agents.

---

## 1. Core Principles

1. **Deterministic Foundations:** Agent loops must have clear termination boundaries, max step limits, and structured state transitions. Never leave agent loops unbounded.
2. **Authentic Tool Execution:** Every tool call and perception loop must execute against real interfaces. No simulated stubs or mock side-effects in production paths.
3. **Semantic Domain Clarity:** Name agent actions, state transitions, and schemas using explicit business domain terms (`planOrderFulfillment` vs `processTask`).
4. **Token Budget Awareness:** Design state serialization and tool schemas to minimize unnecessary token overhead while preserving critical decision context.

---

## 2. Agent Architecture Patterns

### Pattern A: ReAct (Reasoning + Acting) Loop
```text
┌─────────────────────────────────────────────────────────────┐
│ 1. Perception & Context Observation                        │
│    - User intent, environmental state, previous tool output │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 2. Thought / Deliberation Step                              │
│    - Analyze state, formulate hypothesis, evaluate tradeoffs │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 3. Tool Action Invocation                                   │
│    - Strict schema validation, parameter binding            │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 4. Observation & State Update                               │
│    - Parse output, handle errors, check termination goal    │
└─────────────────────────────────────────────────────────────┘
```

### Pattern B: Plan-and-Solve (Hierarchical Planning)
- **Decomposition Stage**: Break down complex user requests into discrete, topologically sorted dependency steps.
- **Execution Stage**: Dispatch step-specific sub-tasks to specialized tools or subagents.
- **Dynamic Re-planning**: Trigger plan revision only when runtime invariants or step assertions fail.

---

## 3. Engineering Checklist

### Core Architecture & State
- [ ] Explicitly define agent goals, operational constraints, and stopping criteria.
- [ ] Implement robust state serialization (snapshots, checkpoints, rollback capability).
- [ ] Enforce hard recursion and loop limiters (`max_iterations`, `timeout_seconds`).
- [ ] Build idempotent action execution where tool failures can safely retry.
- [ ] Implement graceful degradation and fallback strategies when LLM responses degrade.

### Tool Definition & Execution Framework
- [ ] Define strict JSON Schema / Pydantic / Zod contracts for all tool inputs and outputs.
- [ ] Enforce input validation and sanitization prior to executing tool side-effects.
- [ ] Return structured, actionable error messages back to the LLM on tool failure (enabling self-correction).
- [ ] Implement tool-use rate limiting and permission authorization checks.

### Human-Craft Quality Gates
- [ ] **Semantic Naming**: Name functions and classes based on real-world actions (`resolvePaymentDispute` not `doStep`).
- [ ] **Decision Records**: Comments explain *WHY* an agent strategy or planning heuristic was chosen.
- [ ] **6-Month Maintainability**: State machine definitions must be self-documenting and readable by any engineer.
- [ ] **Zero Simulation**: Ensure tool handlers connect to live infrastructure or certified sandboxes.
