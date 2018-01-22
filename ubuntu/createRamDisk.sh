#!/bin/bash

# This script mounts tmpfs in a directory in your home folder.
# I use this to work on files which are encrypted on disk, in
# order to make sure that their plain-text versions do not
# persist. If your home folder is already encrypted, even
# better -- this adds a 'second layer' of 'protection'.
# since this uses `mount` with options, you must be a
# sudoer to execute it
if [ ! -e "$HOME/etc/tmp" ]; then
  mkdir -p "$HOME/etc/tmp"
fi

mount -t tmpfs -o size=256m tmpfs '$HOME/etc/tmp'
