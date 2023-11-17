#!/bin/bash

# Написать bash-скрипт. Скрипт запускается с одним параметром. Параметр текстовый.
# Скрипт выводит значение параметра.
# Если параметр - число, то должно выводится сообщение о некорректности ввода.


if [[ $# -ne 1 ]]; then
  echo "Ошибка: скрипт должен быть запущен с одним параметром"
elif [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Ошибка: параметр не должен быть числом"
else
    echo $1
fi