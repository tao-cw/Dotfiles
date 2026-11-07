function fish_prompt
    set -g __fish_git_prompt_showdirtystate yes
    set_color --bold blue
    printf '%s%s\nλ ' (prompt_pwd -d 0) (fish_git_prompt)
    set_color normal
end
