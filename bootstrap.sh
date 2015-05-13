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
mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

if [ ! -d ~/.vim/bundle/vimproc ]; then
    git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
fi

# tmux
if [ ! -d ~/.solarized ]; then
    mkdir ~/.solarized
    git clone https://github.com/seebi/tmux-colors-solarized.git ~/.solarized/
fi

# peco
mkdir -p ~/.peco
cp .peco/config.json ~/.peco/

# gitのブランチを表示する
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash ~/.git-completion.bash

curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
mv git-prompt.sh ~/.git-prompt.sh

# tmuxinator
curl -O https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.bash
mv tmuxinator.bash ~/.tmuxinator.bash

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
    # zsh
    echo '/usr/local/bin/zsh' |  sudo tee -a /etc/shells
    chsh -s /usr/local/bin/zsh

    # gem
    gem install tmuxinator

    # homebrew
    sudo -v
    sh ./scripts/install.sh

    # Ricty(未検証)
#    mkdir -p ~/tmp
#    cd ~/tmp
#    curl -L 'https://gist.github.com/ysaotome/7286145/raw/installing_ricty_on_MacOSX.sh' | bash
#    cd .. && rm -rf ~/tmp
fi

