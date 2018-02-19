# setting
export LANG=ja_JP.UTF-8
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups
export HISTIGNORE=ll:ls:cd:la:history

# ls
export LS_COLORS="di=00;34:ln=00;35:so=00;32:pi=01;33:ex=00;31:bd=00;34"
alias la="ls -AF --color=auto"
alias ll='ls -lGF --color=auto'
alias ls='ls -GF --color=auto'
alias vi='vim'

# cd
shopt -s cdspell
shopt -u histappend
#export PS1="\u@\W\\$ "
export PS1="\e[0;31m[\e[0;32m\u@\w\e[0;31m]\$\e[0m "
set show-all-if-ambiguous on

cdls ()
{
        \cd "$@" && ls
}
alias cd="cdls"

source .tmuxinator.bash

# other
alias tail_app='tail -F /var/log/apache2/access.log'
alias tail_err='tail -F /var/log/apache2/error.log'

# item2の設定でTab titleのチェック全部外す
function title {
    echo -ne "\033]0;"$*"\007"
}

# command
alias fp='find . -type f -name "*.php" | xargs grep --color -i '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias restart='sudo /etc/init.d/apache2 restart'

# git
if [ -f ~/.git-completion.bash ] ; then
    source ~/.git-completion.bash
    source ~/.git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    PS1="${PS1}[\$(__git_ps1 \"%s\")]\\"\n"$ "
fi

if [ -f $HOME/local/python-3.4/bin ] ; then
    export PATH=$HOME/local/python-3.4/bin:$PATH
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
