function fish_prompt
    if not set -q __git_branch
        set __git_branch (git branch --show-current 2>/dev/null)
    end

    echo -n '-> '
    set_color $fish_color_cwd
    echo -n (pwd | sed -e "s|$WORK_PWD|~W|")

    if [ $__git_branch ]
        set_color red
        echo -n " ("
        echo -n $__git_branch
        echo -n ")"
    end

    set_color normal
    echo -n ' > '
end
