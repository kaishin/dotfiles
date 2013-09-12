ZSH=$HOME/.oh-my-zsh
ZSH_THEME="kaishin"

# Aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

COMPLETION_WAITING_DOTS="true"

# List of default plugins: https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
plugins=(git brew gem git-extras bundler Forklift bower npm osx evm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

export PATH=/usr/X11/bin:/usr/local/git/bin:/usr/local/heroku/bin:/usr/local/share/python:$PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/bin:$PATH

## virtualenvwrapper configs
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
#virtualenv shell script
source /usr/local/share/python/virtualenvwrapper.sh

# Use default Ruby in each new session
rvm use >/dev/null

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Set default editor
export EDITOR=/usr/local/bin/mvim
export VISUAL=/usr/local/bin/mvim
