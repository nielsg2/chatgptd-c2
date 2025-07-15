<!--
📄 Template: session_memory_template.md
───────────────────────────────────────
Purpose:
This file serves as the standard template for all ChatGPTD session logs.
Each log captures a structured summary of key actions, commands, files used,
post-session checks, and pending items, enabling memory continuity and agent context
rehydration.

Usage:
- Copy and rename this file to: session_log_<timestamp>.md (e.g., session_log_2025-07-12T20-41Z.md)
- Fill in actual actions, commands, file references, and deltas for the current session
- Maintain this format across sessions to allow AI agents and humans to parse logs consistently

Used by:
- chatgptd-local agent (and future daemons)
- Human operator for repo tracking and continuity
- Session rehydration mechanisms for AI directive and memory reload

Generated/Updated: {{Insert datetime here}}

───────────────────────────────────────
SessionID: {{ISO8601 timestamp, e.g. 2025-07-12T20-41Z}}
Agent: chatgptd-local-[agent-id]
User: Niels Goldstein
Repo: chatgptd-c2
Filename: session_log_{{timestamp}}.md
SHA256: {{autofilled after commit}}
-->

# ⏳ Session Log — {{Friendly Date/Time}}

## 🧠 Key Actions Completed:
- Action or outcome summary item 1
- Action or outcome summary item 2
- Action or outcome summary item 3

## 🖥️ Commands Issued:
```powershell
# Exact commands run during session
command goes here
another-command goes here
```

## 🔧 Files Used:
- File or script path used during session

## 📍 Next Check After Reboot / Session:
- Item 1 to confirm or rerun
- Logfile(s) to check
- Optional: re-run diagnostic commands

## 💬 Pending/Left Open:
- Remaining tasks or design deltas
- Future integration targets (e.g., SQLite, watchdog, etc.)
- Memory rehydration or context resume triggers

## 🧠 Directives Loaded:
- Example: All `.ps1` scripts must be stored in `Utilsrepo\Scripts`
- Example: Validate mounts before archival
- (optional section if no directives were loaded)

## 🔄 Resume Instructions:
- Step 1 for next session continuity
- Reload: `AI_DIRECTIVES.txt`
- Resume from: `command.json` or pending backlog

<!-- ✅ Test write from OpenAI CLI context -->
- Re-read: `session_memory\AI_DIRECTIVES.txt` (linked to master directives file)
