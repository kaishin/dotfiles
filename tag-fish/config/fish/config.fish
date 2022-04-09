set FISH $HOME/.config/fish
. $FISH/aliases.fish
. $FISH/colors.fish

if test -d $FISH/macos
  set -gx PNPM_HOME $HOME/Library/pnpm
  
  . $FISH/macos/aliases.fish
  fish_add_path /opt/homebrew/bin
  fish_add_path /opt/homebrew/sbin
  fish_add_path $PNPM_HOME

  set EDITOR '/opt/homebrew/bin/nvim'
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
