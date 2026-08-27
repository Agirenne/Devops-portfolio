#!/bin/bash

# Modular System Operations & Health Checker

# -------------------------------------------------------------
# FUNCTION DEFINITIONS
# -------------------------------------------------------------

# Reusable Logger Function
log_msg() {
 local level=$1
 local message=$2
 echo "[$(date '+%Y-%m-%d %H:%M:%S')] [${level}] ${message}"
}

# Custom Error Handler Function
handle_error() {
 local err_msg=$1
 local exit_code=${2:-1} # Default to exit code 1 if not specified
 log_msg "CRITICAL" "${err_msg}"
 echo "Exiting script execution with code ${exit_code}..."
 exit "${exit_code}"
}

# Reusable Service Health Check Function
check_service() {
 local service_name=$1
 log_msg "INFO" "Checking status of service '${service_name}'..."

 if service "${service_name}" status > /dev/null 2>&1 || systemctl is-active --quiet "${service_name}" 2>/dev/null; then
 log_msg "SUCCESS" "Service '${service_name}' is ACTIVE."
 return 0
 else
 log_msg "WARN" "Service '${service_name}' is INACTIVE or NOT FOUND."
 return 1
 fi
}

# Function to Calculate Available Disk Percentage
get_disk_usage() {
 local mount_point=${1:-/}
 local usage
 usage=$(df -k "${mount_point}" | tail -n 1 | awk '{print $5}' | tr -d '%')
 echo "${usage}"
}

# -------------------------------------------------------------
# MAIN SCRIPT EXECUTION WORKFLOW
# -------------------------------------------------------------

log_msg "INFO" "=== STARTING MODULAR SYSTEM HEALTH EVALUATION ==="

# 1. Validate environment argument
ENV_TARGET=$1
if [[ -z "${ENV_TARGET}" ]]; then
 handle_error "Missing required environment argument. Usage: $0 <environment>" 2
fi

log_msg "INFO" "Target Environment: ${ENV_TARGET}"

# 2. Check Disk Capacity using helper function
CURRENT_USAGE=$(get_disk_usage "/")
log_msg "INFO" "Current Root Disk Usage: ${CURRENT_USAGE}%"

MAX_THRESHOLD=85
if [[ "${CURRENT_USAGE}" -gt "${MAX_THRESHOLD}" ]]; then
 handle_error "Disk usage (${CURRENT_USAGE}%) exceeds threshold limit (${MAX_THRESHOLD}%)." 1
fi

# 3. Check Web Server Service Status
check_service "cron" || log_msg "WARN" "Non-critical daemon cron is offline."

log_msg "SUCCESS" "=== SYSTEM HEALTH EVALUATION COMPLETED CLEANLY ==="
exit 0
