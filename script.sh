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