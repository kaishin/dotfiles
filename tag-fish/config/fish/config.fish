set FISH $HOME/.config/fish
. $FISH/aliases.fish
. $FISH/colors.fish

if test -d $FISH/macos
  # pnpm
  set -gx PNPM_HOME $HOME/Library/pnpm
  # pnpm end

  . $FISH/macos/aliases.fish
  fish_add_path /opt/homebrew/bin
  fish_add_path /opt/homebrew/sbin
  fish_add_path /opt/homebrew/Cellar
  fish_add_path $HOME/Library/pnpm
  fish_add_path $HOME/.asdf/installs/rust/1.76.0/bin
  fish_add_path $HOME/.local/bin

  set EDITOR /opt/homebrew/bin/nvim
  source /opt/homebrew/opt/asdf/libexec/asdf.fish

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
