#!/bin/bash

# Dynamic User & Workspace Provisioning Script

# Check if argument were passed; if not, print usage instructions
echo "Script Name (\$0): $0"
echo "Total Arguments Passed (\$#): $#"
echo "All Arguments (\$@): $@"
echo "------------------------------------------"

# Assign positional arguments to meaningful variable name
USERNAME=$1
DEPARTMENT=$2

# If arguments are missing, prompt interactively using 'read'
if [ -z "$USERNAME" ]; then 
    read -p "Enter target username: " USERNAME
fi

if [ -z "$DEPARTMENT" ]; then
    read -p "Enter department name: " DEPARTMENT
fi 

# Define workspace directory path using variables
WORKSPACE_DIR="/tmp/workspaces/${DEPARTMENT}/${USERNAME}"

echo "Provisioning workspace for user '${USERNAME}' in departement '${DEPARTEMENT}'..."
mkdir -p "${WORKSPACE_DIR}"

# Create a baseline user congig file
cat << EOF> "${WORKSPACE_DIR}/user_profile.conf"
USER=${USERNAME}
DEPT=${DEPARTEMENT}
CREATED_AT=$(date '+%Y-%m-%d %H:%M:%S')
STATUS=active
EOF

echo "SUCCES: Workspace created at ${WORKSPACE_DIR}"
echo "Profile details:"
cat "${WORKSPACE_DIR}/user_profile.conf"
