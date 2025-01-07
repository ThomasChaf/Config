function b_lint
    bundle exec erblint --lint-all -a
    bundle exec rubocop -A
end
