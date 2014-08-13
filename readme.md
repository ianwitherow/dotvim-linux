Installation
============

Clone this into your user home directory, not root's

```
git clone https://github.com/ianwitherow/dotvim-linux.git ~/.vim
```


Create symlinks
==============

As root, run

```
./install.sh
```

This will create symlinks for your user as well as root.

If you don't want to do any root stuff, you can set it up for the user account with

```
./install-user-only.sh
```

