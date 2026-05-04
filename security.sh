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