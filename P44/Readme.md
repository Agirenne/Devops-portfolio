Text processing in Linux automation relies on `sed` for stream-level string substitution and `awk` for structured data extraction.

**Stream Editing & Data Extraction Concepts**

* **Line-Oriented (`sed`) vs. Column-Oriented (`awk`) Processing**: `sed` (stream editor) operates sequentially on whole lines, matching regular expressions to insert, delete, or substitute string patterns. `awk` treats text lines as records composed of distinct columns, providing dedicated syntax to manipulate data fields independently.
* **In-Place Modification (`sed -i`)**: Passing the `-i` (in-place) flag instructs `sed` to write changes directly to disk rather than sending output to `stdout`. Behind the scenes, `sed` creates a temporary file with the applied regex updates and replaces the original target file.
* **`awk` Field Indicators & Conditional Filtering**: `awk` breaks input records into fields denoted by positional variables (`$1` for the first column, `$7` for the seventh, `$NF` for the final column). Operators apply boolean checks (e.g., `$9 == 404`) to filter and print specific columns only when lines satisfy numerical or textual conditions.
* **Lab Execution Results**: Today's lab demonstrated using `awk` to parse web server access logs by isolating client IP addresses (`$1`) associated with HTTP 404 errors (`$9 == 404`), and using `sed -i` to automate configuration updates by toggling environment flags directly within application settings files.

---

**Text Processing Syntax & Command Reference**

| Command / Syntax | Purpose & Description | Example Usage |
| --- | --- | --- |
| **`sed 's/foo/bar/g' file`** | Replaces all global occurrences of a target string pattern per line without altering the original file on disk. | `sed 's/http/https/g' config.env` |
| **`sed -i 's/old/new/g' file`** | Performs in-place file editing directly on disk, updating the target file contents permanently. | `sed -i 's/DEBUG=true/DEBUG=false/g' app.conf` |
| **`awk '{print $1}' log`** | Extracts and prints the first field of data from a default whitespace-delimited file or stream. | `awk '{print $1}' /var/log/nginx/access.log` |
| **`awk -F':' '{print $1, $6}'`** | Defines a custom field separator (e.g., `:`) and prints specified field numbers for each line. | `awk -F':' '{print $1, $6}' /etc/passwd` |
| **`awk '$9 == 404 {print $1}'`** | Evaluates a field-specific conditional expression, printing target columns only for matching records. | `awk '$9 == 404 {print $1, $7}' access.log` |
