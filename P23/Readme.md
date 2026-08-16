**Atomic Commits & Mega-Commits**

* **Atomic Commit:** A single, isolated change addressing one specific task, feature, or bug fix.
* **Why Mega-Commits Hurt:** Bundling dozens of unrelated changes into giant commits makes code reviews exhausting, prevents clean rollbacks, makes `git cherry-pick` impossible, and breaks historical debugging tools like `git bisect`.

**Conventional Commit Syntax**
Provides a standardized, machine-readable format for commit messages (`<type>: <description>`):

* **`feat`:** Introduces new functional capabilities to the application.
* **`fix`:** Solves a bug or corrects unexpected behavior.
* **`docs`:** Modifies documentation, README files, or comments without altering application code.
* **`chore`:** Handles routine maintenance, tooling updates, or configuration changes that do not modify production code or tests.

**Purpose & Structure of `.gitignore**`

* **Purpose:** Excludes temporary files, build artifacts (e.g., `node_modules/`, `dist/`), and sensitive credentials (e.g., `.env`, private keys) from Git tracking. This prevents security leaks and repository bloat.
* **Structure:** A plain text file located at the repository root using glob pattern matching rules (e.g., `*.log`, `build/`, `!build/keep.me`).

**Git Inspection Overview**
Inspection commands streamline your workflow by offering concise repository feedback and helping troubleshoot rule conflicts before committing changes.

---

**Git Command Reference**

| Command | Description & Utility | Example Usage |
| --- | --- | --- |
| **`git add -p`** | Interactively stages changes in smaller chunks ("hunks"), letting you select specific lines of code to commit while leaving the rest unstaged. | `git add -p` |
| **`git status -s`** | Displays a short-format status output, showing clean two-letter status codes (`M` for modified, `??` for untracked) for rapid reading. | `git status -s` |
| **`git commit -m`** | Commits staged snapshots directly with an inline message, bypassing the external text editor prompt. | `git commit -m "fix: resolve crash"` |
| **`git rm --cached`** | Unstages and removes a file from Git index tracking while keeping the physical file intact on your local disk. | `git rm --cached .env` |
| **`git check-ignore`** | Debugs ignore rules by checking if a file path is matching a `.gitignore` pattern and displaying the exact rule file/line causing it. | `git check-ignore -v config.env` |
