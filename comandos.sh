sudo apt update # Update the local list of packages and the versions consulting the repositories.

sudo apt upgrade # Download and install the most recent versions of all the packages that is already installed.

sudo apt install parted # Download and install a package directly from the oificial repositories.

sudo parted -l && echo -e "\n---\n" && lsblk -f && echo e # lists the partition tables of all block devices, displays a detailed device tree with file system information, 
# inserts line breaks and a visual separator, prints the letter "e" on the screen.

[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS" # 