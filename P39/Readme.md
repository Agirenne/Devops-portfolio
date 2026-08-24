Bash conditionals evaluate command exit codes to direct control flow, enabling scripts to validate inputs, verify filesystem state, and handle execution errors safely.

**Bash Conditionals & File Verification Concepts**

* **`if / elif / else / fi` Syntax:** Structure control flow using test exit statuses. Statements open with `if`, evaluate conditions followed by `then`, support optional fallback branches (`elif`, `else`), and must close with `fi`.
* **`[[ ... ]]` vs `[ ... ]` Advantage:** Extended double brackets `[[ ... ]]` are built-in Bash keywords, making them safer and more powerful than standard POSIX test brackets `[ ... ]`. They prevent word-splitting bugs on unquoted variables, support pattern matching, and allow direct use of logical operators (`&&`, `||`) inside test expressions.
* **File & String Operators:** String operators inspect text variables (`-z` checks for empty strings, `-n` for populated strings). File operators check filesystem targets (`-d` verifies directories, `-f` checks for regular files, `-s` ensures files are non-empty/size > 0).
* **Short-Circuit Logic (`&&` and `||`):** Replaces verbose `if` blocks with inline guard clauses. `CMD1 && CMD2` executes `CMD2` only if `CMD1` succeeds (exit code 0); `CMD1 || CMD2` executes `CMD2` only if `CMD1` fails.

---

**Bash Operators & Conditional Syntax Reference**

| Operator / Syntax | Purpose & Description | Example Usage |
| --- | --- | --- |
| **`if [[ ... ]]; then ... fi`** | Standard conditional structure for executing code based on test evaluations. | `if [[ -z "$1" ]]; then exit 1; fi` |
| **`[[ ... ]]`** | Enhanced Bash test keyword; prevents word splitting and syntax errors on empty variables. | `[[ "$VAR" == "test" && -f "$FILE" ]]` |
| **`-z "$VAR"`** | Evaluates to true if the string is empty (zero length). | `[[ -z "$SOURCE_DIR" ]]` |
| **`-n "$VAR"`** | Evaluates to true if the string is non-empty (length greater than zero). | `[[ -n "$USER" ]]` |
| **`-d "$PATH"`** | Evaluates to true if the target path exists and is a directory. | `[[ -d "/tmp/backup" ]]` |
| **`-f "$PATH"`** | Evaluates to true if the target path exists and is a regular file. | `[[ -f "user_profile.conf" ]]` |
| **`-s "$PATH"`** | Evaluates to true if the target file exists and is non-empty (size > 0 bytes). | `[[ -s "$TARGET_FILE" ]]` |
| **`&&`** | Short-circuit AND: executes subsequent command only if the preceding command succeeds. | `[[ -d "$DIR" ]] && cd "$DIR"` |
| **` | | `** |
