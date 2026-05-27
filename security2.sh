# Instead of the name "root" i have the name "vscode"

# View the current main group
id

# Only the name of the main group
id -gn

# Creates a file and view the inherit group

touch ~/test_grupo_heredado.txt

ls -la ~/test_grupo_heredado.txt # The group is the main group of the user


# View the current group

id -gn

echo "Grupo actual: $(id -gn)"

# Creat a file before newgrp

touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt

# Change to "desarrolladores" group

newgrp desarrolladores

# Verify that the active group changed

id -gn

echo "Nuevo grupo activo: $(id -gn)"

# Create a file inside subshell

touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
# The group now is "desarrolladores"

# Create a directory

mkdir -p ~/proyecto_dev/src

# proyecto_dev/ have the group 'desarrolladores'

# Exit from subshell from newgrp

exit

# Verify that we came back to the main group

id -gn

echo "Grupo restaurado: $(id -gn)"

# Compare both files

ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt

# newgrp creates a subshell

echo "PID del shell actual: $$"

newgrp desarrolladores

echo "PID dentro de newgrp: $$" # The PID is different

# Create a group with a password

groupadd grupo_restringido

gpasswd grupo_restringido