#!/bin/bash
# Script: cpu_alert.sh
# Purpose: Monitor CPU usage and alert if > 90%
# Author: Shubham Goyal | Date: 18-Apr-2026

THRESHOLD=90
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
SERVER=$(hostname)

if [ $CPU_USAGE -ge $THRESHOLD ]; then
    echo "CRITICAL: $SERVER CPU at ${CPU_USAGE}% at $(date)"
    echo "Top 3 Processes:"
    ps aux --sort=-%cpu | head -4
    # mail -s "CPU Alert $SERVER" you@gmail.com <<< "CPU at ${CPU_USAGE}%"
else
    echo "OK: $SERVER CPU at ${CPU_USAGE}% - Normal"
fi
