set FISH $HOME/.config/fish
. $FISH/aliases.fish
. $FISH/colors.fish

if test -d $FISH/macos
  set -gx PNPM_HOME $HOME/Library/pnpm

  . $FISH/macos/aliases.fish
  fish_add_path /opt/homebrew/bin
  fish_add_path /opt/homebrew/sbin
  fish_add_path /opt/homebrew/Cellar
  fish_add_path $HOME/Library/pnpm
  fish_add_path $HOME/.local/bin

  if test -d $HOME/Library/Android
    fish_add_path $HOME/Library/Android/sdk/platform-tools
  end

  set EDITOR /opt/homebrew/bin/nvim
end

if test -d $FISH/linux
  . $FISH/linux/aliases.fish
end

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -g fish_color_autosuggestion 585858

mise activate fish | source

fundle plugin 'edc/bass'
fundle plugin 'danhper/fish-ssh-agent'
fundle init

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
