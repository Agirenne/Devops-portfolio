**Git Undo & Recovery Concepts**

* **`git restore` File Mechanics:** Operates strictly at the file level without altering branch pointers or commit history. `git restore <file>` discards unstaged local modifications in your working directory, resetting the file to the last committed state. `git restore --staged <file>` removes a staged file from the index back to the working directory without erasing code changes.
* **Reset Modes (`--soft` vs. `--mixed` vs. `--hard`):** `git reset` moves the current branch reference (`HEAD`) backward in time.
* **`--soft`:** Rewinds `HEAD` but leaves all modified files staged in the index, preserving work for a immediate re-commit.
* **`--mixed` (default):** Rewinds `HEAD` and un-stages changes, keeping them safely in your local working directory.
* **`--hard`:** Rewinds `HEAD` and permanently deletes all staged and working directory modifications (destructive operation).


* **`git revert` for Shared/Public Branches:** Rewriting history with `git reset` on public branches alters SHA references, causing severe merge conflicts for collaborating developers. `git revert` safely undoes changes by generating a brand-new commit that applies the exact inverse operations of a targeted commit, preserving the existing historical graph intact.

---

**Git Undo Command Reference**

| Command | Target Scope | Purpose & Utility | Example Usage |
| --- | --- | --- | --- |
| **`git restore <file>`** | Working Directory | Discards unstaged modifications in a specific file, returning it to the last commit state. | `git restore app.py` |
| **`git restore --staged <file>`** | Staging Area | Un-stages a file from the index back to your working directory without deleting code. | `git restore --staged config.env` |
| **`git reset --soft HEAD~1`** | Commit History | Undoes the most recent commit while keeping all changes staged in the index. | `git reset --soft HEAD~1` |
| **`git reset --hard HEAD~1`** | Workspace & History | Undoes the most recent commit and permanently destroys all associated code changes. | `git reset --hard HEAD~1` |
| **`git revert <SHA>`** | Public History | Creates a new commit that reverses the specific changes introduced by commit `<SHA>`. | `git revert 5cb572c` |
