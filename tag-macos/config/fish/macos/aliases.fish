alias certs "security find-identity -v -p codesigning"
alias dns-flush "sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo \"DNS has been flushed\""
alias finder "open ."
alias osxinfo "sw_vers"
alias vim "nvim"
alias xcode "open -a 'Xcode' ."
alias xcode-b "open -a 'Xcode-beta' ."
alias ports "lsof -nP +c 15 | grep LISTEN"

