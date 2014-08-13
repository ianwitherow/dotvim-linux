#!/bin/bash
# Init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#....
# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Creating symlinks"

PWD=`pwd`

#Remove existing .vimrc if it exists
rm -f $PWD/../.vimrc
rm -f /root/.vimrc

#Make symlink in current home directory
ln -s $PWD/.vimrc $PWD/../.vimrc

#Make symlink in root's home directory
ln -s $PWD/.vimrc /root/.vimrc

#Make symlink to .vim folder in root's home directory
rm -r /root/.vim
ln -s $PWD /root/.vim
