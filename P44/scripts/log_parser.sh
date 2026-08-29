#!/bin/bash

# Automated log Parser & Configuration Modifier Utility 

LOG_FILE="data/access.log"
CONFIG_FILE="data/app.env"

echo"=============================================="
echo"               TEXT PROCESSING & PARSING TOOL "
echo"=============================================="

# 1. Validte files 
if [[ ! -f "$LOG_FILE" ]] || [[ ! -f "$CONFIG_FILE" ]]; then 
   echo "ERROR: Data  files missing."
   exit 1
fi

echo "--- 1. PARSING ACCESS LOGS WITH AWK  ---"
echo "Extracting Client IPs and Requested Endpoints:"
awk '{print "Client IP: " $1 " ---> Endpoint: " $7}' "$LOG_FILE"

echo ""
echo "Filtering Failed HTTP Requests (4xx / 5xx Status Codes):"
awk '$9 >= 400 {print "[ALERT]  IP: " $1 " | Status: " $9 " | Request: " $7}' "$LOG_FILE"

echo ""
echo "--- 2. UPDATTING CONFIGURATION WITH SED ---"
echo "Original Configuration:"
cat "$CONFIG_FILE"

echo ""
echo "Updating Environment parameters for Production..."

# Use sed to replace staging with production in-place
sed -i 's/ENVIRONMENT=staging/ENVIRONMENT=production/g' "$CONFIG_FILE"
sed -i 's/LOG_LEVEL=debug/LOG_LEVEL=info/g' "$CONFIG-FILE"
sed -i 's/PORT=8080/PORT=443/g' "CONFIG_FILE"

"Updated Configuration:"
"$CONFIG_FILE"

"============================================"

