function deploy
    if not set -q __git_branch
        set __git_branch (git branch --show-current 2>/dev/null)
    end

    if not test $argv[1]
        echo "Please provide an environment (staging, production)"
    else
        gh workflow run deploy.yml --ref=$__git_branch -f environment=$argv[1]
    end
end
