#!/bin/bash

source info.sh
source config.conf
source default.sh

# Проверка наличия параметров
if [ $# -ne 0 ]; then
  echo "Ошибка: скрипт должен быть запущен без параметров"
  echo "Задайте параметры в конфигурационном файле"
else
    if [[ $column1_background -eq $column1_font_color ]] || [[ $column2_background -eq $column2_font_color ]]; then
      echo "Ошибка: цвет шрифта и фона одного столбца не должны совпадать"
    else
      info
    fi
fi
