#!/usr/bin/env bash

SIGNAL_TO_STOP_FILE="stoploop" # Determine the name of the file to stop the loop
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do # Checks, using a file test operator. The loop won’t exit
 echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..." # until the condition is satisfied. Once the file is available, the loop will stop
 echo "Checking again in 2 seconds..."
 sleep 2
done
echo "File was found! Exiting..."