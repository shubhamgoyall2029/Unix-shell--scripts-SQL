#!/bin/bash
# Script: disk_alert.sh  
# Purpose: Alert if disk usage > 80%
# Author: Shubham Goyal | Date: 18-Apr-2026

THRESHOLD=80
SERVER=$(hostname)
USAGE=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $USAGE -ge $THRESHOLD ]; then
    echo "CRITICAL: $SERVER disk at ${USAGE}% at $(date +%F_%T)"
    # mail -s "Disk Alert $SERVER" admin@company.com <<< "Check disk ASAP"
else
    echo "OK: $SERVER disk at ${USAGE}% - Below threshold"
fi
