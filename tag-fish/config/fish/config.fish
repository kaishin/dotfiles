set FISH $HOME/.config/fish
. $FISH/aliases.fish
. $FISH/colors.fish

if test -d $FISH/osx
  . $FISH/osx/aliases.fish
  status --is-interactive; and . (swiftenv init -|psub)
  set -x GOPATH $HOME/.golang
  set -x GOROOT /usr/local/opt/go/libexec
  set PATH $GOPATH/bin $GOROOT/bin $PATH
  set PATH $HOME/.node/bin $PATH
  set PATH $HOME/.rbenv/shims $PATH
  set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"
end

if test -d $FISH/server
  . $FISH/server/aliases.fish
  fundle plugin 'danhper/fish-ssh-agent'
  set -l linuxbrew_bin_path "/home/linuxbrew/.linuxbrew/bin"
  set -l linuxbrew_sbin_path "/home/linuxbrew/.linuxbrew/sbin"
  set -l linuxbrew_manpath "/home/linuxbrew/.linuxbrew/share/man"
  set -l linuxbrew_infopath "/home/linuxbrew/.linuxbrew/share/info"

  contains -- $linuxbrew_bin_path $PATH
    or set -gx PATH $linuxbrew_bin_path $PATH

  contains -- $linuxbrew_sbin_path $PATH
    or set -gx PATH $linuxbrew_sbin_path $PATH

  contains -- $linuxbrew_manpath $MANPATH
    or set -gx MANPATH $linuxbrew_manpath $MANPATH

  contains -- $linuxbrew_infopath $INFOPATH
    or set -gx INFOPATH $linuxbrew_infopath $INFOPATH
    
  set PATH $HOME/swift $PATH
end

set EDITOR '/usr/bin/vim'
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

fundle plugin 'edc/bass'
fundle init
