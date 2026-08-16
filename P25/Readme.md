**Git Branching Concepts**

* **Lightweight Pointers:** A Git branch is not a copy of your codebase; it is simply a 41-byte text file containing a 40-character commit SHA. Because branches are just movable pointers referencing specific nodes in the history graph, creating or deleting them is instantaneous and consumes virtually zero disk space.
* **The HEAD Pointer:** `HEAD` is Git's internal navigation pointer (stored in `.git/HEAD`). It tracks your current location by referencing your active local branch. When you make a new commit, Git updates the branch pointer `HEAD` is currently referencing to point to that new commit SHA.
* **Isolation with `git switch`:** Switching branches moves `HEAD` to a different branch reference and updates your working directory to match that branch's exact commit snapshot. Using `git switch -c` creates a dedicated sandbox for new work, keeping unstable experimental code completely separated from stable production code on `main`.
* **DevOps Benefits of Parallel Development:** Branch isolation allows multiple developers and CI/CD pipelines to build features, apply security hotfixes, and run tests concurrently. It protects production stability, prevents incomplete code from polluting production builds, and simplifies code reviews via Pull/Merge Requests.

---

**Git Branching Command Reference**

| Command | Purpose & Description | Example Usage |
| --- | --- | --- |
| **`git branch`** | Lists all local branches in the repository; the current active branch is marked with an asterisk (`*`). | `git branch` |
| **`git branch <name>`** | Creates a new branch pointer at your current commit without switching to it. | `git branch feature-auth` |
| **`git switch <name>`** | Switches `HEAD` and working directory files to an existing branch (modern syntax replacing `git checkout`). | `git switch main` |
| **`git switch -c <name>`** | Creates a new branch and immediately switches your `HEAD` to it in a single step. | `git switch -c feature-login` |
| **`git checkout -b <name>`** | The legacy command equivalent to `git switch -c <name>` used to create and switch branches. | `git checkout -b hotfix-bug` |
| **`git branch -d <name>`** | Safely deletes a local branch (Git blocks deletion if the branch contains unmerged changes). | `git branch -d feature-login` |
| **`git branch -D <name>`** | Force deletes a local branch, discarding any unmerged changes permanently. | `git branch -D abandoned-idea` |
