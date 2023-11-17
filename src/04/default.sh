#!/bin/bash

get_default_colors() {
  if [[ -n $3 ]]; then
    if [[ $1 -eq $3 ]]; then
      echo "$2"
    else
      echo "$1"
    fi
  else
    echo "$1"
  fi
}
