# dotfiles

## 事前準備
- xcode install
- githubの鍵生成
  - https://dev.classmethod.jp/articles/github-mac-terminal-ssh-login/

```
$ xcode-select --install
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ echo 'export GOPATH=$HOME/.go' >> ~/.zshenv
$ echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.zshenv
$ brew install go
$ brew install ghq
$ zsh
$ mkdir -p ~/.go/src
$ mkdir .ghq
$ curl -O https://raw.githubusercontent.com/okbm/dotfiles/master/.gitconfig >> ~/.gitconfig

$ ghq get okbm/dotfiles
$ cd .ghq/github.com/okbm/dotfiles
```

## setup

```
$ sh bootstrap.sh
```

## node

```
$ curl -L git.io/nodebrew | perl - setup
$ nodebrew install latest
$ nodebrew use latest
```


## その他macの設定

- 日本語入力の切り替え
  - キーボード -> ショートカットから入力ソースとspotrightを入れ替える
  - 前の入力ソースを表示と次のソースを表示をcmd + スペースにする
- デュアルモニタ時にalfredがアクティブなモニタじゃなくてMac側にしか表示されない
  - 「Appearance」タブの左下にある「Options」からShow Alfred onをactiveに変更
- Gmailのキーボードショートカットを有効にして、dを削除に割り当てる
- マジックマウスを1本指でページ送りできるように
- ディスプレイの照明を自動調整解除
- フォント
  - https://github.com/edihbrandon/RictyDiminished
- iterm
  - setting -> profile -> color -> "solarized dark" にする
- 初回起動
  - clipy
  - alfred
- https://www.too.com/support/faq/mac/22467.html
- Spotlightのショートカットをやめる
- 日本語切り替えのショートカットをcmd + spaceに
- 外部キーボードのキーを変更。capsをcntに。cntとoptをcmdに
- alfredの入力をcontrol + space
- cmd + ` でウインドウ切り替えをする
  - システム設定 → キーボード → ショートカット→次のウィンドウを操作対象にする
  - https://qiita.com/Yinaura/items/10fe5fe0cb0a795a0f58

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

# vscode

`code --list-extensions` で現在インストール済みの拡張を出す

```
$ cd vscode
$ ./installExtensions.sh

# settings.jsonのcopy
$ cp ~/Library/Application\ Support/Code/User/settings.json ~/.ghq/github.com/okbm/dotfiles/vscode
```

vscodeでhjklで押しっぱなしで移動できない場合は以下を入力

```
$ defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
$ defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
```
