#!/bin/bash
# Script: db_connection_check.sh
# Purpose: Check MySQL/PostgreSQL DB connectivity and alert if down
# Author: Shubham Goyal | Date: 20-Jul-2025

DB_HOST="localhost"
DB_USER="app_user"
DB_NAME="production_db"
DATE=$(date +%F_%T)
LOG_FILE="/var/log/db_health.log"

echo "===== DB Check: $DATE =====" >> $LOG_FILE

# For MySQL - replace with psql for PostgreSQL
mysql -h $DB_HOST -u $DB_USER -e "SELECT 1" $DB_NAME > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "DB Status: UP | Connection successful to $DB_NAME" >> $LOG_FILE
else
    echo "DB Status: DOWN | CRITICAL: Cannot connect to $DB_NAME" >> $LOG_FILE
    echo "Subject: CRITICAL - DB Down on $(hostname)" | sendmail -v your_email@company.com < /dev/null
fi

echo "===== Check Complete =====" >> $LOG_FILE
