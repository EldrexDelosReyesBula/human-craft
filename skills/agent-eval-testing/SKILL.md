---
name: agent-eval-testing
description: AI agent evaluation benchmarks, LLM-as-a-judge frameworks, synthetic test data generation, regression testing, cost/token efficiency tracking, and reliability metrics.
---

# AI Agent Evaluation & Testing Framework

Comprehensive testing strategies, benchmark datasets, automated evaluation pipelines, and cost/token tracking for AI agent systems.

---

## 1. Testing Pyramid for AI Agents

```text
               ▲
              / \
             /   \     E2E Trajectory Evaluation
            / HITL\    (LLM-as-a-Judge, Multi-Step Tasks)
           /───────\
          /         \   Tool & Integration Testing
         / Integration\ (Mocked/Sandboxed External APIs)
        /───────────────\
       /                 \ Deterministic Unit Tests
      /    Unit Tests     \ (Parsers, State Reducers, Schemas)
     /─────────────────────\
```

---

## 2. Evaluation Metrics & Frameworks

### 1. Task Completion & Accuracy
- **Trajectory Precision**: Ratio of relevant tool calls vs unnecessary/hallucinated actions.
- **Pass@K**: Rate at which the agent reaches the correct final state within K attempts.
- **Goal Completion Rate (GCR)**: Percentage of tasks fully resolved without unhandled exceptions.

### 2. LLM-as-a-Judge Evaluation Protocol
- [ ] Define pairwise or rubric-based scoring (1-5 scale) with strict evaluation prompts.
- [ ] Implement chain-of-thought rationale before the judge outputs a numeric score.
- [ ] Validate judge agreement against human-annotated baseline samples.

### 3. Cost & Latency Performance Metrics
- **Token Efficiency Score**: Tokens consumed per successful task completion.
- **Time-to-First-Token (TTFT)** and **End-to-End Latency** tracking across tool loops.
- **Cost Attribution**: Cost per trajectory mapped to specific agent sub-tasks.

---

## 3. Chaos & Robustness Testing

- **Perturbation Testing**: Introduce typos, ambiguous phrasing, and conflicting requirements into user prompts.
- **Tool Outage Injection**: Simulate tool timeouts, HTTP 500 errors, and malformed payload returns to verify agent self-correction.
- **Adversarial Jailbreak Scenarios**: Inject prompt injection attempts to test guardrail resilience.

---

## 4. Human-Craft Quality Gates

- [ ] **Real Tests Against Actual Code**: Test suites execute real assertions against agent output; no fake test passes.
- [ ] **Semantic Test Suite Names**: Name test scenarios clearly (`testInvoiceReconciliationUnderBudgetConstraint` vs `testCase1`).
- [ ] **Documented Failure Modes**: Document known failure bounds and edge cases in the test suite documentation.
- [ ] **Regression Suites in CI**: Run golden evaluation benchmarks automatically on model/prompt updates.
