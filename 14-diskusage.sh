#!/bin/bash

DATE=$(date +%F)

# Colors
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGSDIR="/home/centos/shell-script-logs"
SCRIPT_NAME="$0"
LOGFILE="$LOGSDIR/$(basename "$0")-$DATE.log"

DISK_USAGE=$(df -hT)
DISK_USAGE_THRESHOLD=90

while IFS= read -r line; do
    usage=$(echo "$line" | awk '{print $6}' | cut -d "%" -f1)
    partition=$(echo "$line" | awk '{print $7}')

    if [ "$usage" -gt "$DISK_USAGE_THRESHOLD" ]; then
        message+="HIGH DISK USAGE ON $partition: $usage%\n"
    fi
done <<< "$DISK_USAGE"

echo -e "$message" | tee -a "$LOGFILE"

