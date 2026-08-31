Self-healing infrastructure automatically detects system failures and executes remediation procedures without manual human intervention.

**Self-Healing Infrastructure & Health Probing Concepts**

* **Self-Healing Lifecycle**: Operational monitoring relies on a three-stage cycle: **Probe** (periodically checking process PIDs or HTTP endpoints), **Remediate** (automatically restarting dead or unresponsive services), and **Alert** (writing structured log trails to record incident timestamps and outcomes).
* **Process Checking vs. Endpoint Probing**: Checking process state via `pgrep` or `systemctl is-active` verifies whether the operating system kernel is running the application binary. However, a process PID can remain active even if the application is frozen in a deadlock.
* **Comprehensive Health Verification**: Network socket and HTTP endpoint probing (`curl`, `nc`) test whether an application actively accepts connections and yields valid responses (e.g., HTTP 200 OK). Combining process detection with active endpoint probing provides complete operational visibility.

---

**Service Monitoring Command Reference**

| Command / Pattern | Purpose & Description | Example Usage |
| --- | --- | --- |
| **`pgrep -x name`** | Searches running processes and matches the exact binary name. | `pgrep -x nginx` |
| **`systemctl is-active --quiet name`** | Silently tests whether a Systemd service is active without writing to stdout/stderr. | `systemctl is-active --quiet nginx` |
| **`service name status`** | Checks the status of an active daemon using traditional SysVinit init scripts. | `sudo service nginx status` |
| **`curl -s -o /dev/null -w "%{http_code}" url`** | Executes a silent HTTP request, discards the body, and outputs only the numeric HTTP status code. | `curl -s -o /dev/null -w "%{http_code}" http://localhost:8080` |
