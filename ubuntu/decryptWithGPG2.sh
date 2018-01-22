#!/bin/bash

# WARNING: input argument must be a 'filename.tar.gz.gpg'
#          for best results
# 
# This script will reverse the effects of the
# encryptWithGPG2.sh script: decrypt the thing
# then extract the files

if [ -f "$1" ]; then
  tarball=$(echo $1 | cut -d'.' -f1-3)
  gpg2 $1 && tar xzf $tarball && rm -f $1 $tarball
else
  echo "file $1 not found" 1>&2
fi
