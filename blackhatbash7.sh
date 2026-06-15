#!/usr/bin/env bash
grep "35.237.4.214" log.txt
printf "\n"

grep "35.237.4.214\|13.66.139.0" log.txt
printf "\n"

grep -e "35.237.4.214" -e "13.66.139.0" log.txt
printf "\n"


