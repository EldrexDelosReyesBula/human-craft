---
name: agent-mcp-development
description: Model Context Protocol (MCP) server and client implementation, protocol compliance, tool and resource schemas, security boundaries, and local/remote testing.
---

# MCP (Model Context Protocol) Server & Client Engineering

Standardized protocols, architecture, and quality standards for designing, building, securing, and testing Model Context Protocol (MCP) servers and clients.

---

## 1. MCP Architectural Core

The Model Context Protocol establishes standardized JSON-RPC 2.0 communication between AI host applications and external data/tool providers:

```text
┌─────────────────────────────────────────────────────────────┐
│ AI Host Application / Agent Client (e.g., Antigravity)      │
└──────────────────────────────┬──────────────────────────────┘
                               │  JSON-RPC (stdio / SSE)
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ MCP Server                                                  │
│ ├── Tools: Executable functions with JSON Schema input      │
│ ├── Resources: Read-only data/files exposed via URIs        │
│ └── Prompts: Parameterized prompt templates                 │
└─────────────────────────────────────────────────────────────┘
```

---

## 2. Server Implementation Standards

### 1. Tool Design & Schema Contract
- [ ] Every tool must declare an explicit JSON Schema defining `type`, `properties`, and `required` fields.
- [ ] Descriptions for tools and arguments must be precise and unambiguous to guide LLM tool-calling accuracy.
- [ ] Return structured content blocks (`text`, `image`, `resource`) with explicit status formatting.

### 2. Resource Management & URI Schemes
- [ ] Structure resource URIs using standardized schemes (`custom-server://data-source/resource-id`).
- [ ] Implement dynamic resource templates with parameter expansion where appropriate.
- [ ] Support resource subscriptions and change notifications for reactive agent workflows.

### 3. Error Handling & Protocol Compliance
- [ ] Adhere strictly to JSON-RPC 2.0 error codes (`-32700` Parse error, `-32600` Invalid request, `-32601` Method not found, `-32602` Invalid params, `-32603` Internal error).
- [ ] Return domain-specific error details in the `error.data` field to enable agent self-correction.
- [ ] Prevent unhandled exceptions from crashing the `stdio` transport pipe.

---

## 3. Security & Operational Boundaries

- [ ] **Transport Isolation**: Stdio transports must never emit unformatted debug text to `stdout` (use `stderr` for server logging).
- [ ] **Parameter Sanitization**: Validate and sanitize all tool arguments before passing to operating system commands, databases, or network sockets.
- [ ] **Principle of Least Privilege**: Limit MCP server capabilities strictly to authorized directories or database scopes.
- [ ] **Authentication & Token Management**: For SSE/HTTP transports, enforce bearer token authentication and TLS encryption.

---

## 4. Human-Craft Quality Gates

- [ ] **Authentic Real Integration**: No simulated mock data in tool responses; connect directly to target services.
- [ ] **Semantic Naming**: Name tools by clear domain actions (`queryCustomerBillingHistory` vs `mcp_call_1`).
- [ ] **Production-Ready Logging**: Log diagnostic information cleanly to `stderr` with timestamp and level markers.
- [ ] **Schema Versioning**: Document schema versions and backward-compatibility guarantees.
