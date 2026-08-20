**Merge Conflict Concepts**

* **Causes of Merge Conflicts:** A merge conflict occurs when Git attempts to combine two branches that contain competing modifications to the exact same lines in a file, or when one branch modifies a file while another deletes it. Because Git cannot safely predict intent, it pauses the merge for manual intervention.
* **Inline Conflict Markers:** Git marks disputed sections directly inside the affected files:
* `<<<<<<< HEAD`: Indicates the beginning of your active branch's local code.
* `=======`: The divider line separating local changes from incoming changes.
* `>>>>>>> <branch>`: Indicates the end of the incoming branch's modifications.


* **3-Step Conflict Resolution Workflow:**
1. **Identify:** Locate all flagged files under "Unmerged paths" using `git status`.
2. **Edit:** Open the files, pick the desired code logic, and delete all conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`).
3. **Stage & Commit:** Execute `git add <file>` to mark the conflict as resolved, followed by `git commit` to finalize the merge.


* **Safe Exit Path (`git merge --abort`):** If a conflict becomes too entangled or risky to resolve immediately, `git merge --abort` stops the integration process and restores your working directory back to its exact pre-merge state.

---

**Command Reference**

| Command | Purpose & Description | Example Usage |
| --- | --- | --- |
| **`git status`** | Displays the state of your working directory, highlighting files with unresolved merge conflicts in red. | `git status` |
| **`git diff`** | Displays line-by-line code differences between uncommitted working changes and your last commit or branch. | `git diff` |
| **`git merge --abort`** | Safely cancels an ongoing, unresolved merge and restores your repository to its clean, pre-merge state. | `git merge --abort` |
| **`git add <file>`** | Stages modified or newly resolved files, signaling to Git that conflict markers have been cleared. | `git add app.py` |
| **`git commit`** | Completes the conflict resolution workflow by saving the final, merged snapshot into repository history. | `git commit` |
