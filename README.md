# dotfiles

## 事前準備
- xcode install
- ghqのセットアップ

```
$ cat .bashrc >> EOF
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
EOF

$ xcode-select --install
$ mkdir -p ~/.go/src
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install go
$ go get github.com/motemen/ghq
$ ghq get okbm/dotfiles
$ cd ~/.go/src/github.com/okbm/dotfiles
```

## setup

```
$ sh bootstrap.sh

$ rbenv install 2.5.0
$ rbenv global 2.5.1
$ sudo gem install tmuxinator

```

## ohter

- 日本語入力の切り替え
  - キーボード -> ショートカットから入力ソースとspotrightを入れ替える
  - 前の入力ソースを表示と次のソースを表示をcmd + スペースにする
- デュアルモニタ時にalfredがアクティブなモニタじゃなくてMac側にしか表示されない
  - 「Appearance」タブの左下にある「Options」からShow Alfred onをactiveに変更
- Gmailのキーボードショートカットを有効にして、dを削除に割り当てる
- 外部キーボードのキーを変更。capsをcntに。cntとoptをcmdに
- マジックマウスを1本指でページ送りできるように
- ディスプレイの照明を自動調整解除
- フォント
  - https://github.com/edihbrandon/RictyDiminished
- color schema
  - https://raw.githubusercontent.com/joshdick/onedark.vim/master/term/One%20Dark.itermcolors

## memo

- tmuxの移動モードでvimが死んでて動かないかも
