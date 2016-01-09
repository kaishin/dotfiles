set FISH $HOME/.config/fish
. $FISH/aliases.fish
. $FISH/colors.fish

if test -d $FISH/osx
  . $FISH/osx/aliases.fish
  set -x PATH /usr/X11/bin $PATH
  status --is-interactive; and . (swiftenv init -|psub)
end

if test -d $FISH/server
  . $FISH/server/aliases.fish
end

set PATH $HOME/.node/bin $PATH
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH

set EDITOR '/usr/bin/vim'
