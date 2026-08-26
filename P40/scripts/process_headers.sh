#!/bin/bash

# Batch File Inspection & Header Injector Script

TARGET_DIR=$1
HEADER_TEXT="# PROCESSED BY DEVOPS AUTOMATION TOOL - $(date '+%Y-%m-%d')"

echo "================================================"
echo "            BATCH HEADER INJECTION TOOL         "
echo "================================================"

# 1. Validate target directory input 
if [[ -z "$TARGET_DIR" ]] || [[ ! -d "$TARGET_DIR" ]]; then 
    echo "ERROR: Valid  target directory path required."
    echo "Usage $0 <target_directory>"
    exit 1
fi

PROCESSED_COUNT=0
SKIPPED_COUNT=0

# 2. Iterate over all text files in target directory using file globbing 
for filepath in "${TARGET_DIR}"/*.txt; do 


# Handle case where no .txt files exist in the directory 
if [[ ! -e "$filepath" ]]; then 
echo "WARN: No text files found in ${TARGET_DIR}."
break
fi

filename=$(basename "$filepath")

# Check if file is a regular readable dile 
if [[ -f "$filepath" ]] && [[ -r "$filepath" ]]; then

   # Check  if the header line is already present  to maintain idempotency 
if grep -q "PROCESSED BY DEVOPS AUTOMATION TOOL" "$filepath"; then 
   echo "SKIP: '${filename}' already contains the header."
   SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
else 
echo "PROCESSING: Injection header into '${filename}'..."

# Prepend header text to the top of the file 
TEMP_FILE=$(mktemp)
echo "${HEADER_TEXT}" > "${TEMP_FILE}"
cat "$filepath" >> "${TEMP_FILE}"
mv  "${TEMP_FILE}" "$filepath"

PROCESSED_COUNT=$((PROCESSED_COUNT + 1))
fi 
else
    echo "WARN: Skipping '${filename}' (Not a valid readable file)."
fi
done

echo "=================================================================="
echo "SUMMARY: Processed: ${PROCESSED_COUNT} | Skipped: ${SKIPPED_COUNT}"
echo "=================================================================="

