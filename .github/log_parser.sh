#!/bin/bash
# Script: log_parser.sh
# Purpose: Parse application logs and mail error summary
# Author: Shubham Goyal | Date: 18-Apr-2026

LOG_FILE="/var/log/app.log"
DATE=$(date +%F)
ERROR_COUNT=$(grep -i "ERROR" $LOG_FILE | wc -l)
OUTPUT="error_summary_$DATE.txt"

echo "Log Analysis Report for $DATE" > $OUTPUT
echo "--------------------------------" >> $OUTPUT
echo "Total ERROR count: $ERROR_COUNT" >> $OUTPUT
echo "" >> $OUTPUT
echo "Top 5 Errors:" >> $OUTPUT
grep -i "ERROR" $LOG_FILE | sort | uniq -c | sort -nr | head -5 >> $OUTPUT

# Mail part - comment if mail not configured
# mail -s "Daily Error Report $DATE" your_email@gmail.com < $OUTPUT

echo "Report generated: $OUTPUT"
