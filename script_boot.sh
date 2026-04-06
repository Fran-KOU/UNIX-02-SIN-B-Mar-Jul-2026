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

@Fran-KOU ➜ ~/proyecto $ stat .
  File: .
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 0,45    Inode: 926182      Links: 2
Access: (0755/drwxr-xr-x)  Uid: ( 1000/codespace)   Gid: ( 1000/codespace)
Access: 2026-04-06 12:37:17.432729997 +0000
Modify: 2026-04-06 12:35:45.235727967 +0000
Change: 2026-04-06 12:35:45.235727967 +0000
 Birth: 2026-04-06 12:35:45.235727967 +0000
# It shows the size of the blocks of the directory "proyecto". We can see 8 blocks, and each block has the size of 512 bytes, 512 for 8 is 4096.
# In the device, we see the numer "0,45" the o means that our disk is a virtual one, and "45" means the number of particion.

@Fran-KOU ➜ ~/proyecto $ mkdir -p /tmp/prueba/sub1 /temp/prueba/sub2
mkdir: cannot create directory ‘/temp’: Permission denied
# When i tried to execute the command, it shows that i dont have enough permissions.

@Fran-KOU ➜ ~/proyecto $ sudo mkdir -p /tmp/prueba/sub1 /temp/prueba/sub2
# Then i use the "sudo" command to execute as a superuser

@Fran-KOU ➜ ~/proyecto $ man mkdir -p /tmp/prueba/sub1 /temp/prueba/sub2
# Another option is using the command "man" that shows the manual to create a directory.

@Fran-KOU ➜ ~/proyecto $ stat /tmp/prueba
  File: /tmp/prueba
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 8,17    Inode: 655371      Links: 3
Access: (0756/drwxr-xrw-)  Uid: ( 1000/codespace)   Gid: ( 1000/codespace)
Access: 2026-04-06 12:53:26.168751322 +0000
Modify: 2026-04-06 12:53:26.169751322 +0000
Change: 2026-04-06 12:53:26.169751322 +0000
 Birth: 2026-04-06 12:53:26.168751322 +0000
# Same explication as the previous directory, but here we have 3 hardlinks and now the cd is a physical one.

@Fran-KOU ➜ ~/proyecto $ pwd
/home/codespace/proyecto
# Print the actual directory

@Fran-KOU ➜ ~/proyecto $ whoami
codespace
# Shows who i am.

@Fran-KOU ➜ ~/proyecto $ ls
# Just list

@Fran-KOU ➜ ~/proyecto $ ls -l
total 0
# List the actual directory

@Fran-KOU ➜ ~/proyecto $ ls -la
total 12
drwxr-xr-x 2 codespace codespace 4096 Apr  6 12:35 .
drwxr-x--- 1 codespace codespace 4096 Apr  6 12:56 ..
# List all the files, even the hidden ones

@Fran-KOU ➜ ~/proyecto $ ls -lh
total 0
# List the files in human readable text

@Fran-KOU ➜ ~/proyecto $ ls -lt
total 0
# List the files by date.

@Fran-KOU ➜ ~/proyecto $ ls /etc | head -20
ODBCDataSources
PackageKit
X11
adduser.conf
alternatives
apache2
apparmor.d
apt
bash.bashrc
bash_completion
bash_completion.d
bindresvport.blacklist
binfmt.d
ca-certificates
ca-certificates.conf
cloud
credstore
credstore.encrypted
cron.d
cron.daily
# It lists all the files and directories found within the system configuration directory /etc, 
# and since it is piped (|) with head -20, the final result is limited to showing only the first 20 lines of that list. 

@Fran-KOU ➜ ~/proyecto $ ls /dev | head -20
autofs
bsg
btrfs-control
core
cpu_dma_latency
cuse
dma_heap
dri
ecryptfs
fb0
fd
full
fuse
hpet
hwrng
input
kmsg
kvm
loop-control
loop0
# Displays the first 20 device files present in the system /dev directory

@Fran-KOU ➜ ~/proyecto $ ls -la
total 12
drwxr-xr-x 2 codespace codespace 4096 Apr  6 12:35 .
drwxr-x--- 1 codespace codespace 4096 Apr  6 12:56 ..
# Display the name. date. size, owner group, owne user, links number and type and permissions

