#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 6)
RESET=$(tput sgr0)
DONE=""
ERRICON=""

RELATIVE_PATH="../../../scripts/build.sh"

USAGE="Usage:  $(basename "$0") [COMMAND] [OPTIONS]  

command:
  rm    remove the symbolic links of build.sh in all subdirectories

options:
  --help | -h    show this help text"

if [ "$#" -eq 0 ]; then
  IFS=$'\n' RES=( $(find ../problems -name 'src') )
  for DEST in ${RES[@]}
  do
    NAME=$(echo $DEST | awk -F "/" '{print $(NF-1)}')
    if ln -sf $RELATIVE_PATH $DEST; then 
      printf "%s%s%s Successfully %ssymlinked%s build.sh to %s\n" "$GREEN" "$DONE" "$RESET" "$BLUE" "$RESET" "$NAME"
    fi
  done
  # find ../problems -name 'src' -exec ln -fs "$RELATIVE_PATH" {} \; -exec printf "%s%s Successfully symlinked build.sh to %s%s\n" "$GREEN" "$DONE" {} "$RESET" \;
elif [[ "$1" == "rm" ]]; then
  IFS=$'\n' RES=( $(find ../problems -name 'build.sh') )
  for DEST in ${RES[@]}
  do
    NAME=$(echo $DEST | awk -F "/" '{print $(NF-2)}')
    if rm -rf $DEST; then 
      printf "%s%s%s Successfully %sremoved%s the symlink build.sh in %s\n" "$GREEN" "$DONE" "$RESET" "$RED" "$RESET" "$NAME"
    fi
  done
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  printf "%s\n" "$USAGE"
else
  printf "%s%s Unknown argument: %s.%s\n" "$RED" "$ERRICON" "$1" "$RESET"
  printf "%s\n" "$USAGE"
fi

