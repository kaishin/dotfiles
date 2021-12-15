set FISH $HOME/.config/fish
. $FISH/aliases.fish
. $FISH/colors.fish

if test -d $FISH/arm-mac
  . $FISH/arm-mac/aliases.fish
  set PATH /opt/homebrew/bin $PATH
  set PATH /opt/homebrew/sbin $PATH
  set EDITOR '/opt/homebrew/bin/nvim'
end

if test -d $FISH/osx
  . $FISH/osx/aliases.fish
  status --is-interactive; and . (swiftenv init -|psub)
  set -x GOPATH $HOME/.golang
  set -x GOROOT /usr/local/opt/go/libexec
  set PATH $GOPATH/bin $GOROOT/bin $PATH
  set PATH $HOME/.node/bin $PATH
  set PATH $HOME/.rbenv/shims $PATH
  set PATH $HOME/.cargo/bin $PATH
  set PATH /usr/local/sbin $PATH
  set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"
  set EDITOR '/usr/bin/vim'
end

if test -d $FISH/server
  . $FISH/server/aliases.fish
  set -gx PATH $HOME/.swift/usr/bin $PATH
  

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
end


set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

fundle plugin 'edc/bass'
fundle plugin 'danhper/fish-ssh-agent'
fundle init
