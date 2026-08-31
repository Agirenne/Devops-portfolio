#!/bin/bash

# Process Health Monitor & Auto-Recovery Agent

TARGET_PORT=${1:-8085}
SERVICE_NAME=${2:-"python3"}

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
LOG_FILE="${SCRIPT_DIR}/../logs/monitor_alerts.log"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "=============================================="
echo " AUTOMATED PROCESS HEALTH AGENT "
echo "=============================================="

log_event() {
 local level=$1
 local message=$2
 echo "[${TIMESTAMP}] [${level}] ${message}" | tee -a "${LOG_FILE}"
}

# 1. Probe 1: HTTP Endpoint Health Check
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${TARGET_PORT}" 2>/dev/null)

if [[ "$HTTP_STATUS" -eq 200 ]]; then
 log_event "INFO" "HEALTH CHECK PASSED: Service '${SERVICE_NAME}' on port ${TARGET_PORT} is responding cleanly (HTTP ${HTTP_STATUS})."
 exit 0
fi

# 2. Probe Failure Detected: Log Warning
log_event "WARN" "HEALTH CHECK FAILED: Service on port ${TARGET_PORT} returned HTTP status '${HTTP_STATUS}' (Expected 200)."

# 3. Check process existence using pgrep
if pgrep -f "http.server ${TARGET_PORT}" > /dev/null; then
 log_event "WARN" "Process is running but unresponsive on port ${TARGET_PORT}. Attempting process restart..."
 pkill -f "http.server ${TARGET_PORT}"
 sleep 1
else
 log_event "CRITICAL" "Process is DEAD. Port ${TARGET_PORT} is unreachable."
fi

# 4. Self-Healing Action: Attempt Automatic Recovery
log_event "RECOVERY" "Attempting automatic service restart on port ${TARGET_PORT}..."

WEBROOT_DIR="${SCRIPT_DIR}/../webroot"
nohup python3 -m http.server "${TARGET_PORT}" --directory "${WEBROOT_DIR}" > /dev/null 2>&1 &
sleep 2

# 5. Post-Recovery Verification
NEW_HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${TARGET_PORT}" 2>/dev/null)

if [[ "$NEW_HTTP_STATUS" -eq 200 ]]; then
 log_event "SUCCESS" "SELF-HEALING SUCCESSFUL: Service on port ${TARGET_PORT} restarted and verified operational (HTTP 200)."
 exit 0
else
 log_event "ALERT" "SELF-HEALING FAILED: Service recovery on port ${TARGET_PORT} unsuccessful. Escalating to critical alert!"
 exit 1
fi
