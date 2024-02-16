set FISH $HOME/.config/fish
. $FISH/aliases.fish
. $FISH/colors.fish

if test -d $FISH/macos
  . $FISH/macos/aliases.fish
  fish_add_path /opt/homebrew/bin
  fish_add_path /opt/homebrew/sbin
  fish_add_path /opt/homebrew/Cellar
  fish_add_path $PNPM_HOME
  fish_add_path $HOME/.asdf/installs/rust/1.76.0/bin

  set EDITOR /opt/homebrew/bin/nvim
  source /opt/homebrew/opt/asdf/libexec/asdf.fish

  # pnpm
  set -gx PNPM_HOME "~/Library/pnpm"
  set -gx PATH "$PNPM_HOME" $PATH
  # pnpm end
end

if test -d $FISH/linux
  . $FISH/linux/aliases.fish
  source $HOME/.asdf/asdf.fish
end

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

fundle plugin 'edc/bass'
fundle plugin 'danhper/fish-ssh-agent'
fundle init
