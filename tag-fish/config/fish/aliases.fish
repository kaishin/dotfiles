alias ... "cd ../.."
alias dockcont "docker container"
alias dockcomp "docker-compose"
alias remove-local-branches "git branch -vv | grep ': gone]' | awk '{ print \$1 }' | xargs git branch -D"
