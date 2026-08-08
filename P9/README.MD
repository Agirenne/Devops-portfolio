| Command              | Meaning                                              | Example                               |
| -------------------- | ---------------------------------------------------- | ------------------------------------- |
| `journalctl`         | Displays logs collected by `systemd-journald`.       | `journalctl`                          |
| `journalctl -u`      | Shows logs for a specific **systemd service/unit**.  | `journalctl -u nginx`                 |
| `journalctl -f`      | **Follows logs in real time**, similar to `tail -f`. | `journalctl -f`                       |
| `journalctl -n`      | Shows only the **last N log entries**.               | `journalctl -n 20`                    |
| `journalctl --since` | Shows logs starting from a specific date or time.    | `journalctl --since "10 minutes ago"` |
| `journalctl -p`      | Filters logs by **priority/severity level**.         | `journalctl -p err`                   |
| `journalctl -b`      | Shows logs from the **current boot/session**.        | `journalctl -b`                       |
