# Unix Shell Scripts for Production Support

Automation scripts developed during 2023-2025 for L2 Production Support & DevOps tasks. 
Uploaded to GitHub in Apr 2026 for portfolio & knowledge sharing.

## Project Timeline & Use Cases

1. **backup_rotation.sh** - Created Aug 2024 
   - Purpose: Delete backups older than 7 days from /opt/backup
   - Used for: Weekly space cleanup on production servers

2. **log_parser.sh** - Created Nov 2024
   - Purpose: Extract ERROR summary from application logs using grep/awk
   - Used for: Daily log analysis & incident reporting

3. **disk_alert.sh** - Created Jan 2025
   - Purpose: Monitor disk usage, alert if > 80%
   - Used for: Prevent disk full outages in production

4. **CPU_alert.sh** - Created Feb 2025
   - Purpose: Alert when CPU usage crosses 90% threshold
   - Used for: Proactive monitoring of critical applications

5. **service_check.sh** - Created Mar 2025
   - Purpose: Auto-restart Apache/MySQL if service is down
   - Used for: Reduce downtime via auto-healing

## Tech Stack
Bash | Linux | grep | awk | systemctl | cron | find

## Note
All scripts were tested and deployed on live production servers during my tenure as Technical Consultant.
