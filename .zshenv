# 環境設定周り
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:/usr/local/Cellar/"
export TERM=xterm-256color

# その他パス
# export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.pyenv/shims/python:$PATH"

export PYTHONDONTWRITEBYTECODE=1 #pythonでpycファイルを作らない
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

if command -v direnv 1>/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
export PATH=$HOME/.rbenv/bin:$PATH

# goenv
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH=$HOME/.goenv/bin:$PATH
if command -v goenv 1>/dev/null 2>&1; then
  eval "$(goenv init -)"
fi

# 開発時に使うパス
export PATH="$PATH:/usr/local/mysql/bin"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

export PATH=$PATH:/$HOME/Library/Android/sdk/platform-tools

# zlib
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
