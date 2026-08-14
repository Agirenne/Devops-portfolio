## Nginx Troubleshooting – Quick Summary

### 4-Step Root Cause Analysis (RCA)

1. **Identify the problem** → Observe the error and reproduce it.
2. **Collect evidence** → Check configuration, logs, ports, and service status.
3. **Find the root cause** → Identify the exact configuration or system error.
4. **Fix and verify** → Apply the fix, test it, reload Nginx, and verify the result.

### Diagnostic Commands

`nginx -t` → Checks Nginx configuration syntax.

```bash
sudo nginx -t
```

`service nginx status` → Checks whether Nginx is running.

```bash
sudo service nginx status
```

`journalctl -u nginx` → Displays Nginx service logs.

```bash
sudo journalctl -u nginx
```

`tail -f /var/log/nginx/error.log` → Continuously monitors Nginx error logs in real time.

```bash
sudo tail -f /var/log/nginx/error.log
```

`ss -tulpn` → Shows listening TCP/UDP ports and the processes using them.

```bash
sudo ss -tulpn
```

### Breakage Scenarios & Root Causes

**Wrong `root` path:** Nginx pointed to the wrong directory/file → caused `404` errors. Fixed by setting `root` to the directory containing `index.html`.

**Permission issue:** Nginx (`www-data`) could not access `/home/vboxuser` → caused access errors. Fixed by allowing the Nginx user to traverse the required directory.

**Wrong port / server configuration:** Checked with `ss -tulpn` and Nginx configuration → verified that Nginx was listening on the expected port.

### Verification Workflow

```bash
sudo nginx -t
sudo systemctl reload nginx
sudo systemctl status nginx
curl http://localhost:8080
```

**Key principle:** Don't guess. Collect evidence from configuration files, logs, service status, and listening ports before changing anything.

