Event-driven automation relies on `while` loops to process dynamic data streams, safely parse configuration files, and monitor system resources in real time.

**Bash Loop Mechanics & File Parsing Concepts**

* **Dynamic `while` Loops:** Unlike fixed-range `for` loops, `while` constructs execute dynamically as long as a state condition remains true. This makes them ideal for event-driven automation, metric monitoring, and handling streams of unknown length.
* **The `IFS= read -r line` Standard:** Setting `IFS=` (Internal Field Separator) to empty prevents Bash from stripping leading and trailing whitespace. Combining this with `-r` (which disables backslash escape interpretation) guarantees that lines read via redirection (`< file`) are captured in their exact raw format.
* **Service Polling & Delimited Data Parsing:** Combining an infinite loop (`while true`) with a pause (`sleep N`) creates lightweight monitoring daemons. Delimited text fields (like `HOST:PORT`) are cleanly extracted using string utilities such as `cut -d':' -f1` and `-f2` to populate execution variables.
* **Health Probe Lab Findings:** The completed health probe script validates input paths, ignores comments and empty lines (`[[ "$line" =~ ^# ]]`), tests live network socket availability via `nc -zv -w 1`, and aggregates real-time success/failure metrics.

---

**Loop Syntax & Execution Reference**

| Loop Syntax | Purpose & Behavior | Example Use Case |
| --- | --- | --- |
| **`while [[ condition ]]; do ... done`** | Runs as long as the conditional test evaluates to true (exit status 0). | Counter-based iterations or checking resource usage thresholds. |
| **`while IFS= read -r line; do ... done < file`** | Safely parses file contents line-by-line without truncating spaces or processing backslashes. | Reading server IP lists, CSV files, or system log files. |
| **`while true; do ... sleep N; done`** | Creates an infinite background loop with a execution delay to control CPU load. | Continuous health probe polling or background monitoring daemons. |
| **`until [[ condition ]]; do ... done`** | Runs continuously until a target condition evaluates to true. | Waiting for a database service or HTTP port 80 to become available. |
