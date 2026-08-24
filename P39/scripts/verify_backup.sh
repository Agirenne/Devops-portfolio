#!/bin/bash

# Automated Backup & Target Directory Verification Script

SOURCE_DIR=$1
BACKUP_DIR=$2

echo "=============================================="
echo " BACKUP VERIFICATION UTILITY "
echo "=============================================="

# 1. Check if both required arguments are provided using string checks
if [[ -z "$SOURCE_DIR" ]] || [[ -z "$BACKUP_DIR" ]]; then
 echo "ERROR: Missing required arguments."
 echo "Usage: $0 <source_directory> <backup_directory>"
 exit 1
fi

# 2. Check if the source directory exists
if [[ ! -d "$SOURCE_DIR" ]]; then
 echo "CRITICAL: Source directory '${SOURCE_DIR}' does not exist!"
 exit 1
else
 echo "SUCCESS: Source directory '${SOURCE_DIR}' verified."
fi

# 3. Short-circuit logic: Create backup directory if it does not exist
[[ -d "$BACKUP_DIR" ]] || { echo "INFO: Creating missing backup directory '${BACKUP_DIR}'..."; mkdir -p "$BACKUP_DIR"; }

# Create a dummy archive inside source for testing
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
TARGET_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.tar.gz"

echo "Simulating backup process to '${TARGET_FILE}'..."
tar -czf "$TARGET_FILE" -C "$SOURCE_DIR" . 2>/dev/null

# 4. Verify that the backup file was created AND is non-empty
if [[ -f "$TARGET_FILE" ]] && [[ -s "$TARGET_FILE" ]]; then
 FILE_SIZE=$(du -h "$TARGET_FILE" | awk '{print $1}')
 echo "SUCCESS: Backup completed successfully!"
 echo "Archive Path: ${TARGET_FILE} (${FILE_SIZE})"
else
 echo "ERROR: Backup file creation failed or produced an empty archive."
 exit 1
fi
