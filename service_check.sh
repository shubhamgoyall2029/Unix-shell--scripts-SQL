#!/bin/bash
# Script: service_check.sh
# Purpose: Check if service is running, restart if down
# Author: Shubham Goyal | Date: 18-Apr-2026

SERVICE="apache2"  # mysql, nginx bhi daal sakte ho
DATE=$(date +%F_%T)

if systemctl is-active --quiet $SERVICE; then
    echo "$DATE : $SERVICE is RUNNING - OK" >> service_status.log
else
    echo "$DATE : $SERVICE is DOWN - Restarting..." >> service_status.log
    systemctl restart $SERVICE
    # mail -s "ALERT: $SERVICE restarted on $(hostname)" you@gmail.com <<< "$SERVICE was down at $DATE"
    echo "$DATE : $SERVICE RESTARTED" >> service_status.log
fi
