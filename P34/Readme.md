**Pull Requests, Code Reviews & Workflows**

* **Pull Requests (PRs) & Code Reviews:** A Pull Request is a formal proposal to integrate code from a feature branch into a target branch (such as `main`). Modern engineering teams require code reviews within PRs to catch bugs early, enforce security standards, maintain code quality, and share domain knowledge across the team.
* **Shared Repository vs. Forking Workflows:**
* **Shared Repository Workflow:** Developers work within the same central repository, pushing feature branches directly to it. This is standard for trusted internal corporate teams.
* **Forking Workflow:** Developers clone a personal copy (fork) of the repository, push changes to their personal fork, and submit a PR back to the original upstream repository. This is standard for open-source projects where direct write access is restricted.


* **Professional PR Structure:** A standardized PR description includes a **Description** (summary of changes and motivation), **Type of Change** (feature, bug fix, docs), **Testing Steps** (verification proof), and a **Security & Quality Checklist** (ensuring no hardcoded keys or unhandled errors).

**End-to-End PR Lifecycle**

1. **Push Branch Upstream:** Upload your local branch to the remote repository while establishing tracking: `git push -u origin <branch-name>`.
2. **Open & Merge on GitHub:** Create a Pull Request via GitHub, fill out the template, obtain code review approvals, and merge the PR into `main`.
3. **Sync Local Main:** Switch back to your local main branch (`git switch main`) and download the newly merged commits using `git pull origin main` to ensure your local environment reflects the updated remote state.

**Git PR Command Reference**

| Command | Purpose & Utility | Example Usage |
| --- | --- | --- |
| **`git push -u origin <branch>`** | Uploads a local branch to the remote repository and binds it as the upstream tracking reference for future `git push`/`git pull` calls. | `git push -u origin feature/user-auth` |
| **`git pull origin main`** | Fetches the latest commits from the remote `main` branch on GitHub and integrates them into your current active local branch. | `git pull origin main` |
