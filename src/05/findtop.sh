#!/bin/bash

top_5_folders_by_desc() {
  du -h "$1" 2>/dev/null | sort -hr | head -5 | awk 'BEGIN{i=1}{printf "%d - %s, %s\n", i, $2, $1; i++}' | sed -r 's/([0-9])([G-M])/\1 \2\B/g;'

}

top_10_files_by_desc() {
  path=()
  size=()
  order=()
  eval "$(find "$1" -type f -exec ls -SGgh {} + 2>/dev/null | head -10 |
    awk 'BEGIN{ i=0;}{print "size[i]="sq $3 sq; print "path[i]="sq $7 sq; print "order[i++]="sq NR sq;}')"
  for i in "${!size[@]}"; do
    ext=$(get_size_unit "${size[$i]}")
    type=$(echo "${path[$i]}" | grep -e "\.[a-z]*$" -o)
    if [[ -n $type ]]; then
      printf "%s - %s, %s %s, %s\n" "${order[$i]}" "${path[$i]}" "${size[$i]%[KMG]}" "$ext" "${type#.}"
    else
      printf "%s - %s, %s %s\n" "${order[$i]}" "${path[$i]}" "${size[$i]%[KMG]}" "$ext"
    fi
  done
}

top_10_exec_files_by_desc() {
  path=()
  size=()
  order=()
  eval "$(find "$1" -type f -executable -exec ls -SGgh {} + 2>/dev/null | head -10 |
    awk 'BEGIN{ i=0;}{print "size[i]="sq $3 sq; print "path[i]="sq $7 $8 $9 $10 sq; print "order[i++]="sq NR sq;}')"
  for i in "${!size[@]}"; do
    ext=$(get_size_unit "${size[$i]}")
    hash=$(md5sum "${path[$i]}" 2>/dev/null | awk '{print $1}')
    printf "%s - %s, %s %s, %s\n" "${order[$i]}" "${path[$i]}" "${size[$i]%[KMG]}" "$ext" "$hash"
  done
}

get_size_unit() {
  case $1 in
  *K) echo "KB" ;;
  *M) echo "MB" ;;
  *G) echo "GB" ;;
  *) echo "B" ;;
  esac
}
