# 🧭 Roadmap: chatgptd Local-First AI Orchestration Daemon

## Program Objective
To build a **local-first AI orchestration system** that enables persistent memory, file and task interaction, human-AI UX interfaces, and secure ChatGPT API calls—without relying on third-party backends or data egress. The architecture follows Zero Trust principles, storing all user data locally with optional cloud sync or output redirection.

---

## A. Core Modules

### 1. Memory Engine (local_postgres)
- **Purpose:** Store compact, queryable interaction logs with tagging and summarization
- **Tech:** PostgreSQL, SQLAlchemy, optional SQLite fallback
- **Test Plan:**
  - ✅ CRUD operations
  - ✅ Multi-user session support
  - ✅ Query accuracy and summarization logic
  - ✅ Backup/export capability

### 2. AI Session Handler (ai_bridge)
- **Purpose:** Compact and transmit memory/session state to/from ChatGPT API
- **Tech:** Python + OpenAI SDK, or direct `curl` for REST interactions
- **Test Plan:**
  - ✅ API connectivity and key validation
  - ✅ Rate limit and error handling
  - ✅ Partial memory compression/synopsis delivery
  - ✅ Persistent conversation emulation

### 3. Task Manager (task_orchestrator)
- **Purpose:** Reads/writes to `Meta_Tasks.yml`, maps to internal task queue
- **Test Plan:**
  - ✅ YAML read/write integrity
  - ✅ Task status transitions and filtering
  - ✅ Tag indexing and roadmap linking

### 4. Human UX Interface (chatgptd-ui)
- **Purpose:** Local web/electron UI to manage tasks, memory, logs, file exchanges
- **Tech:** React, Tailwind, Python Flask/WS or Electron
- **Test Plan:**
  - ✅ Submit prompt and file to daemon
  - ✅ View task and memory state
  - ✅ Run pre-defined automation workflows
  - ✅ No Supabase/cloud dependency

### 5. OS Interaction Agent (local_agent)
- **Purpose:** Safely performs local file ops, command execution, and system inspection
- **Tech:** Python + PowerShell
- **Test Plan:**
  - ✅ File path validation
  - ✅ Execution sandboxing
  - ✅ Logging and rollback
  - ✅ Command/task scheduling

---

## B. Extended Modules (Proposed)

### 6. REST Interface (api_gateway)
- **Purpose:** Enable external tools to interact via `curl`/HTTP
- **Tech:** FastAPI or Flask
- **Test Plan:**
  - ✅ Authenticated API endpoints
  - ✅ Task submission and result retrieval
  - ✅ Upload/download file payloads

### 7. Agent Logger (trace_logger)
- **Purpose:** Persist daemon actions into memory/log store
- **Test Plan:**
  - ✅ Timestamped logs with source tagging
  - ✅ Error and action records
  - ✅ Audit replay functionality

### 8. File Ingestor/Classifier (filebot)
- **Purpose:** Watches folders for file drops, auto-tags and routes them
- **Tech:** Python + Watchdog
- **Test Plan:**
  - ✅ File classification
  - ✅ Task auto-generation
  - ✅ Conflict resolution

---

## C. Development & Orchestration Guidelines
- Use GitHub issues for Agile tickets
- Version all outputs and patches
- Write to `File_Usage_Matrix.md` and `Meta_Tasks.yml`
- Every module produces at least:
  - 1 README.md
  - 1 YAML metadata file
  - Optional CLI and UI hooks