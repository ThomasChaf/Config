function deploy
    cm_deploy
    pushf
    print_purple "cap staging deploy --trace"
    cap staging deploy --trace
    notification "Deploy completed"
end