#!/bin/bash

# System Information Banner Script
echo "=========================================="
echo " SYSTEM INFORMATION REPORT "
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Current User: $(whoami)"
echo "Uptime: $(uptime -p)"
echo "Kernel Version: $(uname -r)"
echo "=========================================="
