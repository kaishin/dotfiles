function rvm --description='Ruby enVironment Manager'
  set --local env_file (mktemp -t rvm.fish.XXXXXXXXXX)
  bash -c 'source ~/.rvm/scripts/rvm; rvm "$@"; status=$?; env > "$0"; exit $status' $env_file $argv

  and eval (grep '^rvm\|^[^=]*PATH\|^GEM_HOME' $env_file | grep -v '_clr=' | sed '/^[^=]*PATH/y/:/ /; s/^/set -xg /; s/=/ /; s/$/ ;/; s/(//; s/)//')
  rm -f $env_file
end

function __handle_rvmrc_stuff --on-variable PWD
  if test "$rvm_project_rvmrc" != 0
    set -l cwd $PWD
    while true
      if contains $cwd "" $HOME "/"
        if test "$rvm_project_rvmrc_default" = 1
          rvm default 1>/dev/null 2>&1
        end
        break
      else
        if begin; test -s ".rvmrc"; or test -s ".ruby-version"; or test -s ".ruby-gemset"; end
          eval "rvm reload" > /dev/null
          break
        else
          set cwd (dirname "$cwd")
        end
      end
    end

    set -e cwd
  end
end
