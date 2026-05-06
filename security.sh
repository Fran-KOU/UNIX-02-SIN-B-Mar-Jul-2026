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

grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs
# The groups that has the GID system minor to maximum of the user
# On ubuntu typically:
# SYS_GID_MIN = 100
# SYS_GYD_MAX = 999
# GID_MIN = 1 000
# GID_MAX = 60 000

# Create groups with "addgroup"
addgroup diseno

addgroup --gid 2100 marketing

addgroup --system cache_web

grep "diseno\|marketing\|cache_web" /etc/group
# Verify

usermod -aG desarrolladores $USER
# Change $USER to root

usermod -aG diseno $USER
# Change $USER to root as well

grep "desarrolladores\|diseno" /etc/group

adduser $USER marketing
# Add the uset to a group with adduser

id $USER

grep $USER /etc/group

# Create a temporal group

groupadd grupo_temporal

usermod -aG grupo_temporal root

id root

# Now the ERROR: usermod without -a

usermod -G desarrolladores root
# This erase all te secondary groups except of the group "desarrolladores"

id root