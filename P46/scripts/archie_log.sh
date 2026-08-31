#!/bin/bash

# Idempotent Directory Archiving & Retention Management Project

SOURCE_DIR=$1
BACKUP_DIR=$2
RETENTION_DAYS=${3:-7} # Default to 7 days retention if not specified

echo "=============================================="
echo " AUTOMATED DIRECTORY ARCHIVING AGENT "
echo "=============================================="

# -------------------------------------------------------------
# 1. INPUT VALIDATION & IDEMPOTENT SETUP
# -------------------------------------------------------------
if [[ -z "$SOURCE_DIR" ]] || [[ -z "$BACKUP_DIR" ]]; then
 echo "ERROR: Missing required arguments."
 echo "Usage: $0 <source_directory> <backup_directory> [retention_days]"
 exit 1
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
 echo "CRITICAL: Source directory '${SOURCE_DIR}' does not exist!"
 exit 1
fi

# Idempotently ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# -------------------------------------------------------------
# 2. ARCHIVE GENERATION
# -------------------------------------------------------------
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
SOURCE_NAME=$(basename "$(realpath "$SOURCE_DIR")")
ARCHIVE_NAME="archive_${SOURCE_NAME}_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${BACKUP_DIR}/${ARCHIVE_NAME}"

echo "Compressing '${SOURCE_DIR}' into '${ARCHIVE_PATH}'..."

# Compress contents of source directory cleanly
tar -czf "$ARCHIVE_PATH" -C "$SOURCE_DIR" . 2>/dev/null
TAR_EXIT=$?

# -------------------------------------------------------------
# 3. VERIFICATION & INTEGRITY CHECK
# -------------------------------------------------------------
if [[ $TAR_EXIT -eq 0 ]] && [[ -s "$ARCHIVE_PATH" ]]; then
 ARCHIVE_SIZE=$(du -h "$ARCHIVE_PATH" | awk '{print $1}')
 echo "SUCCESS: Archive created successfully (${ARCHIVE_SIZE})."
else
 echo "CRITICAL: Archiving failed or produced an empty file!"
 rm -f "$ARCHIVE_PATH"
 exit 1
fi

# -------------------------------------------------------------
# 4. RETENTION POLICY EXECUTION (AUTO-PRUNING)
# -------------------------------------------------------------
echo "Applying retention policy: Pruning archives older than ${RETENTION_DAYS} days..."

DELETED_COUNT=$(find "$BACKUP_DIR" -type f -name "archive_${SOURCE_NAME}_*.tar.gz" -mtime +"${RETENTION_DAYS}" -print -delete | wc -l)

echo "Retention Cleanup Complete: Removed ${DELETED_COUNT} expired archive(s)."
echo "=============================================="
exit 0
