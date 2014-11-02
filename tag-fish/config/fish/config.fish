set FISH $HOME/.config/fish
. $FISH/aliases.fish
. $FISH/colors.fish

if test -d $FISH/osx
  . $FISH/osx/aliases.fish
  set -x PATH /usr/X11/bin $PATH
end

set -x PATH /usr/bin $PATH
set -x PATH /bin $PATH
set -x PATH /usr/sbin $PATH
set -x PATH /sbin $PATH
set -x PATH /usr/local/bin $PATH

set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
