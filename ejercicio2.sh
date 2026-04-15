touch prueba.txt

# Creates an empty file.

chmod 600 prueba.txt

# Change the permissions to the file. 4: Lectura (Read) 2: Escritura (Write) 1: Ejecución (Execute)

ls -l prueba.txt

# List the permissions.
# -rw------- 1 codespace codespace 0 Apr 15 13:36 prueba.txt

chmod 755 prueba.txt

# Owner (7)$4 + 2 + 1 = 7$ read, write and execute (Total control).
# Group (5)$4 + 0 + 1 = 5$ read and execution (cant be changed).
# Others (5)$4 + 0 + 1 = 5$ read and execution (Anyone can use it).

ls -l prueba.txt

# List the new permissions

# -rwxr-xr-x 1 codespace codespace 0 Apr 15 13:36 prueba.txt