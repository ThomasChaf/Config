function yb
    print_purple "yarn build"
    git rev-parse --short HEAD
    yarn install
    yarn build
    notification "Build completed"
end
