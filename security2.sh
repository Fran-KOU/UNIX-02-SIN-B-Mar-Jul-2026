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