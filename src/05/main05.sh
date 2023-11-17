#!/bin/bash

source info.sh
source findtop.sh

start=$(date +%s)

if [[ $# -ne 1 ]]; then
  echo "Invalid input: no path provided. Please enter valid path as a parameter."
  echo "Usage: ./main.sh <PATH/>"
else
  regex="^.*/$"
  if [[ ! $1 =~ $regex ]]; then
    echo "Invalid input: invalid path provided. Path parameter should end with a slash ('/'). Please enter a valid path."
    echo "Usage: ./main.sh <PATH/>"
  else
    if ! [[ -d $1 ]]; then
      echo "Invalid input: directory does not exist. Please enter valid path as a parameter."
      echo "Usage: ./main.sh <PATH/>"
    else
      info "$1"
      end=$(date +%s)
      echo "Script execution time (in seconds) = $((end - start))"
    fi
  fi
fi
