El sistema que vamos a construir tiene tres componentes:

1. **Kernel Linux** - el núcleo del sistena operativo
2. **BusyBox** - proporciona las utilidades básicas de Unix (ls, pws, vi, etc.) en un solo binario
3. **Syslinux** - el bootloader que carga todo al arrancar

sudo apt update
sudo apt upgrade
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86 

**¿Para qué sirve cada paquete?**

- 'gcc', 'make' - compilación del kernel y BusyBox
- 'libncurses-dev' - menús interactivos de configuración ('menuconfig')
- 'flex', 'bison', 'bs' - requeridos por el proceso de build del kernel
- 'cpio' - para crear el initramfs
- libelf-dev', 'libssl-dev' - dependencias del kernel
- 'syslinux' - el bootloader
- 'dosfstools' - para crear el filesystem FAT
- 'qemu-system-x86' - para probar la imagen sin necesidad de hardware real

git clone --depth 1 https://github.com/torvalds/linux.git 

cd linux

make menuconfig

make-j 2

sudo mkdir /boot-files

sudo cp arch/x86/boot/bzImage /boot-files/

cd ..

git clone --depth 1 https://git.busybox.net/busybox

cd busybox

make menuconfig

make -j 2

sudo mkdir /boot-files/initramfs

sudo make CONFIG_PREFIX=/boot-files/initramfs install

busybox > .config > CONFIG_TC=n

make -j 2

cd /boot-files/initramfs

sudo vi init

sudo rm linuxrc

sudo chmod +x init

sudo sed -i 's/CONFIG_STATIC=.*/CONFIG_STATIC=y/' .config

sudo find . | cpio -o -H newc > ../init.cpio cd ..

sudo sh -c ´find . | cpio -o H newc > ../ init.cpio'