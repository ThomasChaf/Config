complete -c whaton -a "staging staging-analysis staging-analysis2 staging-analysis3"

function whaton
    if test $argv[1]
        set __aws_env $argv[1]
    else
        set __aws_env staging
    end

    aws elasticbeanstalk describe-environments \
        --environment-name=$__aws_env \
        --query='Environments[0].VersionLabel' \
        --output=text \
        --region=eu-west-3 \
        --no-cli-pager
end
