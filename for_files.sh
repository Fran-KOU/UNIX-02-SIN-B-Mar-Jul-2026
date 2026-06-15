#!/usr/bin/env bash

for file in example_file*; do # Find all the files in your current folder that start with the name example_file
 if [[ "${file}" == "example_file1" ]]; then
 # When the loop reaches the file that is exactly called example_file1, it prints the message 
 # "Skipping the first file" and executes continue. The continue command tells Bash, 
 # "Skip the rest of the instructions from this turn and immediately move on to the next file".
 echo "Skipping the first file"
  continue
 fi
 echo "${RANDOM}" > "${file}" 
done
 # For all other files (those not named example_file1), the script will generate a random number and 
 # write it inside the file, deleting whatever was there before.