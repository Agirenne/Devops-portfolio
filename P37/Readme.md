**Bash Variables & Interactive Automation Concepts**

* **Variables & Assignment Syntax:** Variables store dynamic data using `VAR="value"`. Putting spaces around `=` breaks execution because Bash interprets the variable name as an unmanaged system command and the `=` as its argument.
* **Variable Expansion & Interpolation:** Variables are accessed using `$VAR` or `${VAR}`. Enclosing variables in braces (`${ENV}_server`) prevents naming ambiguity during string concatenation, allowing scripts to dynamically adapt across environments without hardcoding paths.
* **Positional Arguments:** CLI parameters passed at launch are mapped sequentially to numeric variables (`$1`, `$2`, etc.), while `$0` holds the script name, `$#` tracks argument counts, `$@` lists all inputs, and `$$` captures the execution process ID (PID).
* **Interactive Fallback (`read -p`):** When expected positional arguments are missing at execution, `read -p` halts script processing to prompt the user directly via standard input (`stdin`).

---

**Bash Command & Variable Syntax Reference**

| Command / Flag | Purpose & Description | Example Usage |
| --- | --- | --- |
| **`NAME="Ubuntu"`** | Assigns a value to a variable (Strict rule: No spaces allowed around `=`). | `SERVER_ROLE="Database"` |
| **`$VAR` / `${VAR}**` | Expands and reads variable values; `{}` prevents ambiguity during text concatenation. | `echo "Role: $SERVER_ROLE"` |
| **`$1`, `$2`, `$3**` | Holds the first, second, and third positional arguments passed to the script. | `./script.sh arg1 arg2` |
| **`$#`** | Expands to the total count of positional arguments passed at launch. | `echo "Args count: $#"` |
| **`$@`** | Expands to an array/list of all positional arguments provided. | `for arg in "$@"; do ...` |
| **`read -p`** | Displays a prompt message and pauses execution to capture user input interactively. | `read -p "Enter environment: " ENV` |
