#!/bin/bash

info() {
  echo "Total number of folders (including all nested ones) = $(du "$1" | wc -l)"
  echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
  top_5_folders_by_desc "$1"
  echo "etc up to 5"
  echo "Total number of files = $(find "$1" -type f | wc -l)"
  echo "Number of:"
  echo "Configuration files (with the .conf extension) = $(find "$1" -name .conf | wc -l)"
  echo "Text files = $(find "$1" -name .txt | wc -l)"
  echo "Executable files = $(find "$1" -type f -executable | wc -l)"
  echo "Log files (with the extension .log) = $(find "$1" -name .log | wc -l)"
  echo "Archive files = $(find "$1" -regex ".*\.\(zip\|rar\|tar\|a\|ar\|7z\)" | wc -l)"
  echo "Symbolic links = $(find "$1" -type l | wc -l)"
  echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
  top_10_files_by_desc "$1"
  echo "etc up to 10"
  echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
  top_10_exec_files_by_desc "$1"
  echo "etc up to 10"
}
