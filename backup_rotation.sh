#!/bin/bash
# Script: backup_rotation.sh
# Purpose: Delete backup files older than 7 days
# Author: Shubham Goyal | Date: 18-Apr-2026

BACKUP_DIR="/opt/backup"
DAYS=7
LOG="/var/log/backup_cleanup.log"

echo "===== Backup Cleanup $(date) =====" >> $LOG
echo "Deleting files older than $DAYS days from $BACKUP_DIR" >> $LOG

find $BACKUP_DIR -type f -mtime +$DAYS -name "*.tar.gz" -delete -print >> $LOG

echo "Cleanup completed" >> $LOG
echo "=================================" >> $LOG
