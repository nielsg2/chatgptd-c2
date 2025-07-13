# chatgptd-c2 Agent Architecture Definition (.aidl)

# Version: 1.0

# Author: Niels Goldstein (nielsg2)

# License: MIT

## Overview

This agent system uses a public GitHub repo as a command-and-control relay (`chatgptd-c2`) between a local daemon (`chatgptd`) and ChatGPT. It relies on file-based coordination.

**Key Files:**

* `command.json`: Used by ChatGPT to issue instructions (e.g., scan code, generate roadmap).
* `results/output.json`: Stores the result of the most recent execution.
* `logs/`: Local execution logs for debugging/troubleshooting.
* `chatgptd/`: Local AI automation engine and orchestration logic.

## Operational Flow

1. ChatGPT generates `command.json` with tasks and commits it to the `chatgptd-c2` repo.
2. Local `chatgptd` agent monitors the repo and pulls new `command.json`.
3. The agent parses the file and processes each task:

   * Loads the defined targets
   * Constructs prompts per file
   * Sends content to OpenAI via `Invoke-OpenAI.ps1`
   * Appends results to `results/output.json`
4. After all processing, it runs `push_command.ps1` to commit/push output and logs back to GitHub.

## File Structure

```
chatgptd-c2/
├── command.json                  # ChatGPT issues commands here
├── results/
│   └── output.json              # All response data from completed run
├── logs/
│   └── *.log                    # Diagnostic and execution logs
├── chatgptd/                    # Full daemon codebase and helpers
│   ├── chatgptd_cli.py
│   ├── Invoke-OpenAI.ps1
│   ├── push_command.ps1
│   └── ...
```

## Required Scripts

* **Invoke-OpenAI.ps1**

  * Accepts inline prompt input (not just PromptPath)
  * Supports custom output/log paths
  * Logs transcript of prompt + response

* **push\_command.ps1**

  * Auto-stages `command.json`, `results/`, `logs/`
  * Commits and pushes to origin

## Notes

* Scripts must reference `$env:CODE_BASE` for consistent repo pathing.
* `command.json` must define at least:

  * `target`: folder or file(s) to scan
  * `output`: output file path (relative to repo root)
  * `tasks`: array of operations with engine, mode, etc.

## Future Expansion

* Use SQLite for log/metric persistence
* Extend `command.json` to support chaining or triggers
* Parallel execution agent pools
* Session memory continuity via `.aidl` index and tagging

## Location

Place this file at:

```
$CODE_BASE\chatgptd\architecture.aidl
```

for primary reference, and optionally copy into `chatgptd-c2` for Git visibility.
