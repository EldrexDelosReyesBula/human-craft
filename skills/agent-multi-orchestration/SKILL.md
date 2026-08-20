---
name: agent-multi-orchestration
description: Multi-agent system architecture, orchestration patterns, inter-agent communication protocols, task allocation, conflict resolution, and human-in-the-loop workflows.
---

# Multi-Agent Systems & Orchestration Engineering

Architectural patterns, coordination protocols, and consensus mechanisms for building scalable, fault-tolerant multi-agent collaborative networks.

---

## 1. Orchestration Topologies

```text
1. Centralized Orchestrator (Hub-and-Spoke)
   [Orchestrator Agent] ──┬──▶ [Researcher Agent]
                          ├──▶ [Coder Agent]
                          └──▶ [Reviewer Agent]

2. Choreography / Peer-to-Peer Pipeline
   [Ingestion Agent] ──▶ [Analysis Agent] ──▶ [Synthesis Agent]

3. Hierarchical Swarm with Consensus
   [Coordinator] ──▶ [Worker Cluster] ──▶ [Consensus / Voting Gate]
```

---

## 2. Inter-Agent Communication & Messaging

### Message Schema Contract
- [ ] Implement standardized message payloads:
  - `sender_id`: Unique identifier of the emitting agent.
  - `receiver_id` or `broadcast_channel`: Target destination.
  - `conversation_id` / `trace_id`: Distributed transaction tracer.
  - `intent`: Actionable message intent (e.g. `REQUEST_ANALYSIS`, `PROPOSE_SOLUTION`, `ACKNOWLEDGE_RECEIPT`).
  - `payload`: Structured domain data adhering to schema contracts.

### Conflict Resolution & Consensus
- [ ] Define deterministic voting or consensus thresholds (majority vote, weighted confidence, orchestrator arbitration).
- [ ] Handle deadlock detection when agents enter circular argument loops.
- [ ] Implement maximum round-trip conversational limits between collaborating agents.

---

## 3. Human-in-the-Loop (HITL) Integration

- **Confidence Threshold Gates**: Escalate to a human operator when agent certainty scores drop below defined thresholds.
- **Critical Action Safeguards**: Require human sign-off before irreversible actions (e.g. database schema migrations, production deployments, financial disbursements).
- **Interactive Clarification**: Solicit targeted human input via multiple-choice or structured forms rather than open-ended stalling.

---

## 4. Human-Craft Quality Gates

- [ ] **Real Multi-Agent Coordination**: Agents must communicate through real event buses, queues, or inter-process communication. No simulated dialogue.
- [ ] **Domain-Specific Role Naming**: Name agent personas by concrete domain responsibilities (`LeadUnderwriterAgent`, `ComplianceAuditorAgent`).
- [ ] **Traceability & Auditing**: Every inter-agent message must carry a distributed trace identifier for end-to-end auditability.
- [ ] **Error Propagation Safety**: Failures in worker agents must gracefully report to coordinators without crashing the orchestration host.
