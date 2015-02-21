set _glyph \u27E9

function fish_prompt
    set -l yellow (set_color -o yellow)
    set -l normal (set_color normal)

    set -l cwd $yellow(basename (prompt_pwd))
    echo -n "$cwd $_glyph" $normal
end
