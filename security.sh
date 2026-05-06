id
# Display iformation about the current user

cat /etc/passwd | head -10
# Display the first 10 lines of the information about system users.

cat /etc/group | head -10
# Display the first 10 lines of information of the groups

groups
# Display the groups

groups $USER
# Displays the security groups that the user belongs to

id -u
# Display the ID of the user

id -g
# Display the main ID of the group

id -G
# Display all the ID groups

cat /etc/group | grep video
# Display the id of an specific group

mkdir ~/proyecto_unix/
# Creates a new folder on my main directory

ls -la ~/proyecto_unix/
# List the detailed content of the new folder

groupadd desarrolladores
# Create a simple group

groupadd -g 2000 operaciones
# Specific GID, system group (GID < 1000)

groupadd --system servicios_web

grep "desarrolladores\|operaciones\|servicios_web" /etc/group
# Verify that the groups has been created

# desarrolladores:x:1000:
# operaciones:x:2000:
# servicios_web:x:995:

groupadd --help
# View main options