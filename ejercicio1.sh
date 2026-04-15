echo '#!/bin/sh' > hola.sh

# Create a brand new file named "hola.sh" and inside the file is writen '#!/bin/sh'

echo 'echo "Hola desde mi primer script"' >> hola.sh

# Writes inside the already exist file the text "Hola desde mi primer script"

cat hola.sh

# Print the content of the file
# @Fran-KOU ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (boot_exploration) $ cat hola.sh
# #!/bin/sh
# echo "Hola desde mi primer script"

./hola.sh

# Doesnt work because we dont have enough permissions

ls -l hola.sh

# Shows the permissions
# -rw-rw-rw- 1 codespace codespace 45 Apr 15 13:02 hola.sh

chmod +x hola.sh

# Otorgate permissions

ls -l hola.sh

# We consulted the new permissions
# -rwxrwxrwx 1 codespace codespace 45 Apr 15 13:02 hola.sh

./hola.sh

# Print the content
# Hola desde mi primer script

# Does this commands need "sudo"?

ls /etc

# No, it doesnt need, read is public

touch /etc/prueba.txt

# It needs, ./etc belongs to the root

mkdir ~/mi_carpeta

# Doesnt need, its our house

apt install cowsay

# It needs, install packages touch directories of the system.