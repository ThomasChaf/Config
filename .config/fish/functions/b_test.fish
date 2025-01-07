function b_test --description "Test backend"
    print_purple "UPDATE_SNAPSHOTS=true bundle exec rspec $argv"

    UPDATE_SNAPSHOTS=true bundle exec rspec $argv
end
