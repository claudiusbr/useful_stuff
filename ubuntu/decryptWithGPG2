#!/bin/bash

# This script will reverse the effects of the
# encryptWithGPG2.sh script: use gpg2 to decrypt the file and send it to stdout
# (in this case the pipeline), then extract the tar file contents into the
# current directory

if [ -f "$1" ]; then
  gpg2 -d $1 | tar xzf -
else
  echo "file $1 not found" 1>&2
fi
