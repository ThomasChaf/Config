function fish_prompt
    if not set -q __git_branch
        set __git_branch ""(git branch ^/dev/null | grep \* | sed 's/* //')""
    end

    echo -n '-> '
    set_color $fish_color_cwd
    echo -n (pwd | sed -e "s|$WORK_PWD|~W|")

    if [ $__git_branch ]
        set_color red
        echo -n " [branch:"
        echo -n $__git_branch
        echo -n "]"
    end

    set_color normal
    echo -n ' > '
end
