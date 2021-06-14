function deploy
    cm_deploy
    print_purple "cap staging deploy --trace"
    cap staging deploy --trace
    notification "Deploy completed"
end