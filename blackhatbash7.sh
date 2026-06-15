#!/usr/bin/env bash
grep "35.237.4.214" log.txt
printf "\n"

grep "35.237.4.214\|13.66.139.0" log.txt
printf "\n"

grep -e "35.237.4.214" -e "13.66.139.0" log.txt
printf "\n"

ps | grep TTY
printf "\n"

ps | grep -i tty
printf "\n"

grep -v "35.237.4.214" log.txt
printf "\n"

grep -o "35.237.4.214" log.txt
printf "\n"

awk '{print $1}' log.txt
printf "\n"


