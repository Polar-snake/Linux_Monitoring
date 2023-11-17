#!/bin/bash

function info() {

  default_color_1=$(get_default_colors 6 4 "$column1_background")
  default_color_2=$(get_default_colors 1 5 "$column1_font_color")
  default_color_3=$(get_default_colors 2 4 "$column2_background")
  default_color_4=$(get_default_colors 4 5 "$column2_font_color")

  color_name_1=${column1_background:-"default"}
  color_name_2=${column1_font_color:-"default"}
  color_name_3=${column2_background:-"default"}
  color_name_4=${column2_font_color:-"default"}

  column1_background=${column1_background:-$default_color_1}
  column1_font_color=${column1_font_color:-$default_color_2}
  column2_background=${column2_background:-$default_color_3}
  column2_font_color=${column2_font_color:-$default_color_4}

  case $column1_background in
    1) BG="\033[47m";;
    2) BG="\033[41m";;
    3) BG="\033[42m";;
    4) BG="\033[44m";;
    5) BG="\033[45m";;
    6) BG="\033[40m";;
    *) BG="\033[40m";;
  esac

  case $column1_font_color in
    1) FG="\033[37m";;
    2) FG="\033[31m";;
    3) FG="\033[32m";;
    4) FG="\033[34m";;
    5) FG="\033[35m";;
    6) FG="\033[30m";;
    *) FG="\033[37m";;
  esac

  case $column2_background in
    1) VALUE_BG="\033[47m";;
    2) VALUE_BG="\033[41m";;
    3) VALUE_BG="\033[42m";;
    4) VALUE_BG="\033[44m";;
    5) VALUE_BG="\033[45m";;
    6) VALUE_BG="\033[40m";;
    *) VALUE_BG="\033[40m";;
  esac

  case $column2_font_color in
    1) VALUE_FG="\033[37m";;
    2) VALUE_FG="\033[31m";;
    3) VALUE_FG="\033[32m";;
    4) VALUE_FG="\033[34m";;
    5) VALUE_FG="\033[35m";;
    6) VALUE_FG="\033[30m";;
    *) VALUE_FG="\033[37m";;
  esac

 DEFAULT="\033[0m"

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
echo -e "${BG}${FG}HOSTNAME${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$HOSTNAME${DEFAULT}"
echo -e "${BG}${FG}TIMEZONE${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$TIMEZONE${DEFAULT}"
echo -e "${BG}${FG}USER${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$USER${DEFAULT}"
echo -e "${BG}${FG}OS${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$OS${DEFAULT}"
echo -e "${BG}${FG}DATE${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$DATE${DEFAULT}"
echo -e "${BG}${FG}UPTIME${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$UPTIME${DEFAULT}"
echo -e "${BG}${FG}UPTIME_SEC${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$UPTIME_SEC${DEFAULT}"
echo -e "${BG}${FG}IP${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$IP${DEFAULT}"
echo -e "${BG}${FG}MASK${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$MASK${DEFAULT}"
echo -e "${BG}${FG}GATEWAY${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$GATEWAY${DEFAULT}"
echo -e "${BG}${FG}RAM_TOTAL${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$RAM_TOTAL${DEFAULT}"
echo -e "${BG}${FG}RAM_USED${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$RAM_USED${DEFAULT}"
echo -e "${BG}${FG}RAM_FREE${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$RAM_FREE${DEFAULT}"
echo -e "${BG}${FG}SPACE_ROOT${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$SPACE_ROOT${DEFAULT}"
echo -e "${BG}${FG}SPACE_ROOT_USED${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$SPACE_ROOT_USED${DEFAULT}"
echo -e "${BG}${FG}SPACE_ROOT_FREE${DEFAULT}" = "${VALUE_BG}${VALUE_FG}$SPACE_ROOT_FREE${DEFAULT}"

  echo "Column 1 background = $color_name_1 ($(getColorName $column1_background))"
  echo "Column 1 font color = $color_name_2 ($(getColorName $column1_font_color))"
  echo "Column 2 background = $color_name_3 ($(getColorName $column2_background))"
  echo "Column 2 font color = $color_name_4 ($(getColorName $column2_font_color))"

}

function getColorName() {
 case $1 in
    1) echo "white";;
    2) echo "red";;
    3) echo "green";;
    4) echo "blue";;
    5) echo "purple";;
    6) echo "black";;
    default) echo "default";;
 esac
}