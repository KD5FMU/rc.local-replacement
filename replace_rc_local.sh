#!/bin/bash

# Define variables
URL="https://raw.githubusercontent.com/KD5FMU/rc.local-replacement/refs/heads/main/rc.local"
RC_LOCAL_PATH="/etc/rc.local"
BACKUP_PATH="/etc/rc.local.backup"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

# Backup the existing rc.local file
if [ -f "$RC_LOCAL_PATH" ]; then
  echo "Backing up the existing rc.local to $BACKUP_PATH..."
  cp "$RC_LOCAL_PATH" "$BACKUP_PATH"
  if [ $? -ne 0 ]; then
    echo "Failed to backup rc.local. Exiting."
    exit 1
  fi
fi

# Download the new rc.local file
echo "Downloading the new rc.local file from $URL..."
curl -o "$RC_LOCAL_PATH" "$URL"
if [ $? -ne 0 ]; then
  echo "Failed to download the rc.local file. Exiting."
  exit 1
fi

# Set permissions for the rc.local file
echo "Setting permissions for the new rc.local file..."
chmod +x "$RC_LOCAL_PATH"
if [ $? -ne 0 ]; then
  echo "Failed to set executable permissions on rc.local. Exiting."
  exit 1
fi

# Verify success
if [ -f "$RC_LOCAL_PATH" ]; then
  echo "The rc.local file has been successfully replaced."
else
  echo "Failed to replace the rc.local file. Please check the script and try again."
  exit 1
fi

echo "Operation completed successfully."
