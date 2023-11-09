#!/bin/bash
###
# @Author       : wanyunr
# @Email        : wanyunr@outlook.com
# @Date         : 2023-11-09 20:16:01
# @Description  : Get system-related information. | Powered by whoisnian/script/blob/master/motd.sh
# Copyright (c) 2023 by wanyunr, All Rights Reserved.
###

mem_info=$(</proc/meminfo)
mem_total=$(awk '$1=="MemTotal:" {print $2}' <<<${mem_info})
mem_used=$((${mem_total} + $(awk '$1=="Shmem:" {print $2}' <<<${mem_info})))
mem_used=$((${mem_used} - $(awk '$1=="MemFree:" {print $2}' <<<${mem_info})))
mem_used=$((${mem_used} - $(awk '$1=="Buffers:" {print $2}' <<<${mem_info})))
mem_used=$((${mem_used} - $(awk '$1=="Cached:" {print $2}' <<<${mem_info})))
mem_used=$((${mem_used} - $(awk '$1=="SReclaimable:" {print $2}' <<<${mem_info})))
mem_total=$((mem_total / 1024))
mem_used=$((mem_used / 1024))
mem_usage=$((100 * ${mem_used} / ${mem_total}))

# Load average
load_average=$(awk '{print $1" "$2" "$3}' /proc/loadavg)

# Time
time_cur=$(date)

# Users
user_num=$(who -u | wc -l)

# Network Info
network_info=$(ip addr show | awk '/inet / || /inet6 / {print $2}')
ip_addresses=($network_info)

# Server Uptime
uptime_info=$(uptime -p)

echo -e "\033[0;36;40m$logo\033[0m"
echo -e "System time:   $time_cur"
echo -e "Memory used:   \033[0;31;40m$mem_used\033[0m MiB / \033[0;32;40m$mem_total\033[0m MiB ($mem_usage%)"
echo -e "Load average:  \033[0;33;40m$load_average\033[0m"
echo -e "Users online:  $user_num\n"
echo "Network Info:"
for ip in "${ip_addresses[@]}"; do
    printf "%-14s %s\n" "" "$ip"
done
uptime_info=$(echo "$uptime_info" | sed 's/up//')
printf "%-12s %s\n" "Server Uptime:" "$uptime_info"