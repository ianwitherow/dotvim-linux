echo "Creating symlinks"

PWD=`pwd`

#Remove existing .vimrc if it exists
rm -f $PWD/../.vimrc

#Make symlink in current home directory
ln -s $PWD/.vimrc $PWD/../.vimrc
