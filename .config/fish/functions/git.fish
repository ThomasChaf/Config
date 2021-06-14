function __git_remote_list
    git branch -a --no-color | tr -d ' ' | sed 's/remotes\/origin\///g' | sed 's/*//g' | sort -u
end

function am --description "Git commit --amend"
    print_purple "git add ."
    git add .
    print_purple "git commit --amend"
    git commit --amend
end

function cm --description "Git commit"
    print_purple "git add ."
    git add .
    print_purple "git commit"
    git commit
end

function rst --description "Git reset"
    print_purple "git restore --staged ."
    git restore --staged .
    print_purple "git checkout -- ."
    git checkout -- .
end

complete -c rst -x -a "(git status | grep "modified" | sed -e 's/[[:space:]]//g' | sed -e 's/modified://g')"

function rb --description "Git rebase"
    if test $argv[1]
        pull $argv[1]
        print_purple "git rebase $argv[1]"
        git rebase $argv[1]
    end
end

complete -c rb -x -a "(__git_remote_list)"

function ck --description "Git pull & checkout"
    if [ $argv[1] = '-b' ]
        print_purple "git checkout -b $argv[2]"
        git checkout -b $argv[2]
    else if test $argv[1]
        print_purple "git checkout $argv[1]"
        git checkout $argv[1]
        set __git_pull_branch $argv[1]
        pull
    end
end

complete -c ck -x -a "(__git_remote_list)"

function pull --description "Git pull --rebase"
    if not set -q __git_branch
        set __git_branch ""(git branch ^/dev/null | grep \* | sed 's/* //')""
    end

    if not set -q __git_remote
        set __git_remote ""(git remote show ^/dev/null)""
    end

    if test $argv[1]
        print_purple "git checkout $argv[1]"
        git checkout $argv[1]
        set __git_pull_branch $argv[1]
    else
        set __git_pull_branch $__git_branch
    end


    if [ $__git_pull_branch ]
        if test (git ls-remote origin $__git_pull_branch)
            print_purple "git pull --rebase $__git_remote $__git_pull_branch"
            git pull --rebase $__git_remote $__git_pull_branch
        else
            print_purple "No remote branch $__git_branch"
            set_color normal
        end
    end

    if test $argv[1]
        print_purple "git checkout $__git_branch"
        git checkout $__git_branch
    end
end

function push --description "Git push"
    if not set -q __git_branch
        set __git_branch ""(git branch ^/dev/null | grep \* | sed 's/* //')""
    end

    if not set -q __git_remote
        set __git_remote ""(git remote show ^/dev/null)""
    end

    if [ $__git_branch ]
        print_purple "git push $__git_remote $__git_branch"
        git push origin $__git_branch
    end
end

function pushf --description "Git push -f"
    if not set -q __git_branch
        set __git_branch ""(git branch ^/dev/null | grep \* | sed 's/* //')""
    end

    if not set -q __git_remote
        set __git_remote ""(git remote show ^/dev/null)""
    end

    if [ $__git_branch ]
        print_purple "git push -f $__git_remote $__git_branch"
        git push origin $__git_branch -f
    end
end

function rbi --description "Git rebase interactif"
    print_purple "git rebase -i HEAD~$argv[1]"
    git rebase -i HEAD~$argv[1]
end

function lg --description "Git log --oneline"
    print_purple "git log $argv"
    git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' $argv
end