#!/bin/bash

function main {
  declare -l ADD_BOOK_F 

#  ADD_BOOK_F=${1-address-book.txt}
  ADD_BOOK_F="address-book.txt"
  if [ ! -e $ADD_BOOK_F ] 
  then touch $ADD_BOOK_F
  fi

  case $1 in
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
    'list')
      listAddressBook $ADD_BOOK_F
      ;;
    *)
      invalidMenuSelect $1
      ;;
  esac
}

function listAddressBook {
  declare -a addresses
  lines=($(cat $1))
  for line in ${lines[@]}
  do
   declare -A record;
   line=($(echo ${line} | sed 's/,/\t/g'))
   record[sName]=${line[0]}
   record[fName]=${line[1]}
   record[telephoneNum]=${line[2]}
   record[address]=${line[3]}
   echo -e "Name: ${record[sName]}, ${record[fName]}\nTelephone Number: ${record[telephoneNum]}\nAddress: ${record[address]}"
   echo "======="
  done
}

function invalidMenuSelect {
  echo "Unknown command: ${1}"
  displayHelp
}

function displayHelp {
  echo "Valid commands are 
  add: To add record
  find: To find record
  del: To delete record
  mod: To modify a record
  list: To list a record
  help: To display this menu again"
}

main $@
