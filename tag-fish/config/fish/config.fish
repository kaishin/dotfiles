set FISH $HOME/.config/fish
. $FISH/aliases.fish
. $FISH/colors.fish

if test -d $FISH/osx
  . $FISH/osx/aliases.fish
  status --is-interactive; and . (swiftenv init -|psub)
  set -x GOPATH $HOME/.golang
  set -x GOROOT /usr/local/opt/go/libexec
  set PATH $GOPATH/bin $GOROOT/bin $PATH
end

if test -d $FISH/server
  . $FISH/server/aliases.fish
end

set PATH $HOME/.node/bin $PATH
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH

set EDITOR '/usr/bin/vim'
