#!/bin/sh
SRC=$(cd "$(dirname "$0")"; pwd)

# symlink dotfiles
for i in `git ls-files | grep '^\.' | grep -v '\.gitignore'`;
do
    if [ ! -f $SRC/$i -a -f $SRC/$i.sample ]; then
        cp $SRC/$i.sample $SRC/$i
        echo "copied $SRC/$i.sample $SRC/$i"
    fi
    if [ ! -d `dirname ~/$i` ]; then
        mkdir -p `dirname ~/$i`
        echo "created `dirname ~/$i`"
    fi
    if [ ! -L ~/$i ]; then
        if [ -f ~/$i ]; then
            mv ~/$i ~/$i.original
            echo "moved ~/$i ~/$i.original"
        fi
        ln -s $SRC/$i ~/$i
        echo "linked $SRC/$i ~/$i"
    fi
done

# vim
mkdir -p ~/.vim/dein

# tmux
if [ ! -d ~/.solarized ]; then
    mkdir ~/.solarized
    git clone https://github.com/seebi/tmux-colors-solarized.git ~/.solarized/
fi

# peco
mkdir -p ~/.peco
cp .peco/config.json ~/.peco/

curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
mv git-prompt.sh ~/.git-prompt.sh

# tmuxinator
curl -O https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh
mv tmuxinator.zsh ~/.tmuxinator.zsh

# mux work で実行
mkdir -p ~/.tmuxinator
cat << EOF > ~/.tmuxinator/work.yml
# ~/.tmuxinator/work.yml

name: work
root: ~/

windows:
  - work:
     - vim
  - Desktop:
     - cd ~/Desktop
EOF

# brew
if [ `uname` = "Darwin" ]; then
    # gem
    # sudo gem install tmuxinator

    # homebrew
    sudo -v
    sh ./scripts/install.sh

    # zsh
    echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/zsh

    # config
    # dotfilesの表示
    defaults write com.apple.finder AppleShowAllFiles true; killall finder
    defaults write -g InitialKeyRepeat -int 9
    defaults write -g KeyRepeat -int 1
fi
