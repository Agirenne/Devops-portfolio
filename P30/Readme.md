**Git Rebasing Core Concepts**

* **`git merge` vs. `git rebase`:** `git merge` preserves true historical context by creating a non-destructive 3-way merge commit to join two divergent branches. `git rebase` rewrites project history by taking all new commits on your feature branch and replaying them sequentially on top of the target branch's latest tip.
* **The Golden Rule of Rebasing:** **Never rebase public, shared branches.** Rebasing alters commit SHAs by creating entirely new commit objects. If you rebase a shared branch (like `main`), you force other developers' repositories out of sync with history, causing severe divergence and merge nightmares.
* **Interactive Rebasing (`git rebase -i`):** A tool to edit local commit history before publishing. It allows developers to clean up draft "WIP" (work-in-progress) commits, fix typos, and consolidate small changes into clean, atomic commits.
* **Linear Repository Graph:** Rebasing avoids "noise" merge commits caused by frequent updates from the base branch. It creates a flat, single-line history graph that makes debugging (e.g., using `git bisect`) and code reviews significantly simpler.

---

**Interactive Rebase Keywords (`git rebase -i`)**

| Keyword | Alias | Description & Primary Use Case |
| --- | --- | --- |
| **`pick`** | `p` | Keeps the commit as-is in the rebased history (default option). |
| **`reword`** | `r` | Retains the commit's code changes, but opens an editor to rewrite the commit message. |
| **`squash`** | `s` | Combines the commit into the commit directly above it and merges their commit messages together. |
| **`fixup`** | `f` | Combines the commit into the commit directly above it, but completely discards this commit's log message (ideal for quick typo or syntax fixes). |
| **`drop`** | `d` | Deletes the commit and its changes entirely from the repository history. |

---

**Git Rebase Command Reference**

| Command | Purpose & Description | Example Usage |
| --- | --- | --- |
| **`git rebase <branch>`** | Moves the base of your active branch and replays its unique commits on top of the tip of `<branch>`. | `git rebase main` |
| **`git rebase -i HEAD~N`** | Opens an interactive editor listing the last `N` commits from `HEAD`, allowing you to squash, reword, or drop them. | `git rebase -i HEAD~3` |
| **`git rebase --continue`** | Resumes the rebase sequence after manually resolving a merge conflict and staging the changes (`git add`). | `git rebase --continue` |
| **`git rebase --abort`** | Cancels an ongoing rebase operation entirely and restores your branch back to its original state prior to rebasing. | `git rebase --abort` |
