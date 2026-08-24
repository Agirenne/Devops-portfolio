#!/bin/bash

#System Disk & Resource Metrics Calculator

echo "========================================="
echo "         AUTOMATED DISK USAGE REPORT     "
echo "========================================="


# Capture raw disk metrics for the root filesystem '/' using command substitution
MOUNT_POINT="/"
TOTAL_KB=$(df -k "${MOUNT_POINT}" | tail -n 1 | awk '{print $2}')
USED_KB=$(df -k "${MOUNT_POINT}" | tail -n 1 | awk '{print $3}')
AVAIL_KB=$(df -k "${MOUNT_POINT}" | tail -n 1 | awk '{print $4}')

# Convert KB to MB  using integer arithmetic expansion
TOTAL_MB=$((TOTAL_KB / 1024))
USED_MB=$((USED_KB / 1024))
AVAIL_MB=$((AVAIL_KB/ 1024))

# Calculate usage percentage using integer arithmetic 
USAGE_PERCENT=$(( (USED_KB * 100) / TOTAL_KB ))

# Display calculated results 
echo "Mount Point :       ${MOUNT_POINT}"
echo "Total Capacity:     ${TOTAL_MB} MB"
echo "Used Storage:       ${USED_MB} MB"
echo "Available Storage:  ${AVAIL_MB} MB"
echo "Current Usage:      ${USAGE_PERCENT}%"
echo "================================================="

# Display threshold evaluation message 
THRESHOLD=80 
REMAINING_PERCENT=$((100 - USAGE_PERCENT))

echo "Safety Threshold: ${THRESHOLD}%"
echo "Buffer Remaining: ${REMAINING_PERCENT}%"


