<<<<<<< HEAD
set -gx PATH /Users/thomaschaf/.rvm/gems/ruby-2.3.1/bin:/Users/thomaschaf/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

rvm default

set -gx MYSQL_PASSWORD ""
set -gx HAPPYDEMICS2_MYSQL_SOCKET "/tmp/mysql.sock"
set -gx WORK_PWD "/Users/thomaschaf/Documents/Workspace"
set -gx TOOLS_PWD "/Users/thomaschaf/.config/fish/tools"
set -gx DATABASE_URL 'mysql2://root:@127.0.0.1'

alias stb="yarn storybook"
alias ys="yarn start"
alias yt="jest --watch -u"
alias yi="yarn install"
alias work="cd $WORK_PWD"
=======
set fish_greeting

set -gx WORK_PWD /Users/thomaschaf/Documents/Workspace
set -gx TOOLS_PWD "/Users/thomaschaf/.config/fish/tools"
set -gx RUBY_YJIT_ENABLE 1

alias ys="yarn start"
alias yi="yarn install"
alias yd="yarn dev"

bind \cd exit

source "$HOME/.asdf/asdf.fish"
source "$HOME/.config/fish/functions/doc.fish"
source "$HOME/.config/fish/functions/d_test.fish"
>>>>>>> 70e3b65 (test)
