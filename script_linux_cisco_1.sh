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

sudo
# Execute the next command as an admin

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

cat animals.txt