export LANG=ja_JP.utf8
export LSCOLORS=gxfxcxdxbxegedabagacad

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
