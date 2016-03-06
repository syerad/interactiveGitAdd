#!/bin/bash
# @TODO: duplicate files in list if files are in staging area and also modified
# @TODO: support for english language

choice () {
  local choice=$1
    if [[ ${opts[choice]} ]] # toggle
    then
        opts[choice]=
    else
        opts[choice]=*
    fi
  # if [[ ${options} ]]
}

addToGit() {
  for file in "${!chosenOptions[@]}"
  do
    git add $file
  done
}

status=`git status`
declare -A chosenOptions

parseGitStatus () {
    # testfile=` echo "$status" | sed -n -E 's/[ \t]+geändert\:[ \t]+([a-zA-Z0-9.]+)/\1/p' `
    # alternative way: git status|grep geänd|awk '{print $2}'
    rows=` echo "$status"| grep geänd|awk '{print $2}' `
    options=()
    for opt in $rows
    do
      options+=("$opt")
    done
    options+=("done")
}
createmenu ()
{
  PS3='Please enter your choice: '
  select option; do # in "$@" is the default
    if [ "$REPLY" -eq "$(($#))" ];
    then
      echo "Exiting..."
      # echo "Chosen files: ${chosenOptions[@]}"
      break;
    elif [ 1 -le "$REPLY" ] && [ "$REPLY" -le $(($#)) ];
    then
      if [[ ${#chosenOptions[@]} -gt 0 ]]
      then
        for file in "${!chosenOptions[@]}"
        do
          if [[ ${options[$REPLY-1]} == ${chosenOptions[$file]} ]]
          then
            unset chosenOptions[${options[$REPLY-1]}]
            break;
          else
            test ! ${chosenOptions[${options[$REPLY-1]}]+_} && chosenOptions[${options[$REPLY-1]}]=${options[$REPLY-1]}
          fi
        done
      else
        chosenOptions[${options[$REPLY-1]}]=${options[$REPLY-1]}
      fi
      echo "Chosen files: ${chosenOptions[@]}"
    else
      echo "Incorrect Input: Select a number 1-$#"
    fi
  done

  echo "Files chosen: ${chosenOptions[@]}"
}

parseGitStatus
createmenu "${options[@]}"
addToGit
