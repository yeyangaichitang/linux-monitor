# Linux 服务监控与自动恢复系统

## 项目背景
本项目用于模拟企业基础运维场景，完成 Linux 服务器环境搭建、Nginx 服务部署、系统资源监控、定时巡检、服务异常自动恢复和日志记录。

## 项目环境
- VMware
- Rocky Linux
- Nginx
- Shell
- crontab

## 实现功能
1. 部署 Nginx 静态网页服务
2. 监控 CPU、内存、磁盘使用率
3. 检测 Nginx 服务运行状态
4. 服务异常时自动重启
5. 将检测结果写入日志
6. 使用 crontab 定时执行
7. 模拟故障并记录排查过程

## 核心脚本
- system_monitor.sh：监控系统资源
- nginx_check.sh：检测 Nginx 状态并自动恢复

## 故障模拟
手动停止 Nginx 服务，观察脚本是否能检测异常并自动重启。

## 项目收获
熟悉了 Linux 基础命令、systemd 服务管理、Shell 脚本、crontab 定时任务、日志查看和基础故障排查流程。
