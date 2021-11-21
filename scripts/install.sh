#!/usr/bin/env bash

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew bundle

# Make sure using latest Homebrew
brew update || true

# Update already-installed formula
brew upgrade || true

# Add Repository
brew tap homebrew/homebrew-core || true
# brew tap phinze/homebrew-cask || true
# brew tap homebrew/binary      || true
# brew tap thoughtbot/formulae  || true

brew install caskroom/cask/brew-cask

# Packages

## Shell
brew install zsh   || true

## Git
brew install git   || true
brew install hub   || true
brew install tig   || true
brew install peco  || true
brew install ghi   || true # http://qiita.com/mamoru0217/items/00c0bae2a636750b0e09
brew install migemogrep || true

## Utils
brew install autoconf  || true
brew install automake  || true
brew install rmtrash   || true
brew install coreutils || true
brew install rmtrash   || true
brew install wget      || true
brew install curl      || true
brew install proctools || true
brew install openssl   || true
brew install libyaml   || true
brew install readline  || true
brew install tmux      || true
brew install markdown  || true
brew install nkf       || true
brew install ag        || true
brew install fzf       || true
brew install mercurial || true
brew install ttyrec    || true
brew install reattach-to-user-namespace || true
brew install jq        || true

## Languages
brew install rbenv            || true
brew install ruby-build       || true
brew install goenv            || true
brew install pyenv-virtualenv || true
brew install vim --with-override-system-vi || true
brew install fd

## DevOps
brew install docker    || true

## Image
brew install imagemagick || true

# Casks
brew install google-chrome || true
brew install iterm2        || true
brew install dropbox       || true
brew install alfred        || true
brew install slack         || true
brew install google-japanese-ime || true

brew install witch              || true
brew install clipy              || true
brew install appcleaner         || true
brew install coteditor          || true
brew install macdown            || true
brew install shiftit            || true
# brew install flux               || true
brew install psequel            || true
brew install visual-studio-code || true
# Remove outdated versions brew cleanup

## other
# go get github.com/sugyan/ttygif
