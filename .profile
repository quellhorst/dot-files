# MacPorts Installer addition on 2009-07-12_at_23:49:21: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2009-07-12_at_23:49:21: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

alias duffman="cd ~/Projects/duffman/"
alias easystreet="cd ~/Projects/easystreet"

alias home="cd ~"
alias desk="cd ~/Desktop/"
alias proj="cd ~/Projects/"
alias docs="cd ~/Documents/"
alias down="cd ~/Downloads/"

# Rails aliases
alias sc="script/console"
alias ss="script/server"
alias ssd="script/server --debugger"
alias sg="script/generate"
alias spi="script/plugin install"
alias dbr="rake db:reset"
alias dbm="rake db:migrate"
alias fl="rake db:fixtures:load"

# Git aliases
alias gs="git status"
alias gcm="git commit -m"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias ga="git add"
alias gb="git branch"
alias gd="git diff"
alias gco="git checkout"

#alias ruby19="export PATH=/opt/ruby19/bin:$PATH"

alias mysqladmin='/opt/local/bin/mysqladmin5'
alias mysql_start='sudo /opt/local/bin/mysqld_safe5 &'
alias mysql_stop='/opt/local/bin/mysqladmin5 -u root -p shutdown'
alias mysql_start2='sudo /opt/local/share/mysql5/mysql/mysql.server start'
alias mysql_stop2='sudo /opt/local/share/mysql5/mysql/mysql.server stop'
alias mysql_test='mysqladmin5 -u root -p ping'

#alias apache_restart='sudo /usr/local/apache2/bin/apachectl restart'

PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH

# Git status
test -r /sw/bin/init.sh && . /sw/bin/init.sh

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\u:\[\033[31;40m\]\w\[\033[0;33m\]$(parse_git_branch)\[\e[0m\]$ '
