export LANG=ja_JP.utf8
export LSCOLORS=gxfxcxdxbxegedabagacad

alias la="ls -A"
alias ll='ls -lG'
alias ls='ls -G'

export PS1="\u@\W\\$ "

cdls ()
{
        \cd "$@" && ls
}
alias cd="cdls"
