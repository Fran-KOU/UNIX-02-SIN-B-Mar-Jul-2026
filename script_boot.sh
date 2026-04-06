@Fran-KOU ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (boot) $ cd
# When we type "cd" it changes the personal directory

@Fran-KOU ➜ ~ $ cd /
# Same here, but here we specify which directory we want to change

@Fran-KOU ➜ / $ cd /home/codespace
# It works like the first command

@Fran-KOU ➜ ~ $ cd ~
# The same directory

@Fran-KOU ➜ ~ $ cd $HOME
[1]+  Done                    cd
# Changes to the main directory, same function than the "~" or the "cd" command without specify.

@Fran-KOU ➜ ~ $ mkdir proyecto
# It creates a brand new directory with the name "proyecto"

@Fran-KOU ➜ ~ $ cd proyecto/
# Changes to our new directory

@Fran-KOU ➜ ~/proyecto $ ls -lai
total 12
926182 drwxr-xr-x 2 codespace codespace 4096 Apr  6 12:35 .
918515 drwxr-x--- 1 codespace codespace 4096 Apr  6 12:35 ..

# List the files of the directory, shows the inodes and the hardlinks