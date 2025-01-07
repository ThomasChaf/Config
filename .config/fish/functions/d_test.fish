function d_test --description "Test dashboard"
    set truncated_path (echo $argv[1] | sed 's|packages/dashboard/||')

    print_purple "yarn test:dashboard -u $truncated_path"

    yarn test:dashboard -u $truncated_path
end
