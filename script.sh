ls -a /

#ls is the commmand, the "-a" is the option and the "/" is the argument.

#OR

ls --all /

#ls -all is the large version and has the same function.

ls -a
ls -h
ls -l

ls -l -a -h

ls -l -ah

# Executing each command give us different information, but if we write all the previous commands in one line it shows the information just with one line.

mkdir -- -rf

# To create a diectory.

rm -rf

# Doesn´t work because the codespace interpet the "-rf" section as an option

rmdir -- -rf

# With the "--" it says to the complier that the next command is an attribute. It remove the directory previously created.

git clone --depth 1 https://github.com/torvalds/linux.git

# depth is an option that takes the number as a value. Here the value is one and brings one commit.

ls --help

# Shows a summarized manual

man ls

# Shows the entire manual

-- depth

# Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless --no-single-branch is given to fetch the
# histories near the tips of all branches. If you want to clone submodules shallowly, also pass --shallow-submodules.

chmod +x script.sh 

# Everyone can execute

chmod u+x script.sh

# Only the owner can execue

chmod o-r script.sh

# Remove reading to "others"

chmod u+rw,go-rwx privado

# Only the owner can read/write, no one else can

sudo echo "hola" > /etc/archivo_protegido

# The command doesnt work because we doesnt have the enough permissions and the "sudo" only works with the first order "echo".

echo "hola" | sudo tee /etc/archivo_protegido > /dev/null

# Generate a text ("hola"), and uses the "|" as the entrance of the next command, tee is a tool that read and write in two different places,
# on the screen and on the specific file. "/dev/null" acts as a black hole

echo "hola" | sudo tee /etc/archivo_protegido

# Unlike the previous command, this command actually shows the message "hola"