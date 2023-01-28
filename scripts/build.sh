#!/bin/bash

RESET=$(tput sgr0)
BOLD=$(tput bold)
ITALIC=$(tput sitm)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)

JAVAICON=""
COMPILEICON=""
BUILDICON=""
BUILDDIRICON=""
RUNICON=""
CLEANICON=""
DONEICON=""
ERRICON=""

USAGE="Usage: $(basename "$0") [COMMAND] [OPTIONS] 

command:
  run       run the compiled project
  clean     clean the project (delete java binaries and build files)
    
options:
  --help | -h     show this help text"

PROJECTNAME="$(pwd | awk -F "/" '{print $(NF-1)}')"
BUILDDIR=build
FILENAME="Main"


function main() {

  function clean() {
    printf "%s===>%s %s Cleaning project %s%s%s\n" "$BLUE" "$RESET" "$CLEANICON" "$BOLD" "$PROJECTNAME" "$RESET"
    if [ -d "$BUILDDIR" ]; then
      if rm -rf $BUILDDIR; then
        printf "\t%s%s %s directory removed succesfully!%s\n" "$GREEN" "$DONEICON" "$BUILDDIR" "$RESET"
      else
        printf "\t%s%s There was an error deleting the %s directory!\n%s" "$RED" "$ERRICON" "$RESET" "$BUILDDIR"
      fi
    else
      printf "\t Nothing to clean.\n"
    fi
  }

  function run() {
    printf "%s===>%s %s Running project %s%s%s\n" "$BLUE" "$RESET" "$RUNICON" "$BOLD" "$PROJECTNAME" "$RESET"
    if [ -d "$BUILDDIR" ]; then
      java -cp $BUILDDIR $FILENAME
    else
      printf "\t%s%s Build directory not found!%s\n" "$RED" "$ERRICON" "$RESET"
      printf "\tPlease run %s./build.sh%s first.\n" "$BOLD" "$RESET"
    fi
  }
  
  function compile() {
    printf "\t%s Compiling the project...\n" "$COMPILEICON"
    FILEPATH=$(find . -name "$FILENAME.java")
    if [ -n "$FILEPATH" ]; then
      if javac -d $BUILDDIR $FILENAME.java; then
        printf "\t\t%s%s Compiling finished succesfully!%s\n" "$GREEN" "$DONEICON" "$RESET"
        printf "\t\tTo run the program, type: %s./build.sh run%s\n" "$BOLD" "$RESET"
      else
        printf "\t\t%s%s There was an error compiling the project!%s\n" "$RED" "$ERRICON" "$RESET"
      fi
    else
      printf "\t\t%s%s Main.java file doesn't exist!%s\n" "$RED" "$ERRICON" "$RESET"
      printf "\t\tIt seems the Main.java file doesn't exist in the current directory.\n\t\tPlease create or refactor the class that contains the main method to the file Main.java\n"
    fi
  }

  function check_java() {
    printf "\t%s Checking if Java is installed...\n" "$JAVAICON"
    if command -v java > /dev/null 2>&1; then
      printf "\t\t%s%s Java is installed in this system!%s\n\t\t(binary found at %s)\n" "$GREEN" "$DONEICON" "$RESET" "$ITALIC$(ls -l $(which java) | awk '{print $NF}')$RESET"
      printf "\t\t%s\n" "$(java -version 2>&1 | head -n 1)"
    else
      printf "\t\t%s%s Java is not installed in this system!\n\tPlease install Java and try again.%s\n" "$RED" "$ERRICON" "$RESET"
      exit 1
    fi
  }

  function build() {
    printf "%s===>%s %s Building project %s%s%s\n" "$BLUE" "$RESET" "$BUILDICON" "$BOLD" "$PROJECTNAME" "$RESET"
    check_java
    printf "\t%s Creating build directory...\n" "$BUILDDIRICON"
    if [ ! -d "$BUILDDIR" ]; then
      if mkdir -p $BUILDDIR; then
        printf "\t\t%s%s Created directory: $BUILDDIR%s\n" "$GREEN" "$DONEICON" "$RESET"
      else
        printf "\t\t%s%s Failed to create directory: $BUILDDIR%s\n" "$RED" "$ERRICON" "$RESET"
      fi
    else
      printf "\t\t%s%s Build directory already exists%s\n" "$GREEN" "$DONEICON" "$RESET"
    fi
    compile
  }


  if [ $# -eq 0 ]; then
    build
  elif [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
    printf "%s\n" "$USAGE"
  else
    if $1 2>/dev/null; then
      echo
    else
      printf "%s%s Unknown argument: %s.%s\n" "$RED" "$ERRICON" "$1" "$RESET"
      printf "%s\n" "$USAGE"
    fi
  fi
}

main $1 
