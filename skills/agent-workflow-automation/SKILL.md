---
name: agent-workflow-automation
description: AI automation engineering, event-driven pipelines, background workers, retry mechanisms with exponential backoff, intelligent document processing, and queue management.
---

# AI Workflow Automation & Background Systems

Design and operational standards for building robust, event-driven AI workflow automation, background tasks, and resilient processing queues.

---

## 1. Automation Architecture Patterns

```text
[Event Source / Webhook / Cron]
               │
               ▼
   [Ingestion & Rate Limiter]
               │
               ▼
[Message Queue (BullMQ, Celery, SQS, PubSub)]
               │
               ▼
[Agent Worker Pool (Idempotent Execution)]
               │
               ├──▶ [Success -> State Store & Webhook Notification]
               └──▶ [Failure -> Exponential Backoff / Dead-Letter Queue]
```

---

## 2. Reliability & Resilience Standards

### 1. Idempotency & De-duplication
- [ ] Assign deterministic idempotency keys (`event_id` or hash of request payload) to prevent duplicate processing.
- [ ] Checkpoint execution progress so workers can resume from intermediate steps upon pod restarts.

### 2. Retry Logic & Dead-Letter Queues (DLQ)
- [ ] Implement exponential backoff with jitter for all transient external API failures (LLM rate limits, network timeouts).
- [ ] Route persistently failing tasks (e.g., after 3 or 5 attempts) to a Dead-Letter Queue with full error snapshots for investigation.

### 3. Rate Limiting & Queue Concurrency
- [ ] Enforce rate limits aligned with LLM provider token-per-minute (TPM) and request-per-minute (RPM) quotas.
- [ ] Configure concurrency limits per worker to avoid GPU/memory exhaustion.

---

## 3. Intelligent Document & Data Processing

- [ ] Structure multi-modal extraction pipelines into clear stages: ingestion, OCR/parsing, schema-mapped extraction, confidence scoring, and validation.
- [ ] Isolate schema extraction with strong type checking (Pydantic / Zod) before passing data to downstream databases.

---

## 4. Human-Craft Quality Gates

- [ ] **Real Automation**: Every workflow listener and trigger connects to real event sinks, webhooks, or queues.
- [ ] **Semantic Naming**: Use domain operations (`processMonthlyBillingRun` vs `handleTask`).
- [ ] **Documented Failure Scenarios**: Explicitly document timeouts, fallback states, and operator alerting procedures.
- [ ] **Zero Unhandled Rejections**: Catch all asynchronous promise rejections and queue errors gracefully.
