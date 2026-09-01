Script syntax validation, execution tracing, and dry-run simulation wrapper patterns form the foundation of safe Bash script debugging and testing.

**Bash Debugging & Dry-Run Architecture Concepts**

* **Syntax Verification (`bash -n` / `set -n`)**: Performs a dry-run parse of the script file to check for structural syntax errors—such as unclosed quotation marks, missing `fi` statements, or malformed loops—without executing any commands or altering system state.
* **Execution Tracing (`bash -x` / `set -x` / `PS4`)**: Enables `xtrace` mode, printing expanded commands to `stderr` right before execution. Tracing can be scoped to specific code sections using `set -x` (enable) and `set +x` (disable). The debug output prompt can be enhanced by customizing the `PS4` environment variable to include execution metadata like active line numbers (`${LINENO}`).
* **Native `--dry-run` Design Pattern**: Implements a safety mechanism that allows operators to test script execution risks beforehand. By checking a boolean flag variable (e.g., `DRY_RUN=true`) inside a central wrapper function (`run_cmd`), scripts can print intended actions to the console rather than executing destructive filesystem or system modifications.

---

**Debugging Syntax & Command Reference**

| Flag / Pattern | Action & Purpose | Example Usage |
| --- | --- | --- |
| **`bash -n script.sh`** | Reads and validates script syntax for errors without executing any underlying commands. | `bash -n my_script.sh` |
| **`bash -x script.sh`** | Runs the entire script with line-by-line execution tracing enabled from start to finish. | `bash -x my_script.sh` |
| **`set -x / set +x`** | Selectively enables (`set -x`) and disables (`set +x`) tracing around specific isolated code blocks. | `set -x; command; set +x` |
| **`export PS4='+ $LINENO: '`** | Redefines the `xtrace` prompt prefix to append contextual details such as line numbers. | `export PS4='+ [LINE ${LINENO}]: '` |
| **`--dry-run`** | A custom CLI parameter pattern passed to scripts to simulate system operations safely. | `./clean.sh --dry-run` |
