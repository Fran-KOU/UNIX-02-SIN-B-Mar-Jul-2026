# View the actual main group
id

# Only the name of the main group
id -gn

# Creates a file and view the inherit group

touch ~/test_grupo_heredado.txt

ls -la ~/test_grupo_heredado.txt # The group is the main group of the user

