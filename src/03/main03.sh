#!/bin/bash

source info03.sh

# Проверка наличия параметров
if [ $# -ne 4 ]; then
  echo "Ошибка: скрипт должен быть запущен с 4 параметрами"
  exit 1
fi

# Проверка корректности параметров
if [[ ! $1 =~ ^[1-6]$ ]] || [[ ! $2 =~ ^[1-6]$ ]] || [[ ! $3 =~ ^[1-6]$ ]] || [[ ! $4 =~ ^[1-6]$ ]]; then
  echo "Ошибка: параметры должны быть числами от 1 до 6"
else
  # Вызов скрипта get_info.sh с передачей параметров
  if [[ $1 -eq $2 ]] || [[ $3 -eq $4 ]]; then
    echo "Ошибка: цвет шрифта и фона одного столбца не должны совпадать"
  else
  
    info $1 $2 $3 $4
  fi
fi