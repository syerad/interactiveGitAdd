#!/bin/bash
# Purpose: Demonstrate usage of select and case with toggleable flags to indicate choices
# 2013-05-10 - Dennis Williamson

choice () {
    local choice=$1
    if [[ ${opts[choice]} ]] # toggle
    then
        opts[choice]=
    else
        opts[choice]=+
    fi
}

parseGitStatus () {
    status=`git status`
    # testfile=`sed '/^U/d' ./testfile.txt`
    # echo "$status"
    testfile=` echo "$status" | sed -n -E -e 's/geändert\:\s*(\S*)/\1/p' `
    # rows =
    echo "$testfile"
}
# choice
parseGitStatus
# status = $(git status)
# echo "$status"
# parseGitStatus
# PS3='Please enter your choice: '
# while :
# do
#     clear
#     options=("Option 1 ${opts[1]}" "Option 2 ${opts[2]}" "Option 3 ${opts[3]}" "Done")
#     select opt in "${options[@]}"
#     do
#         case $opt in
#             "Option 1 ${opts[1]}")
#                 choice 1
#                 break
#                 ;;
#             "Option 2 ${opts[2]}")
#                 choice 2
#                 break
#                 ;;
#             "Option 3 ${opts[3]}")
#                 choice 3
#                 break
#                 ;;
#             "Option 4 ${opts[4]}")
#                 choice 4
#                 break
#                 ;;
#             "Done")
#                 break 2
#                 ;;
#             *) printf '%s\n' 'invalid option';;
#         esac
#     done
# done
#
# printf '%s\n' 'Options chosen:'
# for opt in "${!opts[@]}"
# do
#     if [[ ${opts[opt]} ]]
#     then
#         printf '%s\n' "Option $opt"
#     fi
# done
