This summary covers the concepts, syntax rules, and debugging techniques explored since our last recap, focusing on batch file processing, variable evaluation mechanics, and shell error troubleshooting.

**Key Bash Concepts & Syntax**

* **Variable Expansion & Memory (`$`, `$VAR`, `$(...)`):** The `$` symbol instructs Bash to retrieve data stored in RAM. `$VAR` reads a specific named memory key, while `$(command)` opens a subshell, executes the enclosed command, and captures its standard output.
* **Double Brackets `[[ ... ]]`:** Modern test keyword replacing single brackets `[ ... ]`. It prevents word-splitting errors on unquoted variables and natively supports logical operators (`&&`, `||`).
* **Conditionals & File Operators:**
* **`-z "$VAR"`:** Evaluates to true if a string is empty (zero length).
* **`-e "$PATH"`:** Checks if any entity (file, directory, symlink) **exists** at the path.
* **`-d "$PATH"`:** Checks if the target exists **AND** is specifically a **directory**.


* **Path Extraction (`basename`):** Syntax like `filename=$(basename "$filepath")` strips directory paths (e.g., `/path/to/file.txt`), leaving only the standalone filename (`file.txt`) for clean log output.
* **Loop Controls (`do...done` vs `break`):** `do...done` defines the boundaries of a loop body. `break` instantly halts loop execution and moves to the code outside `done`.
* **Naming Conventions:** Uppercase names (`TARGET_DIR`) are used by convention for script-wide variables to prevent confusion with lowercase shell commands (`echo`, `grep`).

**Debugging & Execution Rules**

* **Cascading Syntax Errors:** Syntax errors reported on later lines (e.g., unexpected token `(`) are frequently caused by unclosed quotes (`"`) or missing parentheses higher up in the script, which tricks Bash into treating valid code as string text.
* **Case Sensitivity:** Linux commands are strictly case-sensitive; `ECHO` fails with `command not found` while `echo` executes cleanly.
* **Script Idempotency:** Using `grep -q` verifies if a header or line already exists in a file before editing, allowing a script to run multiple times safely without duplicating operations.

**Syntax Reference**

| Syntax / Tool | Function | Example |
| --- | --- | --- |
| **`basename`** | Isolates filename from full directory path | `filename=$(basename "$filepath")` |
| **`mktemp`** | Creates a safe temporary file in `/tmp` | `TEMP_FILE=$(mktemp)` |
| **`grep -q`** | Searches files silently (exit status only) | `grep -q "HEADER" "$file"` |
| **`>` vs `>>**` | Overwrites file (`>`) vs Appends to file (`>>`) | `cat "$file" >> "$TEMP_FILE"` |
