#!/bin/bash

# Ask user for log directory
read -p "Enter the log directory path:  " LOG_DIR

ARCHIVE_DIR="${LOG_DIR}_archive"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVENAME="log_archive_$TIMESTAMP.tar.gz"
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"

echo "$ARCHIVE_DIR/$ARCHIVENAME"
# Check if directory exists
if [ ! -d "$LOG_DIR" ]; then
        echo "Error: Directory '$LOG_DIR' does not exist."
        exit 1
fi
# Create archive directory if not exists
mkdir -p "$ARCHIVE_DIR"
# Create tar.gz archive
tar -czf "$ARCHIVE_DIR/$ARCHIVENAME" -C "$LOG_DIR" .

# Check if tar command succeeded
if [ $? -ne 0 ]; then
        echo "Archive failed. Exiting."
        exit 1
fi

# Log the action
echo "[$(date)] Archived to $ARCHIVENAME" >> "$LOG_FILE"
echo "Logs archived to $ARCHIVE_DIR/$ARCHIVENAME"
