#!/bin/bash

# Safe File Cleanup Utility with Native Dry-Run Simulation Mode
set -euo pipefail

# Customize xtrace debug prompt to display line numbers if set -x is active
export PS4='+ [LINE ${LINENO}]: '

TARGET_DIR="${1:-}"
MODE="${2:-}"

DRY_RUN=false
if [[ "${MODE}" == "--dry-run" ]] || [[ "${MODE}" == "-d" ]]; then
 DRY_RUN=true
fi

echo "=============================================="
echo " SAFE FILE CLEANUP & PURGE UTILITY "
echo "=============================================="

if [[ -z "${TARGET_DIR}" ]] || [[ ! -d "${TARGET_DIR}" ]]; then
 echo "ERROR: Valid target directory path required."
 echo "Usage: $0 <target_directory> [--dry-run]"
 exit 1
fi

if [[ "${DRY_RUN}" == "true" ]]; then
 echo "[MODE] DRY-RUN SIMULATION ACTIVE (No files will be deleted)."
else
 echo "[MODE] LIVE EXECUTION (Files will be permanently removed)."
fi

# Execution wrapper function
execute_action() {
 local target_file=$1
 if [[ "${DRY_RUN}" == "true" ]]; then
 echo "[DRY-RUN] Would remove expired log file: ${target_file}"
 else
 echo "[LIVE-DELETE] Removing file: ${target_file}"
 rm -f "${target_file}"
 fi
}

# Iterate over .log files in target directory
for logfile in "${TARGET_DIR}"/*.log; do
 if [[ -e "${logfile}" ]]; then
 execute_action "${logfile}"
 else
 echo "INFO: No .log files found matching criteria."
 fi
done

echo "=============================================="
echo "Operation completed successfully."
