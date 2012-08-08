Install
-------

From your cloned directory:

    ./install.sh

This will create symlinks for all config files in your home directory. You can
safely run this file multiple times to update.

Track Dotfiles
-------------------------

One time:

    git remote add upstream git@github.com:kaishin/dotfiles.git
    git fetch upstream
    git checkout -b upstream upstream/master

Update
------

Each time you want to update:

    git checkout upstream
    git pull
    git checkout master
    git rebase upstream
