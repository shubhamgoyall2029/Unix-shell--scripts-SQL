#!/bin/bash
# Script: process_killer.sh
# Purpose: Find & kill processes consuming CPU > 80%
# Author: Shubham Goyal | Date: 12-Jun-2025

THRESHOLD=80
DATE=$(date +%F_%T)
LOG_FILE="/tmp/process_killer.log"

echo "===== Process Killer Run: $DATE =====" >> $LOG_FILE

# Find process with CPU > 80%, skip root & system processes
ps -eo pid,ppid,user,%cpu,cmd --sort=-%cpu | awk -v th=$THRESHOLD '$4 > th && $3 != "root" && $3 != "SYSTEM"' | while read PID PPID USER CPU CMD
do
    echo "Killing High CPU Process: PID=$PID | USER=$USER | CPU=$CPU% | CMD=$CMD" >> $LOG_FILE
    kill -9 $PID
    echo "Process $PID killed successfully" >> $LOG_FILE
done

echo "===== Scan Complete =====" >> $LOG_FILE
