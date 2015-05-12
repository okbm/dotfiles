# 環境設定周り
export LANG=ja_JP.UTF-8
export EDITOR=/usr/bin/vim

export GEM_HOME=/usr/bin/gem
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/mysql/bin"
export PATH="$PATH:/usr/local/Cellar/"
export PYTHONDONTWRITEBYTECODE=1 #pythonでpycファイルを作らない

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# Vi ライクな操作が好みであれば `bindkey -v` とする
bindkey -e

# 自動補完を有効にする
autoload -U compinit; compinit

# 入力したコマンドが存在せず、かつディレクトリ名と一致するなら、ディレクトリに cd する
# 例： /usr/bin と入力すると /usr/bin ディレクトリに移動
setopt auto_cd

# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 拡張 glob を有効にする
setopt extended_glob

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_all_dups
# 履歴ファイルの保存先

export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# コマンドがスペースで始まる場合、コマンド履歴に追加しない
# 例： <Space>echo hello と入力
setopt hist_ignore_space

# 同一ホストの履歴を共有
setopt share_history

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものとする
# こうすると、 Ctrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# -------------------------------------
# alias
# -------------------------------------

alias ...='cd ../..'
alias ....='cd ../../..'
alias la="ls -AF "
alias ll='ls -lGF'
alias ls='ls -GF '
alias fp='find . -type f -name "*.php" | xargs grep --color -i '
alias glist='cd $(ghq list -p | peco)'
alias gopen='gh-open $(ghq list -p | peco)'

# -------------------------------------
# プロンプト
# -------------------------------------

# gitのブランチや状態の表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 6 # formatに入る変数の最大数
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
setopt prompt_subst
function vcs_echo {
    local st branch color
    STY= LANG=en_US.UTF-8 vcs_info
    st=`git status 2> /dev/null`
    if [[ -z "$st" ]]; then return; fi
    branch="$vcs_info_msg_0_"
    if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
    elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
    elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
    else color=${fg[cyan]}
    fi
    echo "%{$color%}(%{$branch%})%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
}
# macしか使えん気がする…
SUSHI=$'\U1F363 '   # スシ

PROMPT='
%F{yellow}[%~]%f `vcs_echo`
%(?.${SUSHI}.%F{red}$%f) '

# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls する
function chpwd() { ls }

# item2の関数
function title {
    echo -ne "\033]0;"$*"\007"
}

# tmuxinatorを有効にする
source ~/.tmuxinator.zsh

# cdrを有効にする
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

typeset -ga chpwd_functions

autoload -U chpwd_recent_dirs cdr
chpwd_functions+=chpwd_recent_dirs
zstyle ":chpwd:*" recent-dirs-max 500
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":completion:*" recent-dirs-insert always


# -------------------------------------
# ツール
# -------------------------------------
# peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# git
function peco-git-recent-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        peco)
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-recent-branches

function peco-git-recent-all-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads refs/remotes | \
        perl -pne 's{^refs/(heads|remotes)/}{}' | \
        peco)
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout -t ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-recent-all-branches

bindkey '^b^r' peco-git-recent-branches
bindkey '^br' peco-git-recent-all-branches

# cdr
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^d' peco-cdr

# brew install zsh-completions
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions(N-/) $fpath)
fi

# go
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# ghq
function ghq-list() {
    cd $(ghq list -p | peco)
    zle clear-screen
}
zle -N ghq-list
bindkey '^g' ghq-list
