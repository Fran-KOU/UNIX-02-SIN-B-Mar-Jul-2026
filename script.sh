ls -a /

#ls is the commmand, the "-a" is the option and the "/" is the argument.

#OR

ls --all /

#ls -all is the large version and has the same function.

ls -a
ls -h
ls -l

ls -l -a -h

ls -l -ah

# Executing each command give us different information, but if we write all the previous commands in one line it shows the information just with one line.

mkdir -- -rf

# To create a diectory.

rm -rf

# Doesn´t work because the codespace interpet the "-rf" section as an option

rmdir -- -rf

# With the "--" it says to the complier that the next command is an attribute. It remove the directory previously created.

git clone --depth 1 https://github.com/torvalds/linux.git

# depth is an option that takes the number as a value. Here the value is one and brings one commit.

ls --help

# Shows a summarized manual

man ls

# Shows the entire manual

-- depth

# Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless --no-single-branch is given to fetch the
# histories near the tips of all branches. If you want to clone submodules shallowly, also pass --shallow-submodules.

chmod +x script.sh 

# Everyone can execute

chmod u+x script.sh

# Only the owner can execue

chmod o-r script.sh

# Remove reading to "others"

chmod u+rw,go-rwx privado

# Only the owner can read/write, no one else can

sudo echo "hola" > /etc/archivo_protegido

# The command doesnt work because we doesnt have the enough permissions and the "sudo" only works with the first order "echo".

echo "hola" | sudo tee /etc/archivo_protegido > /dev/null

# Generate a text ("hola"), and uses the "|" as the entrance of the next command, tee is a tool that read and write in two different places,
# on the screen and on the specific file. "/dev/null" acts as a black hole

echo "hola" | sudo tee /etc/archivo_protegido

# Unlike the previous command, this command actually shows the message "hola"

sudo sh -c 'echo "chao" >> /etc/archivo_protegido'

# "sh" open the command interpreter and the "-c" execute all the rest of the command that is between " '' ".
# And the ">>" adds a new text line on the already exist file, in this case "chao"

sudo su -

# Change my user to the root, if we want to log out we type "exit"

echo "$HOME"

# Execute the directory

echo '$HOME'

# Execute as a string

umask

# Shows the default mask for the operative system

touch archivo1

# Creates a brand new file

mkdir directorio1

# Creates a new directory

ls -l

# Shows the list of permissions

# @Fran-KOU ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (boot_exploration) $ ls -l
# total 60
# -rw-rw-rw-  1 codespace root      34523 Apr 13 12:15 LICENSE
# -rw-rw-rw-  1 codespace root         69 Apr 13 12:23 README.md
# -rw-rw-rw-  1 codespace codespace     0 Apr 27 12:31 archivo1
# drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:32 directorio1
# -rw-rw-rw-  1 codespace codespace  1083 Apr 15 13:34 ejercicio1.sh
# -rw-rw-rw-  1 codespace codespace   602 Apr 15 13:41 ejercicio2.sh
# -rwxrwxrwx  1 codespace codespace    45 Apr 15 13:02 hola.sh
# -rwxr-xr-x  1 codespace codespace     0 Apr 15 13:36 prueba.txt

umask 027

# Change the permissions, 0 means that the user doesnt have any permission, 2 means that the group only can read and 7 means that the others have all the permissions "rwx"

# @Fran-KOU ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (boot_exploration) $ umask
# 0027

touch archivo2

# Create a new file

mkdir directorio2

# Creates a new directory

ls -l

# @Fran-KOU ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (boot_exploration) $ ls -l
# total 64
# -rw-rw-rw-  1 codespace root      34523 Apr 13 12:15 LICENSE
# -rw-rw-rw-  1 codespace root         69 Apr 13 12:23 README.md
# -rw-rw-rw-  1 codespace codespace     0 Apr 27 12:31 archivo1
# -rw-rw-rw-  1 codespace codespace     0 Apr 27 12:37 archivo2
# drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:32 directorio1
# drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:37 directorio2
# -rw-rw-rw-  1 codespace codespace  1083 Apr 15 13:34 ejercicio1.sh
# -rw-rw-rw-  1 codespace codespace   602 Apr 15 13:41 ejercicio2.sh
# -rwxrwxrwx  1 codespace codespace    45 Apr 15 13:02 hola.sh
# -rwxr-xr-x  1 codespace codespace     0 Apr 15 13:36 prueba.txt
# -rwxrwxrwx  1 codespace codespace  2799 Apr 27 12:37 script.sh

umask 077

# @Fran-KOU ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (boot_exploration) $ umask
# 0077

touch secreto.txt

# Creates a file named "secreto.txt"

mkdir privado

# Creates a directory

ls -l

# @Fran-KOU ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (boot_exploration) $ ls -l
# total 72
# -rw-rw-rw-  1 codespace root      34523 Apr 13 12:15 LICENSE
# -rw-rw-rw-  1 codespace root         69 Apr 13 12:23 README.md
# -rw-rw-rw-  1 codespace codespace     0 Apr 27 12:31 archivo1
# -rw-rw-rw-  1 codespace codespace     0 Apr 27 12:37 archivo2
# drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:32 directorio1
# drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:37 directorio2
# -rw-rw-rw-  1 codespace codespace  1083 Apr 15 13:34 ejercicio1.sh
# -rw-rw-rw-  1 codespace codespace   602 Apr 15 13:41 ejercicio2.sh
# -rwxrwxrwx  1 codespace codespace    45 Apr 15 13:02 hola.sh
# drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:41 privado
# -rwxr-xr-x  1 codespace codespace     0 Apr 15 13:36 prueba.txt
# -rwxrwxrwx  1 codespace codespace  4528 Apr 27 12:40 script.sh
# -rw-rw-rw-  1 codespace codespace     0 Apr 27 12:41 secreto.txt

sudo apt-get update

sudo apt-get install acl

sudo chown -R $(whoami) .

sudo setfacl -bnR .

whoami

# shows the name of the owner

echo "Hola" > mi_archivo

# Writes "Hola" on a new file named "mi_archivo"

ls -l mi_archivo

# List the permissions of the file

useradd -m -s /usr/bin/zsh luna

# Add a new user named "luna", but it needs "sudo" to work

chown luna mi_archivo

# Change the owner of the file to luna, but it needs "sudo" as well

ls -l mi_archivo

# Shows the permissions of the file

# @Fran-KOU ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (boot_exploration) $ ls -l mi_archivo
# -rw-r--r-- 1 luna codespace 5 Apr 27 13:13 mi_archivo

groups

# Show the groups

groupadd grupo_test

# Adds a new group, needs sudo to work

touch comun

ls -l comun

usermod -a -G grupo_test luna

# Adds a new user to the group

chgrp grupo_test comun

# Add the group to the file "comun"

ls -l comun

# -rw-r----- 1 codespace grupo_test 0 Apr 27 13:39 comun

sudo chown luna:grupo_test mi_archivo

# Change the owner of the groups to luna

ls -l mi_archivo