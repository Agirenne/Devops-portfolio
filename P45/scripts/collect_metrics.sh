#!/bin/bash

# Automated Metric logger for Cron Execution

# Ensure scripts uses explicit working directory 
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
LOG_FILE="${SCRIPT_DIR}/../logs/cron_execution.log"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
UPTIME_VAL=$(uptime -p)
LOAD_AVG=$(uptime | awk -F 'load average:' '{print $2}')
DISK_FREE=$(df -h / | tail -n 1 | awk '{print $4}')

# Appendd timestamped log entry 
echo "[${TIMESTAMP}] STATUS: OK | Uptime: ${UPTIME_VAL} | Load:${LOAD_AVG} | Free Disk: ${DISK_FREE}" >> "${LOG_FILE}"
