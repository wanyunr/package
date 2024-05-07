#!/bin/bash

if [ -z "$DISTRIB_DESCRIPTION" ] || [ ! -x /usr/bin/lsb_release ]; then
    # Fall back to using the very slow lsb_release utility
    DISTRIB_DESCRIPTION=$(lsb_release -s -d)
fi

printf "Welcome to %s (%s)\n" "$DISTRIB_DESCRIPTION" "$(uname -r)"
printf "\n"

date=$(date)
load=$(cat /proc/loadavg | awk '{print $1}')
root_usage=$(df -h / | awk '/\// {print $(NF-1)}')
memory_usage=$(free -m | awk '/Mem:/ { total=$2; used=$3 } END { printf("%3.1f%%", used/total*100)}')

if [[ $(free -m | awk '/Swap/ {print $2}') == "0" ]]; then
    swap_usage="0.0%"
else
    swap_usage=$(free -m | awk '/Swap/ { printf("%3.1f%%", $3/$2*100) }')
fi

usersnum=$(expr $(users | wc -w) + 1)
time=$(uptime | grep -ohe 'up .*' | sed 's/,/\ hours/g' | awk '{ printf $2" "$3 }')
processes=$(ps aux | wc -l)
localip=$(hostname -I | awk '{print $1}')

IPv4=$(timeout 1s dig -4 TXT +short o-o.myaddr.l.google.com @ns3.google.com | sed 's/\"//g')
if [[ "$IPv4" == "" ]]; then
    IPv4=$(timeout 1s dig -4 TXT CH +short whoami.cloudflare @1.0.0.3 | sed 's/\"//g')
fi

IPv6=$(timeout 1s dig -6 TXT +short o-o.myaddr.l.google.com @ns3.google.com | sed 's/\"//g')
if [[ "$IPv6" == "" ]]; then
    IPv6=$(timeout 1s dig -6 TXT CH +short whoami.cloudflare @2606:4700:4700::1003 | sed 's/\"//g')
fi

IP_Check="$IPv4"
if expr "$IP_Check" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null; then
    for i in 1 2 3 4; do
        if [ $(echo "$IP_Check" | cut -d. -f$i) -gt 255 ]; then
            echo "fail ($IP_Check)"
            exit 1
        fi
    done
    IP_Check="isIPv4"
fi

[[ ${IPv6: -1} == ":" ]] && IPv6=$(echo "$IPv6" | sed 's/.$/0/')
[[ ${IPv6:0:1} == ":" ]] && IPv6=$(echo "$IPv6" | sed 's/^./0/')
IP6_Check="$IPv6"":"
IP6_Hex_Num=$(echo "$IP6_Check" | tr -cd ":" | wc -c)
IP6_Hex_Abbr="0"
if [[ $(echo "$IPv6" | grep -i '[[:xdigit:]]' | grep ':') ]] && [[ "$IP6_Hex_Num" -le "8" ]]; then
    for ((i = 1; i <= "$IP6_Hex_Num"; i++)); do
        IP6_Hex=$(echo "$IP6_Check" | cut -d: -f$i)
        [[ "$IP6_Hex" == "" ]] && IP6_Hex_Abbr=$(expr $IP6_Hex_Abbr + 1)
        [[ $(echo "$IP6_Hex" | wc -c) -le "4" ]] && {
            if [[ $(echo "$IP6_Hex" | grep -iE '[^0-9a-f]') ]] || [[ "$IP6_Hex_Abbr" -gt "1" ]]; then
                echo "fail ($IP6_Check)"
                exit 1
            fi
        }
    done
    IP6_Check="isIPv6"
fi

[[ "${IP6_Check}" != "isIPv6" ]] && IPv6="N/A"
[[ "${IP_Check}" != "isIPv4" ]] && IPv4="N/A"

if [[ "${localip}" == "${IPv4}" ]] || [[ "${localip}" == "${IPv6}" ]] || [[ -z "${localip}" ]]; then
    localip=$(cat /etc/hosts | grep "localhost" | sed -n 1p | awk '{print $1}')
fi

echo "System information as of $date"
echo
printf "%-30s%-15s\n" "System Load:" "$load"
printf "%-30s%-15s\n" "Private IP Address:" "$localip"
printf "%-30s%-15s\n" "Public IPv4 Address:" "$IPv4"
printf "%-30s%-15s\n" "Public IPv6 Address:" "$IPv6"
printf "%-30s%-15s\n" "Memory Usage:" "$memory_usage"
printf "%-30s%-15s\n" "Usage On /:" "$root_usage"
printf "%-30s%-15s\n" "Swap Usage:" "$swap_usage"
printf "%-30s%-15s\n" "Users Logged In:" "$usersnum"
printf "%-30s%-15s\n" "Processes:" "$processes"
printf "%-30s%-15s\n" "System Uptime:" "$time"
echo

UpdateLog="/var/log/PackagesUpdatingStatus.log"
[[ -f "$UpdateLog" ]] && rm -rf $UpdateLog

apt list --upgradable | awk 'END{print NR}' | tee -a "$UpdateLog" >/dev/null 2>&1
UpdateRemind=$(cat $UpdateLog | tail -n 1)
UpdateNum=$(expr $UpdateRemind - 1)

[ "$UpdateNum" -eq "1" ] && printf "$UpdateNum package can be upgraded. Run 'apt list --upgradable' to see it.\n"
[ "$UpdateNum" -gt "1" ] && printf "$UpdateNum packages can be upgraded. Run 'apt list --upgradable' to see them.\n"

rm -rf $UpdateLog
