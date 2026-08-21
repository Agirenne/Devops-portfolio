**Bash Scripting & Execution Mechanics**

* **Interpreter & Permission Foundation:** The Shebang (`#!/bin/bash`) defines the path to the interpreter binaries, instructing the system on how to parse the file. Scripts are non-executable by default in Linux; `chmod +x` grants explicit execution bits to allow direct invocation.
* **Execution Context (Sub-shell vs. Current Shell):** Running `./script.sh` executes the script inside an isolated child sub-shell process, isolating variable assignments and working directory changes from your terminal session. Using `source script.sh` executes commands directly within your current active shell, retaining environment variables or directory shifts after completion.
* **Debugging & Inspection:** The `-x` flag (`bash -x script.sh`) enables print debugging mode, showing each expanded command alongside its evaluation prior to execution.

---

**Bash Command Reference**

| Command / Flag | Purpose & Description | Example Usage |
| --- | --- | --- |
| **`#!/bin/bash`** | Shebang directive specifying the exact path to the Bash interpreter. | `#!/bin/bash` *(as line 1)* |
| **`chmod +x <file>`** | Grants execute permissions (`+x`) to the target script file. | `chmod +x system_info.sh` |
| **`./script.sh`** | Executes the script directly inside a isolated child sub-shell process. | `./system_info.sh` |
| **`source script.sh`** | Executes the script inside the active shell session, modifying current environment state. | `source system_info.sh` |
| **`bash -x script.sh`** | Runs the script in debug mode, tracing and printing each line before execution. | `bash -x system_info.sh` |
