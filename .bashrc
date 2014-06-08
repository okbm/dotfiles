# setting
export LANG=ja_JP.utf8
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups
export HISTIGNORE=ll:ls:cd:la:history

# ls
#export TERM=xterm-color
export LSCOLORS=gxfxcxdxbxegedabagacad
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
