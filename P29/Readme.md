**GitFlow vs. Trunk-Based Development**

| Metric | GitFlow | Trunk-Based Development |
| --- | --- | --- |
| **Branch Architecture** | Multiple long-lived branches (`main`, `develop`, `release`, `hotfix`). | Single core branch (`main`/`trunk`) with short-lived feature branches. |
| **Integration Frequency** | Delayed (weeks/months); merged at release milestones. | Continuous (multiple times per day). |
| **Merge Complexity** | High risk of massive merge conflicts ("merge hell"). | Minimal risk due to small, incremental, frequent updates. |
| **CI/CD Fit** | Poor; blocks rapid, automated delivery pipelines. | Ideal; natively designed for automated testing and deployment. |

**Why DevOps Favors Short-Lived Branches & Trunk-Based Dev**

* **Reduced Merge Friction:** Merging small code increments every few hours or days eliminates severe branch drift and complex conflict resolution.
* **Rapid Feedback Loops:** CI pipelines execute automated tests on tiny change sets, alerting developers to regressions within minutes.
* **Increased Release Velocity:** Teams can safely ship incremental code updates to production continuously rather than waiting for complex multi-branch release cycles.

**Feature Flags in Continuous Deployment**

* **Decoupling Deployment from Release:** Feature Flags (code toggles) allow uncompleted or experimental features to be deployed safely into production inside `main` without exposing them to end-users.
* **Instant Risk Mitigation:** If an active feature malfunctions in production, disabling its toggle instantly turns off the code without requiring an emergency rollback or pipeline redeployment.
* **Targeted Rollouts:** Enables canary releases, A/B testing, and progressive user segment exposure directly in production environments.

**Hands-On Lab Workflow Execution**

* **Repository Setup:** Created a standalone sandbox directory (`strategy_demo`) to test branching strategies without polluting the primary workspace.
* **Short-Lived Branching:** Created a dedicated short-lived branch (`git switch -c feat/add-healthcheck`).
* **Implementation:** Appended application code and simulated feature logic directly from the terminal (`echo "..." >> app.py`).
* **Explicit Merging:** Integrated the feature back into `main` using `git merge --no-ff -m "..."` to force a dedicated merge commit, preserving explicit feature context in the historical graph.
* **Environment Cleanup:** Deleted the integrated local feature branch (`git branch -d`) and removed temporary demo directories (`rm -rf strategy_demo`).
