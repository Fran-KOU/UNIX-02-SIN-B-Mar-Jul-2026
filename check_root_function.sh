#!/usr/bin/env bash 

# This function checks if the current user ID equals zero.

check_if_root(){
if [[ "${EUID}" -eq "0" ]]; then # Effective user id equals to 0, it means "root"
 return 0 # Success
 else
 return 1 # Failed
 fi
}
if check_if_root; then
 echo "User is root!"
else
 echo "User is not root!"
fi

# I created another user named "estudiante", i used the command 'adduser estudiante'
# Then i change my user to estudiante with 'su estudiante'

# ┌──(estudiante㉿codespaces-59bc22)-[/workspaces/UNIX-02-SIN-B-Mar-Jul-2026]
# └─$ bash check_root_function.sh
# User is not root!

