#!/bin/bash

# create a link to /dev/shm/{username}tmp in your home directory. I use this to
# work on files which are encrypted on disk, in order to make sure that their
# plain-text versions do not persist.  If your home folder is already
# encrypted, even better -- this adds a 'second layer' of 'protection'.  since
# this uses `mount` with options, you must be a sudoer to execute it
if [ -e "/dev/shm" ]; then
  if [ ! -e "/dev/shm/$USER"'tmp' ]; then
    mkdir "/dev/shm/$USER"'tmp'
  fi

  if [ ! -e "$HOME/etc" ]; then
    mkdir "$HOME/etc"
  elif [ -d "$HOME/etc/tmp" ]; then
    rm -rf "$HOME/etc/tmp"
  fi

  ln -sTf "/dev/shm/$USER"'tmp' "$HOME/etc/tmp"
else
  echo "This script needs the '/dev/shm' device to work, but it was not found on this machine" 1>&2
fi
