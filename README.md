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

- dockの設定等は https://github.com/okbm/dotfiles/blob/master/mac.config 
- マジックマウスを1本指でページ送りできるように

### キーボード周り
- google日本語入力を有効にする(先にPC再起動したほうがいいかも)
- Spotlightのショートカットをやめる
- 日本語入力の切り替え
  - キーボード -> ショートカットから入力ソースとspotrightを入れ替える
  - 前の入力ソースを表示と次のソースを表示をcmd + スペースにする
- 外部キーボードのキーを変更。capsをcntに。cntとoptをcmdに
- cmd + ` でウインドウ切り替えをする

<img width="684" alt="スクリーンショット 2023-02-15 15 25 35" src="https://user-images.githubusercontent.com/988486/218949336-f02e1b85-2d7d-45cc-bf30-2c04b45b7169.png">

<img width="665" alt="スクリーンショット 2023-02-15 15 20 04" src="https://user-images.githubusercontent.com/988486/218948387-7e24f007-8aa5-4533-87c2-3c0c4b3ecc4e.png">


### アプリ周り

- alfred
  - 入力をcontrol + space
  - デュアルモニタ時にalfredがアクティブなモニタじゃなくてMac側にしか表示されない
  - 「Appearance」タブの左下にある「Options」からShow Alfred onをactiveに変更
- shiftlt
  - 右半分と左半分と全画面だけでもやる
- Gmailのキーボードショートカットを有効にして、dを削除に割り当てる(これはいらないかも)
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

# vscode

`code --list-extensions` で現在インストール済みの拡張を出す

code commandを使うためには vscodeを起動して、cmd + shift + Pで表示される窓にshellと入力してcode commandをinstallする

```
$ cd vscode
$ ./installExtensions.sh

# settings.jsonのcopy
$ cp ~/Library/Application\ Support/Code/User/settings.json ~/.ghq/github.com/okbm/dotfiles/vscode
```

Color Theme > Night Owl

vscodeでhjklで押しっぱなしで移動できない場合は以下を入力

```
$ defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
$ defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
```

# vimやitermの設定

```
$ vim

vim 上で :call dein#install()

```
