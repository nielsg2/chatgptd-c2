# Project: chatgptd

## Purpose
`chatgptd` is a locally hosted AI orchestration daemon designed to persist memory, analyze context-rich task flows, and manage long-term interactions with the OpenAI API. This project bridges the gap between ephemeral cloud AI and a continuously reasoning, memory-rich assistant operating on a user's local PC.

## Architecture Overview
- **Language:** Python (daemon + CLI)
- **Platform:** Windows (PowerShell), Linux/WSL optional
- **Backend Storage:** PostgreSQL (local) for memory, logs, and user input/output state
- **AI Engine:** OpenAI API (GPT-4o) with persistent session emulation
- **Task Model:** AI reads from structured files (`AI_DIRECTIVES.txt`, `Meta_Tasks.yml`, etc.), maintains stateful sessions, and executes context-aware workflows.

## Key Features
- Local memory layer with structured recall
- Autonomous file parsing and task assignment
- Headless daemon with API and CLI access
- Cross-platform support (PowerShell and Python integration)
- Git-friendly metadata system with Markdown and YAML configs

## Files of Interest
- `chatgptd.ps1`: PowerShell daemon wrapper and executor
- `New-AITask.ps1`: CLI interface for submitting new prompts or goals
- `AI_DIRECTIVES.txt`: Core behavioral rules and constraints for AI agents
- `Meta_Tasks.yml`: Task backlog with states, priorities, and ownership
- `Roadmap.md`: Strategic blueprint for full system buildout
- `File_Usage_Matrix.md`: File purpose, version, and location tracking

## PostgreSQL Usage
- **Database:** `chatgptd_state`
- **Tables:**
  - `memory_fragments (id, timestamp, source, content, tags)`
  - `tasks (id, status, title, content, priority, created_at)`
  - `file_index (id, filename, path, version, purpose)`
- CRUD operations will be provided via Python ORM (SQLAlchemy)

## Dependencies
- Python 3.10+
- `psycopg2` or `asyncpg`
- `requests` or `openai` SDK
- `sqlalchemy`
- `watchdog` (optional for folder monitoring)
- PowerShell 7+ for cross-env execution

## Initial Roadmap Items
1. 🧠 Implement PostgreSQL memory layer
2. 🧰 Build Python-based local daemon for ingest/output
3. 🔁 Integrate AI_DIRECTIVES.txt compliance parser
4. 🧭 Parse and update Meta_Tasks.yml dynamically
5. ✍️ Generate Markdown changelogs and Roadmap entries automatically
6. 🔒 Design access control wrapper for OpenAI key use
7. 📥 Create file ingestion pipeline with tagging and indexing
8. 🌐 (Optional) Add Flask or FastAPI REST interface

## AI Directives Summary
- Always version output
- Use structured metadata headers
- Never assume files exist — validate and create
- Persist memory to local storage after every session
- Maintain session continuity
- Report errors in human-readable and script-readable ways
- Respond contextually and without fluff
- Use absolute paths on local filesystem unless explicitly told otherwise

## Owner
Niels Goldstein (nielsg2)
https://github.com/nielsg2/chatgptd

## License
MIT License