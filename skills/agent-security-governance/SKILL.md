---
name: agent-security-governance
description: AI agent security architecture, prompt injection defense, data exfiltration prevention, tool access control, guardrails, and compliance governance.
---

# AI Agent Security & Governance Framework

Security hardening protocols, prompt defense systems, output guardrails, and compliance governance for AI agent platforms.

---

## 1. Agent Threat Model (OWASP for LLMs)

```text
┌─────────────────────────────────────────────────────────────┐
│ 1. Direct & Indirect Prompt Injection                       │
│    - Untrusted user input, malicious web/document payloads  │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 2. Tool Access & Insecure Output Handling                   │
│    - Excessive agency, unauthorized tool invocations        │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 3. Data Exfiltration & Privacy Leakage                      │
│    - Leaking system prompts, PII, API tokens in responses   │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 4. Model Denial of Service & Resource Exhaustion            │
│    - Context flooding, infinite recursive tool loops        │
└─────────────────────────────────────────────────────────────┘
```

---

## 2. Defensive Controls & Guardrails

### 1. Prompt Injection Defense
- [ ] Implement strict input delimiters (`<user_data>`, `"""`) separating instructions from untrusted data.
- [ ] Run input sanitization and heuristic threat pattern scanning on third-party documents/web content before feeding into the prompt.
- [ ] Enforce tool parameter validation through schema constraints.

### 2. Tool Access Control & Permissions
- [ ] Apply the Principle of Least Privilege: restrict agent tools strictly to required capabilities.
- [ ] Enforce authorization checks per user context before granting tool execution.
- [ ] Implement human confirmation gates for destructive actions (e.g. `DROP`, `DELETE`, external transfers).

### 3. Output Guardrails & Data Leakage Prevention
- [ ] Filter model output for system prompt fragments, private keys, and credential patterns before rendering.
- [ ] Redact PII (emails, phone numbers, credit card numbers) from agent logs and external tool calls.

---

## 3. Compliance & Governance

- [ ] **Audit Trails**: Maintain cryptographically tamper-evident logs of all user prompts, LLM decisions, and executed tool calls.
- [ ] **Ethical Guidelines & Safety Policy**: Configure guardrails to reject prohibited actions (self-harm, harmful code generation, bias violation).
- [ ] **Regulatory Alignment**: Support GDPR/CCPA data subject requests (erasure of agent conversation history).

---

## 4. Human-Craft Quality Gates

- [ ] **Real Security Verification**: Security checks and guardrails must be functional, active filters rather than superficial prompt-only suggestions.
- [ ] **Semantic Naming**: Use clear security naming (`sanitizeUntrustedWebPayload` vs `cleanInput`).
- [ ] **Documented Threat Boundaries**: Clearly articulate which attack vectors are mitigated and which require human oversight.
