#!/bin/bash

# Network Host Connectivity Validator

TARGET_HOST=$1

echo "=============================================="
echo " NETWORK HOST VALIDATION AGENT "
echo "=============================================="

# 1. Input Argument Validation (Check if argument was provided)
if [[ -z "$TARGET_HOST" ]]; then
 echo "ERROR: Target host IP or domain was not provided."
 echo "Usage: $0 <target_host>"
 echo "Exiting with code 2 (Invalid Usage)..."
 exit 2
fi

echo "Probing connectivity to target: ${TARGET_HOST}..."

# 2. Execute network test ping (1 packet, 2-second timeout)
ping -c 1 -W 2 "$TARGET_HOST" > /dev/null 2>&1
PING_STATUS=$?

# 3. Evaluate Exit Code of ping command
if [[ $PING_STATUS -eq 0 ]]; then
 echo "SUCCESS: Host '${TARGET_HOST}' is reachable and responding to ICMP."
 echo "Exiting with code 0 (Success)..."
 exit 0
else
 echo "CRITICAL: Unable to reach host '${TARGET_HOST}' (Ping Exit Code: ${PING_STATUS})."
 echo "Exiting with code 1 (Connection Failure)..."
 exit 1
fi
