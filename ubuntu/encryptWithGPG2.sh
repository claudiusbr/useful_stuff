#!/bin/bash

# This script will turn a directory into a tar ball
# then encrypt it with gpg2 and ask you for a password
# for it
if [ -e $1 ]; then
  tar czf "$1"'.tar.gz' $1 && gpg2 -c "$1"'.tar.gz' && rm -rf $1 && rm "$1"'.tar.gz'
else
  echo "You must specify a valid directory as your argument" 1>&2
fi
