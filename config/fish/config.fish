set FISH $HOME/.config/fish
. $FISH/aliases.fish

set -x PATH /usr/X11/bin $PATH
set -x PATH /usr/local/git/bin $PATH
set -x PATH /usr/local/heroku/bin $PATH
set -x PATH /usr/bin $PATH
set -x PATH /bin $PATH
set -x PATH /usr/sbin $PATH
set -x PATH /sbin $PATH
set -x PATH /usr/local/bin $PATH

set -x EDITOR /usr/local/bin/mvim
set -x VISUAL /usr/local/bin/mvim

rvm use default >/dev/null
