```python
import subprocess
try:
 res = subprocess.run(["git", "log", "-h"], capture_output=True, text=True)
 print(res.stdout)
except Exception as e:
 print(e)


```

```text
[Errno 2] No such file or directory: 'git'


```

**Git SHAs & The Immutable Graph**

* **Git SHA (Hash):** A unique 40-character cryptographic checksum calculated from a commit's contents, tree structure, parent references, author info, and timestamp.
* **Immutable Graph:** Every commit stores a explicit pointer to its parent commit's SHA. Because altering any past data changes its hash and breaks all descendant references, Git forms an append-only, tamper-proof Directed Acyclic Graph (DAG) of project history.

**Operational Differences of `git diff` Variants**

* **`git diff`:** Compares changes in your **Working Directory** against the **Staging Area** (shows unstaged modifications).
* **`git diff --staged`:** Compares changes in the **Staging Area** against the **HEAD commit** (shows staged modifications ready for commit).
* **`git diff HEAD`:** Compares **all changes** (both staged and unstaged) in your local setup directly against the **HEAD commit**.

**Reading Unified Diff Syntax (`-` vs `+`)**

* **`-` (Minus / Red):** Indicates a line present in the baseline reference that was removed.
* **`+` (Plus / Green):** Indicates a line added to the new target state.
* **Unprefixed text:** Context lines that remain identical in both versions.

---

**Command Reference**

| Command | Purpose & Utility | Example Usage |
| --- | --- | --- |
| **`git log`** | Displays reverse-chronological commit history with full metadata (SHA, author, date, message). | `git log` |
| **`git log -n <N>`** | Restricts log output to the `<N>` most recent commits. | `git log -n 5` |
| **`git log -d`** | Shorthand for `--decorate`; displays ref pointers (branches, tags, `HEAD`) next to commits. | `git log -d` |
| **`git show <SHA>`** | Displays full metadata and the exact patch diff introduced by a specific commit. | `git show a1b2c3d` |
| **`git diff`** | Displays unstaged working directory changes relative to the index. | `git diff` |
| **`git diff --staged`** | Displays staged changes ready to be saved in the next commit. | `git diff --staged` |

---

**Key `git log` Formatting Flags**

* **`--oneline`:** Compresses commit entries into a single line showing only the short SHA and commit subject.
* **`--graph`:** Draws an ASCII-art visualization on the left side to display branch splits, parallel history, and merges.
* **`--stat`:** Adds file modification statistics (number of changed files, insertions `+`, and deletions `-`) to each log entry.
* **`git show`:** Used alongside logging flags to inspect the exact line-by-line diff and metadata of a specific commit or ref object.

