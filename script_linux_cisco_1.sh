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

su -
# Acts as a different user temporarily

sl
# Shows a train, only in the cisco VM

