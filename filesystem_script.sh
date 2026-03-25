pwd # print working directory, imprime el directorio en el que me encuentro trabajando en este momento

cd / # Se usa para cambiar el directorio al principal "/"
ls -F # "ls" se usa para mostrar los archivos y carpetas del directorio, se usa "-F" para saber que tipo de archivo es cada uno que se ha encontrado
ls -i # En cambio, "-i" muestra el numero de inodo de cada archivo del directorio actuala


echo "Hola" > test.txt
stat test.txt
# File: test.txt
# Size: 5               Blocks: 8          IO Block: 4096   regular file
# Device: 0,45    Inode: 715077      Links: 1
# Access: (0644/-rw-r--r--)  Uid: ( 1000/codespace)   Gid: ( 1000/codespace)
# Access: 2026-03-25 13:40:10.798823053 +0000
# Modify: 2026-03-25 13:40:10.798823053 +0000
# Change: 2026-03-25 13:40:10.798823053 +0000
# Birth: 2026-03-25 13:40:10.798823053 +0000