#!/usr/bin/env bash

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew bundle

# Make sure using latest Homebrew
brew update || true

# Update already-installed formula
brew upgrade || true

# Add Repository
brew tap homebrew/versions    || true
brew tap phinze/homebrew-cask || true
brew tap homebrew/binary      || true
brew tap thoughtbot/formulae  || true
brew tap peco/peco            || true

brew install caskroom/cask/brew-cask

# Packages

## Shell
brew install zsh   || true

## Git
brew install git   || true
brew install hub   || true
brew install gist  || true
brew install tig   || true
brew install gibo  || true
brew install peco  || true

## Utils
brew install autoconf  || true
brew install automake  || true
brew install rmtrash   || true
brew install coreutils || true
brew install rmtrash   || true
brew install wget      || true
brew install curl      || true
brew install proctools || true
brew install tree      || true
brew install openssl   || true
brew install libyaml   || true
brew install readline  || true
brew install tmux      || true
brew install markdown  || true
brew install nkf       || true
brew install ag        || true
brew install mercurial || true
brew install ttyrec    || true
brew install reattach-to-user-namespace || true

## Languages
brew install rbenv            || true
brew install ruby-build       || true
brew install go               || true
brew install python3          || true
brew install scala            || true

## DevOps
brew install docker      || true
brew install boot2docker || true
brew install packer      || true

## Image
brew install imagemagick || true

# Casks
brew cask install google-chrome || true
brew cask install iterm2        || true
brew cask install dropbox       || true
brew cask install hipchat       || true
brew cask install yorufukurou   || true
brew cask install alfred        || true
brew cask install sourcetree    || true
brew cask install sublime-text  || true
brew cask install virtualbox    || true
brew cask install vagrant       || true
brew cask install dash          || true
brew cask install Cyberduck     || true
brew cask install Skype         || true
brew cask install Slack         || true
brew cask install xtrafinder    || true
brew cask install google-japanese-ime || true

# 未検証
brew cask install Witch              || true
brew cask install MouseZoom          || true
brew cask install BetterTouchTool    || true
brew cask install Glow               || true
brew cask install AppCleaner         || true
brew cask install Tree               || true
brew cask install Karabiner          || true
brew cask install CotEditor          || true
brew cask install Atom               || true
brew cask install Recessor           || true
brew cask install CodeRunner         || true

# Remove outdated versions
brew cleanup

# other
go get github.com/motemen/ghq
go get github.com/sugyan/ttygif
