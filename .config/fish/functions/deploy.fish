function deploy
    print_purple "rm -rf public/static"
    rm -rf public/static
    print_purple "cp -r ~W/Dashboard/build/static public"
    cp -r $WORK_PWD/Dashboard/build/static public
    print_purple "cp ~W/Dashboard/build/index.html app/views/react_dashboard/base/index.html.erb"
    cp $WORK_PWD/Dashboard/build/index.html app/views/react_dashboard/base/index.html.erb

    if read_confirm "Do you want to amend?"
        am
        pushf
    else
        print_purple "git add ."
        git add .
        print_purple "git commit"
        git commit
        push
    end

    print_purple "cap staging deploy --trace"
    cap staging deploy --trace
    notification "Deploy completed"
end