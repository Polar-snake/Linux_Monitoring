#!/bin/bash

source get_info.sh

get_info

read -p "Хотите записать данные в файл? (Y/N): " choice
if [[ "$choice" == "Y" || "$choice" == "y" ]]; then
  filename="system_info_$(date +"%d_%m_%Y_%H_%M_%S").txt"
  
  get_info > "$filename"
  
  echo "Данные записаны в файл: $filename"
else
  echo "Данные не будут записаны в файл."
fi
