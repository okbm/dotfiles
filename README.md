# dotfiles

## 事前準備
- xcode install
- githubの鍵生成
  - https://dev.classmethod.jp/articles/github-mac-terminal-ssh-login/

```

$ xcode-select --install
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ echo 'export GOPATH=$HOME/.go' >> ~/.zshenv
$ echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.zshenv
$ brew install go
$ zsh
$ mkdir -p ~/.go/src
$ mkdir .ghq
$ curl -O https://raw.githubusercontent.com/okbm/dotfiles/master/.gitconfig >> ~/.gitconfig

$ go get github.com/x-motemen/ghq
$ ghq get okbm/dotfiles
$ cd .ghq/github.com/okbm/dotfiles
```

## setup

```
$ sh bootstrap.sh

$ rbenv install 3.0.1
$ rbenv global 3.0.1
$ sudo gem install tmuxinator
```

## node

```
$ curl -L git.io/nodebrew | perl - setup
$ nodebrew install latest
$ nodebrew use latest
```


## ohter

- brewが動かない
  - `brew doctor` で確認
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
- iterm
  - setting -> profile -> color -> "solarized dark" にする
- 初回起動
  - clipy
  - alfred

# github関係

```
# create_key_name: id_rsa_github
$ ssh-keygen -t rsa
$ pbcopy < ~/.ssh/id_rsa_github.pub

https://github.com/settings/keys
sshの鍵を保存する

$ ssh -T git@github.com
$ git remote set-url origin git@github.com:okbm/dotfiles.git
```

## memo
- go周りあとで見直したほうがいいかも
  - brew install --HEAD goenv
  - brew uninstall go
  - goenv install 1.13.6
  - goenv local 1.13.6

