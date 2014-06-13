# setting
export LANG=ja_JP.utf8
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups
export HISTIGNORE=ll:ls:cd:la:history

# ls
export LS_COLORS="di=00;34:ln=00;35:so=00;32:pi=01;33:ex=00;31:bd=00;34"
alias la="ls -AF --color=auto"
alias ll='ls -lGF --color=auto'
alias ls='ls -GF --color=auto'

# cd
shopt -s cdspell
shopt -u histappend
export PS1="\u@\W\\$ "
set show-all-if-ambiguous on

cdls ()
{
        \cd "$@" && ls
}
alias cd="cdls"

# git
if [ -f ~/.git-completion.bash ] ; then
    source ~/.git-completion.bash
    source ~/.git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    PS1="${PS1}[\$(__git_ps1 \"%s\")]\\$ "
fi

# other
alias tail_app='tail -F /var/log/apache2/access.log'
alias tail_err='tail -F /var/log/apache2/error.log'

# command
alias findphp="find . -type f -name "*.php" | xargs grep --color -i "
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
