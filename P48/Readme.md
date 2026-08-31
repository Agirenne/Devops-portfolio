Defensive Bash programming relies on strict execution flags and signal traps to prevent silent script corruption, handle expected errors safely, and guarantee resource cleanup.

**Strict Mode, Exception Handling, and Traps Concepts**

* **Bash Strict Mode (`set -euo pipefail`)**: Combining these three flags forces scripts to fail fast and explicitly. `set -e` (`errexit`) halts execution immediately upon any command failure to prevent error cascades. `set -u` (`nounset`) throws an error if an uninitialized variable is evaluated, preventing catastrophic execution paths (such as `rm -rf "$TARGET/*"` expanding to `rm -rf /*` if `$TARGET` is empty). `set -o pipefail` ensures a pipeline returns a failure status if *any* command in the chain fails, overriding the default behavior where only the final command's exit code is returned.
* **Bypassing `set -e` for Expected Failures**: When a command is expected to return a non-zero exit code (such as inspecting `grep` outputs or network probes), `set -e` can be bypassed using logical OR fallbacks (`cmd || true`) or by executing the statement within conditional blocks (`if cmd; then ... fi`).
* **Resource Cleanup with Traps (`trap`)**: Production scripts frequently allocate temporary files, locks, or background processes. Utilizing `trap 'cleanup_function' EXIT` registers a handler that Bash guarantees to run whenever the script exits, whether it completes successfully, encounters an unhandled error, or receives a termination signal (`SIGINT`/`SIGTERM`).

---

**Bash Option & Pattern Reference**

| Option / Pattern | Meaning & Effect | Example Usage |
| --- | --- | --- |
| **`set -e`** | Instructs the shell to terminate script execution immediately if any command returns a non-zero exit status. | `set -e` |
| **`set -u`** | Treats uninitialized or unset variables as fatal errors, terminating execution instantly upon expansion. | `set -u` |
| **`set -o pipefail`** | Ensures a command pipeline fails if any internal command fails, rather than evaluating only the final command. | `set -o pipefail` |
| **`${VAR:-default}`** | Evaluates a parameter and substitutes a fallback default value if the target variable is unset or empty. | `PORT="${1:-8080}"` |
| **`trap 'func' EXIT`** | Registers a specific function or command to execute automatically whenever the script exits or terminates. | `trap cleanup_temp EXIT` |
