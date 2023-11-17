#!/bin/bash

get_info() {
# Получение информации
HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | grep Time)
USER=$(whoami)
OS=$(lsb_release -ds)
DATE=$(date +"%d %b %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(hostname -I)
MASK=$(ip addr show | awk '/inet.*brd/{print $2}')
GATEWAY=$(ip -4 route show default | awk '{print $3}')
RAM_TOTAL=$(free -h --si | awk '/Mem:/{print $2}')
RAM_USED=$(free -h --si | awk '/Mem:/{print $3}')
RAM_FREE=$(free -h --si | awk '/Mem:/{print $4}')
SPACE_ROOT=$(df -h / | awk '/\//{print $2}')
SPACE_ROOT_USED=$(df -h / | awk '/\//{print $3}')
SPACE_ROOT_FREE=$(df -h / | awk '/\//{print $4}')

# Вывод информации
echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $TIMEZONE"
echo "USER = $USER"
echo "OS = $OS"
echo "DATE = $DATE"
echo "UPTIME = $UPTIME"
echo "UPTIME_SEC = $UPTIME_SEC"
echo "IP = $IP"
echo "MASK = $MASK"
echo "GATEWAY = $GATEWAY"
echo "RAM_TOTAL = $RAM_TOTAL"
echo "RAM_USED = $RAM_USED"
echo "RAM_FREE = $RAM_FREE"
echo "SPACE_ROOT = $SPACE_ROOT"
echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}