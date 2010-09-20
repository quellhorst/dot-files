######################################################################
#		      mako's zshrc file, v0.1
#
# 
######################################################################

# next lets set some enviromental/shell pref stuff up
# setopt NOHUP
#setopt NOTIFY
#setopt NO_FLOW_CONTROL
setopt APPEND_HISTORY
# setopt AUTO_LIST		# these two should be turned off
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME		# tries to resume command of same name
unsetopt BG_NICE		# do NOT nice bg commands
setopt CORRECT			# command CORRECTION
setopt EXTENDED_HISTORY		# puts timestamps in the history
# setopt HASH_CMDS		# turns on hashing
setopt HIST_ALLOW_CLOBBER
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt ALL_EXPORT

setopt MENUCOMPLETE
# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

GOROOT=$HOME/go
GOOS=darwin
GOARCH=amd64

IRCSERVER=irc.freenode.net

PATH="/Users/quellhorst/Developer/bin:${HOME}/bin:$PATH"
TZ="America/Chicago"
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"
PAGER='less'
EDITOR='vim'
    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"

#setopt prompt_subst
#PROMPT='
#%~ %{$fg_bold[black]%}$(vcprompt)
#→ %{$reset_color%}'
setopt prompt_subst
PROMPT='[$PR_MAGENTA%n$PR_NO_COLOR@$PR_GREEN%m$PR_NO_COLOR:$PR_RED%~$PR_NO_COLOR]%(!.#.$) '
RPROMPT='$PR_NO_COLOR($PR_MAGENTA%D{%m-%d %H:%M}$PR_NO_COLOR) $PR_GREEN$(vcprompt) $PR_NO_COLOR'
#PS1="[$PR_MAGENTA%n$PR_NO_COLOR@$PR_GREEN%U%m%u$PR_NO_COLOR:$PR_RED%2c$PR_NO_COLOR]%(!.#.$) "
#RPS1="$PR_GREEN$(vcprompt)"
#RPS1="$PR_MAGENTA(%D{%m-%d %H:%M}) $PR_NO_COLOR"
#LANGUAGE=
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C
DISPLAY=:0

if [ $SSH_TTY ]; then
  MUTT_EDITOR=vim
else
  MUTT_EDITOR=emacsclient.emacs-snapshot
fi

unsetopt ALL_EXPORT
# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------
alias showdesk="defaults write com.apple.finder CreateDesktop -bool true;killall Finder"
alias hidedesk="defaults write com.apple.finder CreateDesktop -bool false;killall Finder"
alias c="cd"
alias h="history"

alias duffman="cd ~/Projects/duffman/"
alias easystreet="cd ~/Projects/easystreet"

alias home="cd ~"
alias desk="cd ~/Desktop/"
alias proj="cd ~/Projects/"
alias docs="cd ~/Documents/"
alias down="cd ~/Downloads/"

alias ll='ls -alh'
alias ls='ls -G '

# Rails aliases
alias spec="spec -cf specdoc"
alias sc="script/console"
alias ss="script/server"
alias ssd="script/server --debugger"
alias sg="script/generate"
alias spi="script/plugin install"
alias dbr="rake db:reset"
alias dbm="rake db:migrate"
alias fl="rake db:fixtures:load"

# Git aliases
alias gpr="git pull --rebase"
alias g="git status"
alias gs="git status"
alias gcm="git commit -m"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias ga="git add"
alias gb="git branch"
alias gd="git diff"
alias gp="git push"
alias gco="git checkout"
alias gpretty="git log --pretty=oneline"
alias gtree="git filter-branch --tree-filter" 
# run with something like 'rm -rf password.txt' to remove
# a file from all git history

#alias ruby19="export PATH=/opt/ruby19/bin:$PATH"

alias browser="open -a firefox "

#alias mysqladmin='/usr/local/mysql-5.1.37-osx10.5-x86_64/bin/mysqladmin5'
#alias mysql_start='sudo /opt/local/bin/mysqld_safe5 &'
#alias mysql_stop='/opt/local/bin/mysqladmin5 -u root -p shutdown'
#alias mysql_start2='sudo /opt/local/share/mysql5/mysql/mysql.server start'
#alias mysql_stop2='sudo /opt/local/share/mysql5/mysql/mysql.server stop'
#alias mysql_test='mysqladmin5 -u root -p ping'


alias slrn="slrn -n"
alias bx="BitchX"
alias man='LC_ALL=C LANG=C man'
alias f=finger
alias offlineimap-tty='offlineimap -u TTY.TTYUI'
alias hnb-partecs='hnb $HOME/partecs/partecs-hnb.xml'
alias rest2html-css='rst2html --embed-stylesheet --stylesheet-path=/usr/share/python-docutils/s5_html/themes/default/print.css'
alias dmesg="sudo dmesg"
#if [[ $HOSTNAME == "kamna" ]] {
#	alias emacs='emacs -l ~/.emacs.kamna'
#}	

# alias	=clear
stty erase ^H &>/dev/null
bindkey "^[[3~" delete-char
#chpwd() {
#     [[ -t 1 ]] || return
#     case $TERM in
#     sun-cmd) print -Pn "\e]l%~\e\\"
#     ;;
#    *xterm*|screen|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
#    ;;
#    esac
#}

#chpwd

autoload -U compinit
compinit
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
bindkey -e

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
# Completion Styles
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions
#
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}') 
# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

source ~/.cinderella.profile
