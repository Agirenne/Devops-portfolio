**Git Stash & Tagging Concepts**

* **Preserving Uncommitted Work:** `git stash` safely saves your uncommitted changes (both staged and unstaged) to a temporary storage stack, reverting your working directory to the clean `HEAD` commit. `git stash pop` restores those changes to your active working tree and deletes them from the stash stack, allowing you to quickly switch contexts (e.g., to apply a hotfix) without losing draft progress or creating dirty commits.
* **Git Tags vs. Branches:** A Git branch is a dynamic, movable pointer that advances automatically whenever a new commit is made. A Git Tag is an immutable, static pointer tied permanently to a specific commit SHA, serving as a fixed historical marker for releases and production milestones.
* **Semantic Versioning (`MAJOR.MINOR.PATCH`):** A standard software versioning scheme:
* **`MAJOR`:** Incremented for breaking API or non-backward-compatible changes.
* **`MINOR`:** Incremented for new functionality added in a backward-compatible manner.
* **`PATCH`:** Incremented for backward-compatible bug fixes and small patches.


* **Tagging & Publishing:** Annotated tags (`git tag -a`) are full Git objects containing metadata (author, date, message, checksum). Standard branch pushes do not send tags to remotes; they must be explicitly uploaded using `git push origin <tag>` or `git push --tags`.

---

**Git Stash & Tagging Command Reference**

| Command | Purpose & Description | Example Usage |
| --- | --- | --- |
| **`git stash`** | Shelves uncommitted local modifications and cleans your working tree. | `git stash` |
| **`git stash list`** | Displays all stashed state entries currently saved in your repository stack. | `git stash list` |
| **`git stash pop`** | Reapplies the latest stashed changes (`stash@{0}`) and removes them from the stack. | `git stash pop` |
| **`git stash apply`** | Reapplies stashed changes to your working tree *without* deleting them from the stash stack. | `git stash apply` |
| **`git tag -a <tag> -m`** | Creates an annotated tag object with metadata and a tag message at the current commit. | `git tag -a v1.0.0 -m "Release v1.0.0"` |
| **`git tag`** | Lists all local tag references stored in the repository. | `git tag` |
| **`git push origin <tag>`** | Explicitly transfers a specific tag reference to the remote repository. | `git push origin v1.0.0` |
