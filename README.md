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
```

