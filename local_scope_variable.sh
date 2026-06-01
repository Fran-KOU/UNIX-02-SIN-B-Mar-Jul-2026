#!/bin/bash
PUBLISHER="No Starch Press"
# This variable is global
print_name(){
 local name
 # This variable only works on this function
 name="Black Hat Bash"
 echo "${name} by ${PUBLISHER}"
}
print_name
echo "Variable ${name} will not be printed because it is a local variable."