#!/usr/bin/env bash

set -x

# All this script does is create a directory, create a file
# within the directory, and then list the contents of the 
# directory.

mkdir mydirectory
touch mydirectory/myfile
ls -l mydirectory
set +x

bash -n blackhatbash2.sh

bash -x blackhatbash2.sh
# + set -x
# + mkdir mydirectory
# mkdir: cannot create directory ‘mydirectory’: El fichero ya existe
# + touch mydirectory/myfile
# + ls -l mydirectory
# total 0
# -rw-rw-rw- 1 root root 0 jun  1 13:21 myfile
# + set +x

./blackhatbash2.sh
# + mkdir mydirectory
# mkdir: cannot create directory ‘mydirectory’: El fichero ya existe
# + touch mydirectory/myfile
# + ls -l mydirectory
# total 0
# -rw-rw-rw- 1 root root 0 jun  1 13:22 myfile
# + set +x