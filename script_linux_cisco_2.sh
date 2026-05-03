# ============= Sorry teacher, i didnt notice that i had to complete to the point 11.1. ===================

# ===== Moving Files =====

cd School/Art
mv people.csv Work
# This will move the file "people.csv" to the directory "Work"

mv numbers.txt letters.txt alpha.txt School
# To move various files, we write next to them the others and on the final of the command we write the destination

# ===== Removing Files and directories =====

touch linux.txt
# Create a new file

ls
# School  alpha.txt  animals.txt  hello.sh  linux.txt

rm linux.txt
# This remove the file

ls
# School  alpha.txt  animals.txt  hello.sh

mkdir directory
# Create a directory

rm directory
# If we try to remove a directory it will show an error

rm -r directory
# Adding "-r" it will remove the directory for sure

# ===== Entrance filters =====

grep sysadmin passwd  
# It can be used to filter and obtain information about a specific user or localice words (On this codespaces doesnt work
# but in the VM of CISCO it does.)

# sysadmin:x:1001:1001:System Administrator,,,,:/home/sysadmin:/bin/bash 
# This is the result of the command.

# ===== Basic patterns =====

sysadmin@localhost:~/Documents$ grep 'root' passwd
# root:x:0:0:root:/root:/bin/bash                                                 
# operator:x:1000:37::/root:

# The root pattern appears many times in the /etc/passwd file

sysadmin@localhost:~/Documents$ grep '^root' /etc/passwd
# root:x:0:0:root:/root:/bin/bash

# The first anchor character ^ is used to indicate that the pattern should appear 
# at the beginning of the line.

sysadmin@localhost:~/Documents$ grep 'r$' alpha-first.txt
# B is for Bear
# F is for Flower

# The second anchor character $ can be used to indicate that the pattern should 
# appear at the end of the line.

sysadmin@localhost:~/Documents$ grep 'r..f' red.txt
# reef
# roof

# The ".." means to search words that begins with "r" and exactly two spaces away are an "f"

sysadmin@localhost:~/Documents$ grep 'r..d' red.txt
# reed
# read

# Same here

sysadmin@localhost:~/Documents$ grep '....' red.txt                             
# reef
# reeed
# roof                                                                            
# reed
# root
# reel
# read

# Its also used to find words with an specific letter large, in this case it find words with at least 4 letters

grep '[0-9]' profile.txt
# I am 37 years old.
# 3121991
# I have 2 dogs.
# 123456789101112

# Highlight the numbers

grep '[^0-9]' profile.txt
# I am 37 years old.
# 3121991
# I have 2 dogs.
# 123456789101112

# Used to fin non-numerical characters

grep '[.]' profile.txt
# Hello my name is Joe.
# I am 37 years old.
# My favorite food is avocados.
# I have 2 dogs.

# Find the "." character, used to find literal characters

# ===== Turn Off ===== 

sudo shutdown
# This command requires super user to work

shutdown +1 "Goodbye World!"
# We can add a message before the terminal shutdown

# ===== Network configuration =====

ifconfig
# Show the information of the network

ping -c 4 192.168.1.2
# Used to verify the connectivity among two devices

# ===== Process Visualization =====

ps
# Show the current proccess

ps -e
# Show all the process on the system

ps -ef
# Show all the process but detailed

# ===== Package Managment =====

sudo apt-get update
# Update the list of available packages

apt-cache search cow
# To search for packages associated with the keyword cow

sudo apt-get install cowsay
# Once found, install the package

sudo apt-get upgrade
# To update all the packages and dependences

sudo apt-get purge cowsay
# To remove a package

# ===== Passwords =====

passwd
# Used to change the password

passwd -S sysadmin 
# Used to view information about the password of the user

sudo passwd sysadmin
# Used to change the password of other users