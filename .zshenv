# 環境設定周り
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:/usr/local/Cellar/"
export TERM=xterm-256color

# その他パス
# export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.pyenv/bin:$PATH"
export PYTHONDONTWRITEBYTECODE=1 #pythonでpycファイルを作らない
eval "$(pyenv init -)"
eval "$(rbenv init -)"
export PATH=$HOME/.rbenv/bin:$PATH

# 開発時に使うパス
export PATH="$PATH:/usr/local/mysql/bin"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
