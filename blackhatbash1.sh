#!/usr/bin/env bash
set -x

# bash --version

env

echo ${SHELL}

echo ${RANDOM}

echo ${UID}

echo ${OSTYPE}

ps -e -f

ps -ef

df --human-readable

#!/bin/bash -x
# Activate the debbug mode

# bash blackhatbash1.sh

chmod u+x blackhatbash1.sh

./blackhatbash1

# bash -r blackhatbash1.sh
# This will restrict some dangerous commands

# bash -n blackhatbash1.sh
# Verify the script syntax

# bash -x blackhatbash1.sh

set +x
