#!/bin/bash

# This script will turn a file or directory into a tar ball, send it down the
# pipe to gpg2, which will then ask you for a passphrase for it and encrypt it
if [ -e $1 ]; then
  tar czf - $1 | gpg2 -c --output "$1.gpg" - 
else
  echo "You must specify a valid directory as your argument" 1>&2
fi
