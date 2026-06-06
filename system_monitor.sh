#!/bin/bash
 # 系统资源监控脚本
# 用途：检查 CPU、内存、磁盘使用率，超阈值写日志
LOG_FILE="/var/log/monitor/system_$(date +%Y%m%d).log"
 CPU_THRESHOLD=80
 MEM_THRESHOLD=80
 DISK_THRESHOLD=80
 # 获取当前时间
NOW=$(date "+%Y-%m-%d %H:%M:%S")
 # 检查 CPU 使用率（取 1 秒平均值）
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1 | cut -d'.' -f1)
 # 检查内存使用率
MEM_TOTAL=$(free -m | awk 'NR==2{print $2}')
 MEM_USED=$(free -m | awk 'NR==2{print $3}')
 MEM_USAGE=$(( MEM_USED * 100 / MEM_TOTAL ))
 # 检查磁盘使用率（查根目录 /）
DISK_USAGE=$(df -h / | awk 'NR==2{print $5}' | cut -d'%' -f1)
 # 写入日志
echo "[$NOW]" >> "$LOG_FILE"
 echo "  CPU 使用率: ${CPU_USAGE}%" >> "$LOG_FILE"
 echo "  内存使用率: ${MEM_USAGE}% (已用 ${MEM_USED}M / 总 ${MEM_TOTAL}M)" >> "$LOG_FILE"
 echo "  磁盘使用率: ${DISK_USAGE}%" >> "$LOG_FILE"
 # 超阈值告警
if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
    echo "   告警：CPU 使用率超过 ${CPU_THRESHOLD}%" >> "$LOG_FILE"
 fi
 if [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ]; then
    echo "   告警：内存使用率超过 ${MEM_THRESHOLD}%" >> "$LOG_FILE"
 fi
 if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "   告警：磁盘使用率超过 ${DISK_THRESHOLD}%" >> "$LOG_FILE"
 fi
 echo "" >> "$LOG_FILE"
