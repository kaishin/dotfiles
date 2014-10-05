set _glyph \u27E9
set _flag \u2691

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
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
            echo -n -s " $white($normal$git_branch$white) " $red "$_flag" $normal
        else
            echo -n -s " $white($normal$git_branch$white)" $normal
        end
    end

    # Show glyph
    if test $last_status -ne 0
        echo -n -s $red " $_glyph "  $normal
    else
        echo -n -s $white " $_glyph " $normal
    end
end
