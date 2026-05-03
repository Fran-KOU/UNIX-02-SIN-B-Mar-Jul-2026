# ====== List ======

ls
# List the files in the actual directory

ls Documents
# List the files on an specific directory

aptitude moo
# It is a package management feature available in some versions of Linux

ls -l
# List the files with more information and on a vertical format

ls -r
# List the files on an inverted order

ls -lr
# Combine the two formats, inverted order and on a vertical format

aptitude -v moo
aptitude -vv moo
aptitude -vvv moo
# Easter egg commands that are not available on this version of linux

# ===== Directories =====

pwd
# Print the current folder, the "~" means the main directory of the user

mkdir Documents
# We create a new directory for the exercises

cd Documents
# It changes the current directory for the "Documents" directory

cd /
# Moves to the root directory

cd /workspaces/UNIX-02-SIN-B-Mar-Jul-2026
# Moves to the main directory

pwd
# To confirm the directory

cd Documents
cd School/Art
# This is how a relative route is used, first, changing the directory to the main "Documents" and then
# move to the determined directory

cd ..
# The character .. always represents a higher directory relative to the current directory.

cd ~
# To move to the main directory

# ===== Types of lists =====

ls -l /var/log/
# List the type of file, permissions, number of direct links, owner, group owner, size of the file, timestamp
# and the name of the file or directorty.

ls -lt /var/log
# Order the files by its timestamp

ls -ls /var/log
# Order the files by its size

ls -lsr /var/log
# Order the files by its size, but in reverse

ls -r /var/log
# Order the files in reverse alphabetical order

# ===== Super User =====

su -
# Acts as a different user temporarily

sl
# Shows a train, only in the cisco VM

sudo
# Execute the next command as an admin

# ===== Changing Permissions =====

cd Documents
# Move to the Documents directory

touch hello.sh
# Creates a new file to change the permissions

ls -l hello.sh
# To list the permissions, this file has the read and write permissions

./hello.sh
# Shows error because this file doesnt have enough permissions

chmod u+x hello.sh
# Add the user permissions "u" and execution permissions "x"

ls -l hello.sh
# Now the permissions has been changed

./hello.sh
# Execute the content of the file

# ===== Changing Owner =====

cd Documents
# Change the directory

ls -l
# drwxrwxrwx+ 3 codespace codespace 4096 May  2 22:43 School
# -rwxrw-rw-  1 codespace codespace   23 May  2 23:18 hello.sh

sudo chown root hello.sh

# We change the owner of the "hello.sh" file to root

ls -l
# drwxrwxrwx+ 3 codespace codespace 4096 May  2 22:43 School
# -rwxrw-rw-  1 root      codespace   23 May  2 23:18 hello.sh

./hello.sh
# Now we dont have enough permissions to execute this file, now we need "sudo" to execute

sudo ./hello.sh
# Works

# ===== Executing files =====

cat animals.txt
# Show the content of the file

cat alpha.txt
# Show the entire list

head alpha.txt
# Shows the first half of the content of the file

tail alpha.txt
# Shows the second half of the content of the text

head -n 5 alpha.txt
# Show the first 5 lines of the file

tail -n 5 alpha.txt
# Show the last 5 lines of the file

# ===== Copy and paste =====

cp /etc/passwd .
# Copy the content of the file and paste in the main directory, "." is a shortcut of the current directory

dd if=/dev/zero of=/tmp/swapex bs=1M count=50
# It will create a file named /tmp/swapex with 50 one-megabyte blocks of zeros.

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

