set _glyph \u2198
set _flag "!"

function _git_branch_name
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end

function fish_prompt
    set -l blue (set_color -o blue)
    set -l cyan (set_color -o cyan)
    set -l green (set_color -o green)
    set -l magenta (set_color -o magenta)
    set -l normal (set_color normal)
    set -l red (set_color -o red)
    set -l white (set_color -o white)
    set -l yellow (set_color -o yellow)
    
    set -l cwd $cyan(basename (prompt_pwd))
    set -l last_status $status
    set -l uid (id -u $USER)

    # Display current path
    echo -n -s $cyan "$cwd" $green

    # Show git branch and dirty state
    if [ (_git_branch_name) ]
        set -l git_branch (_git_branch_name)

        if [ (_git_is_dirty) ]
            echo -n -s " $blue| $normal$git_branch $red$_flag" $normal
        else
            echo -n -s " $blue| $normal$git_branch" $normal
        end
    end

    # Show glyph
    if test $last_status -ne 0
        echo -n -s $red " $_glyph " $normal
    else
        echo -n -s $white " $_glyph " $normal
    end
end
