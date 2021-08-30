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
