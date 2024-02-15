set FISH $HOME/.config/fish
. $FISH/aliases.fish
. $FISH/colors.fish

if test -d $FISH/macos
  set -gx PNPM_HOME $HOME/Library/pnpm
  
  . $FISH/macos/aliases.fish
  fish_add_path /opt/homebrew/bin
  fish_add_path /opt/homebrew/sbin
  fish_add_path /opt/homebrew/Cellar
  fish_add_path $PNPM_HOME
  fish_add_path $HOME/.asdf/installs/rust/1.76.0/bin

  set EDITOR /opt/homebrew/bin/nvim
  source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

if test -d $FISH/linux
  . $FISH/linux/aliases.fish
  source ~/.asdf/asdf.fish
end

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

fundle plugin 'edc/bass'
fundle plugin 'danhper/fish-ssh-agent'
fundle init
