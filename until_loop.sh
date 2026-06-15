#!/usr/bin/env bash

FILE="output.txt"
touch "${FILE}"

# AQUÍ: Se agregaron los espacios después de [[ y antes de ]]
until [[ -s "${FILE}" ]]; do
 echo "${FILE} is empty..."
 echo "Checking again in 2 seconds..."
 sleep 2
done
echo "${FILE} appears to have some content in it!"