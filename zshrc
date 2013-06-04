# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kaishin"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
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
