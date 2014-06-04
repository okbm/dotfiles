export LANG=ja_JP.utf8
export LSCOLORS=gxfxcxdxbxegedabagacad
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups
export HISTIGNORE=ll:ls:cd:history

alias la="ls -A"
alias ll='ls -lG'
alias ls='ls -G'
alias tail_app='tail -F /var/log/apache2/access.log'
alias tail_err='tail -F /var/log/apache2/error.log'

export PS1="\u@\W\\$ "

cdls ()
{
        \cd "$@" && ls
}
alias cd="cdls"

# git
if [ -f ~/.git-completion.bash ] ; then
    source ~/.git-completion.bash-
    source ~/.git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=true
    PS1="${PS1}[\$(__git_ps1 \"%s\")]\\$ "
fi
