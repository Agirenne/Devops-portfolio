#!/bin/bash

# Bulletproof Defensive Backup Utility
set -euo pipefail

# -------------------------------------------------------------
# GLOBAL VARIABLES & TRAP SETUP
# -------------------------------------------------------------
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
TEMP_WORK_DIR=""

# Cleanup function executed automatically on script termination
cleanup() {
 local exit_code=$?
 if [[ -n "${TEMP_WORK_DIR}" ]] && [[ -d "${TEMP_WORK_DIR}" ]]; then
 echo "[CLEANUP] Removing temporary working directory: ${TEMP_WORK_DIR}"
 rm -rf "${TEMP_WORK_DIR}"
 fi
 if [[ ${exit_code} -ne 0 ]]; then
 echo "[ALERT] Script terminated prematurely with exit code: ${exit_code}"
 fi
}

# Register trap for EXIT signal
trap cleanup EXIT

# -------------------------------------------------------------
# MAIN WORKFLOW
# -------------------------------------------------------------
echo "=============================================="
echo " BULLETPROOF BACKUP AUTOMATION "
echo "=============================================="

# Use default expansion parameter to avoid 'nounset' errors if $1 is omitted
SOURCE_DIR="${1:-}"

if [[ -z "${SOURCE_DIR}" ]]; then
 echo "ERROR: Source directory parameter is required."
 echo "Usage: $0 <source_directory>"
 exit 1
fi

# Create a temporary workspace directory safely
TEMP_WORK_DIR=$(mktemp -d -p "${SCRIPT_DIR}/../tmp" backup_stage_XXXXXX)
echo "[INFO] Staging workspace created: ${TEMP_WORK_DIR}"

# Pipeline test (pipefail verification)
echo "[INFO] Auditing source directory files..."
find "${SOURCE_DIR}" -type f | grep -v "\.tmp$" | wc -l || true

# Generate archive into temp workspace
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
ARCHIVE_FILE="${TEMP_WORK_DIR}/backup_${TIMESTAMP}.tar.gz"

echo "[INFO] Creating archive '${ARCHIVE_FILE}'..."
tar -czf "${ARCHIVE_FILE}" -C "${SOURCE_DIR}" .

echo "[SUCCESS] Backup staged successfully."
