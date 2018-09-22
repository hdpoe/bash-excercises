#!/bin/bash

function main {
  declare -l ADD_BOOK_F 

  ADD_BOOK_F=${1-address-book.txt}

  if [ ! -e $ADD_BOOK_F ] 
  then touch $ADD_BOOK_F
  fi

  case $2 in
    'add')
      # Add record here
      ;;
    'find')
      # Find record here
      ;;
    'del')
      # Delete record here
      ;;
    'mod')
      # Update record here
      ;;
    *)
      invalidMenuSelect $2
      ;;
  esac
}

function invalidMenuSelect {
  echo "Unknown command: $1
  Valid commands are 
  add: To add record
  find: To find record
  del: To delete record
  mod: To modify a record
  help: To display this menu again
  "
}

main $@
