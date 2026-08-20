---
name: agent-context-rag-memory
description: Context window engineering, prompt compression, RAG pipelines (chunking, hybrid search, re-ranking), and multi-tier agent memory systems (episodic, semantic, procedural).
---

# Agent Context, RAG & Memory Engineering

Design patterns and protocols for context budgeting, retrieval-augmented generation, vector search optimization, and persistent memory hierarchies in AI agent systems.

---

## 1. Context Engineering & Token Budgeting

### Context Window Hierarchy
```text
┌─────────────────────────────────────────────────────────────┐
│ 1. System Prompt & Operational Rules (Static / Cached)      │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 2. Long-Term / Semantic Memory & Injected Knowledge         │
│    - Vector search results, entity knowledge items          │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 3. Working / Episodic Memory (Rolling Conversation Window)  │
│    - Summarized historical turns, key decision checkpoints  │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 4. Immediate Turn Context & Active Tool Observations        │
└─────────────────────────────────────────────────────────────┘
```

### Prompt & Context Compression
- **Selective Summarization**: Compress completed trajectory blocks into milestone summaries.
- **Adaptive Truncation**: Truncate voluminous command or tool outputs while preserving exit codes and error tails.
- **Deduplication**: Deduplicate repeated system fragments across multi-turn messages.

---

## 2. Advanced RAG Pipeline Standards

### Ingestion & Chunking
- [ ] Implement semantic/structural chunking (by Markdown headings, code blocks, or AST boundaries) rather than arbitrary character slicing.
- [ ] Attach rich metadata (document ID, section path, timestamps, access control tags) to every chunk.

### Retrieval & Hybrid Search
- [ ] Combine dense vector embeddings with sparse keyword search (BM25) for high recall.
- [ ] Apply cross-encoder re-ranking on top-K candidates before injecting into LLM context.
- [ ] Implement query expansion and HyDE (Hypothetical Document Embeddings) for ambiguous user prompts.

---

## 3. Agent Memory Architecture

1. **Episodic Memory**: Records chronological trajectory logs, user interactions, and milestone outcomes.
2. **Semantic Memory**: Persistent conceptual knowledge graph and facts about users, codebases, or domain entities.
3. **Procedural Memory**: Standardized workflows, proven problem-solving recipes, and tool playbooks.

---

## 4. Human-Craft Quality Gates

- [ ] **Real Search & Retrieval**: Ensure vector databases, embeddings models, and chunk stores execute against real data stores.
- [ ] **Domain-Specific Naming**: Use domain entities (`retrievePatientMedicalHistory` vs `getDocs`).
- [ ] **Documented Chunking Strategies**: Explain why specific chunk sizes and overlap thresholds were selected.
- [ ] **Memory Consolidation Validation**: Verify that memory compression preserves critical domain constraints without hallucination.
