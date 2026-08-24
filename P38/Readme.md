System resource automation relies on combining CLI output parsing with internal mathematical expansion to build dynamic monitoring tools.

**Bash Arithmetic & System Monitoring Concepts**

* **Command Substitution (`$(...)`)**: Captures the standard output (`stdout`) of enclosed commands and stores it directly into a variable instead of printing it to the terminal screen.
* **Native Integer Arithmetic (`$((...))`)**: Evaluates mathematical expressions natively inside Bash without launching external tools or processes.
* **Integer Division Limitations & `bc**`: Bash arithmetic strictly performs integer division and truncates all decimal remainders (e.g., `5 / 2 = 2`). For floating-point precision, pass the mathematical string to the external `bc` (Basic Calculator) utility using pipe redirection (e.g., `echo "scale=2; 5 / 2" | bc`).
* **Dynamic Storage Monitoring Lab**: The script queried disk metrics at the `/` mount point using `df -k`, isolated target columns with `tail` and `awk`, converted KB to MB using `$(( ... / 1024 ))`, calculated total usage percentages, and compared the result against an 80% safety threshold.

---

**Bash Command & Syntax Reference**

| Command / Syntax | Purpose & Description | Example Usage |
| --- | --- | --- |
| **`$(command)`** | Captures command output into a variable via command substitution. | `TOTAL_KB=$(df -k "/" | ...)` |
| **`$(( expression ))`** | Performs native integer mathematical expansion. | `TOTAL_MB=$((TOTAL_KB / 1024))` |
| **`df -k <path>`** | Displays disk space usage for a given file system or mount point in KB. | `df -k "/"` |
| **`tail -n 1`** | Filters piped text to output only the final line, stripping tabular headers. | `df -k "/" | tail -n 1` |
| **`awk '{print $N}'`** | Parses whitespace-delimited text and extracts column number `N`. | `awk '{print $2}'` |
| **`bc`** | Command-line arbitrary-precision calculator used for floating-point operations. | `echo "scale=2; $USED / $TOTAL * 100" | bc` |
