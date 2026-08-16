**1. The Three States of Git**

Git stores data as a series of **snapshots** rather than incremental file differences (diffs). Your files move between three main areas on your local machine:

* **Working Directory (Workspace):** The local filesystem directory where you actively edit, create, or delete files.
* **Staging Area (Index):** An intermediate buffer inside the `.git` directory storing the specific changes prepared for your next snapshot.
* **Local Repository (`.git/`):** The local database where Git permanently stores project metadata, objects, and historical commit snapshots.

---

**2. The File Lifecycle**

Files inside your workspace progress through four primary lifecycle states:

* **Untracked:** Newly created files that Git is not yet monitoring.
* **Tracked (Unmodified):** Files stored in your latest commit that have not been edited.
* **Tracked (Modified):** Tracked files edited in your workspace that have not yet been staged.
* **Staged:** New or modified files marked to be included in the upcoming commit.

---

**3. Quick Command Reference**

| Command | Action | Example Usage |
| --- | --- | --- |
| `git init` | Initialize a new empty Git repository | `git init` |
| `git config --global` | Set global user identity and configuration | `git config --global user.name "Your Name"` |
| `git status` | Check active file states (untracked, modified, staged) | `git status` |
| `git add` | Move files from Workspace to Staging Area | `git add file.txt`<br>

<br>`git add .` |
| `git commit` | Save staged snapshot permanently into local repo | `git commit -m "feat: initial commit"` |
