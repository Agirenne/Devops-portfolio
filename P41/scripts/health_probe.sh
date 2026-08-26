#!/bin/bash 

# Service Health Probe & Line-by-Line File Parser

CONFIG_FILE=$1

echo "==============================================="
echo "           SERVICE HEALTH PROBE TOOL           "
echo "==============================================="

# Validate config file input 
if  [[ -z "$CONFIG_FILE" ]] || [[ ! -f  "$CONFIG_FILE" ]]; then
echo " ERROR: Valid configuration file required. "
echo "Usage: $0 <path_to_server_list>"
exit 1
fi

TOTAL_CHECKED=0
ONELINE_COUNT=0
OFFLINE_COUNT=0

# Read the target file line-by-line safely
while  IFS= read -r line || [[ -n "$line" ]]; do

# Ignore empty lines and comments
[[ -z "$line" ]] || [[ "$line" =~ ^# ]] && continue

# Extract host and port using IFP internal separator 
HOST=$(echo "$line" | cut -d':' -f1)
PORT=$(echo "$line" | cut -d':' -f2)

TOTAL_CHECKED=$((TOTAL_CHECKED +1))

echo -n "Checking ${HOST}:${PORT}... "

# Test TCP Port connection witch nc (netcat) timeout of 1 second 
if nc -zv -w  1 "$HOST" "$PORT" 2>/dev/null; then
echo "[ONELINE]"
ONELINE_COUNT=$((ONELINE_COUNT + 1))
else 
echo "[OFFLINE]"
OFFLINE_COUNT=$((OFFLINE_COUNT + 1))
fi

done < "$CONFIG_FILE"

echo "============================================================="
echo "SUMMARY: TOATAL: ${TOTAL_CHECKED} | Oneline: ${ONELINE_COUNT} | Offline: ${OFFLINE_COUNT}"
echo "============================================================="
