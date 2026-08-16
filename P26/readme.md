**Git Merging Core Concepts**

* **Fast-Forward vs. 3-Way Merges:** A **Fast-Forward (FF)** merge happens when the base branch has received no new commits since the feature branch was created; Git simply advances the base branch pointer directly to the tip of the feature branch without creating a new commit. A **3-Way (Recursive)** merge occurs when both branches have diverged with independent commits; Git must combine the histories and create a dedicated merge commit.
* **Why Modern Teams Use `--no-ff`:** Forcing a merge commit via `--no-ff` (no fast-forward) keeps the feature branch's logical grouping intact in the history graph. Even if a fast-forward is technically possible, `--no-ff` preserves the clear boundary of Pull/Merge Requests, making full feature rollbacks or historical audits significantly easier.
* **How 3-Way Merging Works:** Git calculates the merge by evaluating three snapshots: the **Common Ancestor** (the commit where the branches originally split), the **Target Branch HEAD** (e.g., `main`), and the **Feature Branch Tip**. It compares changes from both branches against the common ancestor to cleanly integrate non-conflicting code.
* **Visualization & Execution:** Merges are triggered with `git merge`, inspected visually through `git log --graph --oneline` (which displays the branch topology and merge commits), and finalized by deleting stale feature branches using `git branch -d`.

---

**Git Merging Command Reference**

| Command | Purpose & Utility | Example Usage |
| --- | --- | --- |
| **`git merge <branch>`** | Merges the specified branch into your current active branch using fast-forward if possible, or a 3-way merge if branches diverged. | `git merge feature-login` |
| **`git merge --no-ff <branch>`** | Forces Git to create a dedicated merge commit even if a fast-forward is possible, preserving feature context. | `git merge --no-ff feature-auth` |
| **`git merge --ff-only <branch>`** | Executes the merge only if it can be fast-forwarded; cancels immediately if a 3-way merge commit would be required. | `git merge --ff-only main` |
| **`git merge --abort`** | Safely cancels an in-progress merge conflict state, restoring your working directory to its pre-merge status. | `git merge --abort` |
| **`git branch -d <branch>`** | Safely deletes a local feature branch after its commits have been successfully merged into the parent branch. | `git branch -d feature-login` |

