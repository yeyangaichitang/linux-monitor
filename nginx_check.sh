#!/bin/bash
LOG_FILE="/var/log/monitor/nginx_check_$(date +%Y%m%d).log"
NOW=$(date "+%Y-%m-%d %H:%M:%S")
STATUS=$(systemctl is-active nginx)

echo "[$NOW] Nginx状态：$STATUS" >> $LOG_FILE

if [ "$STATUS" != "active" ]; then
    echo "[$NOW] Nginx异常，尝试重启..." >> $LOG_FILE
    sudo systemctl restart nginx
    NEW_STATUS=$(systemctl is-active nginx)
    echo "[$NOW] 重启后状态：$NEW_STATUS" >> $LOG_FILE
fi
