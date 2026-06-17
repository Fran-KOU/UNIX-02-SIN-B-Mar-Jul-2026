#!/usr/bin/env bash

awk '{print $1,$NF}' log.txt
printf "\n"

awk '{print $1}' log.txt
printf "\n"

awk '{print $2}' log.txt
printf "\n"

awk '{print $3}' log.txt
printf "\n"

awk '{print $NF}' log.txt
printf "\n"

awk -F',' '{print $1}' example_csv.txt
printf "\n"

awk 'NR < 10' log.txt
printf "\n"

grep "42.236.10.117" log.txt | awk '{print $7}'
printf "\n"

sed 's/Mozilla/Godzilla/g' log.txt
printf "\n"

grep -o "Mozilla" log.txt # Filter the word "Mozilla" from the text file "log.txt", the -o says to the terminal that print only the word "Mozilla". 
printf "\n"

sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt 
# s/: Indicates that a substitution will be made.

# Mozilla/Godzilla/: Changes the first word to the second.

# g: Means "global". Ensures that if the word "Mozilla" appears multiple times on the same line, all instances are replaced.
# > newlog.txt: Takes all the modified text and saves it to a new file called newlog.txt. Your original log.txt file remains untouched.

printf "\n"

grep -o "Godzilla" newlog.txt # Filter the word "Godzilla" from the text file "newlog.txt", the -o says to the terminal that print only the word "Godzilla".
printf "\n"
grep -o "Mozilla" newlog.txt # Filter the word "Mozilla" from the text file "newlog.txt", the -o says to the terminal that print only the word "Mozilla".
printf "\n"

sed 's/ //g' newlog.txt
cat newlog1.txt
sed 's/ //g' log.txt > newlog1.txt
printf "\n"

sed '1d' newlog.txt > newlogl.txt
cat newlogl.txt
printf "\n"

sed '$d' newlog.txt
printf "\n"

sleep 100 &

ps -ef | grep sleep
# root           1       0  0 12:13 ?        00:00:00 /bin/sh -c echo Container started trap "exit 0" 15  exec "$@" while sleep 1 & wait $!; do :; done -
# root       27038     740  0 13:10 pts/2    00:00:00 sleep 100
# root       27097       1  0 13:11 ?        00:00:00 sleep 1
# root       27103     740  0 13:11 pts/2    00:00:00 grep --color=auto sleep

jobs
# [1]+  Hecho                      sleep 100

fg %1
# Brings the function to the foreground

bg %1
# Brings the function to the background

