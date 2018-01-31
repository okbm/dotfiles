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
brew install tree      || true
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
brew install redis     || true

## Languages
brew install rbenv            || true
brew install ruby-build       || true
brew install go               || true
brew install pyenv-virtualenv || true
# brew install python3          || true
# brew install scala            || true

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
brew cask install alfred        || true
brew cask install dash          || true
brew cask install slack         || true
brew cask install google-japanese-ime || true

brew cask install witch              || true
brew cask install clipy              || true
brew cask install appcleaner         || true
brew cask install karabiner          || true
brew cask install coteditor          || true
brew cask install coderunner         || true
brew cask install macdown            || true
brew cask install shiftit            || true

# brew cask install hipchat       || true
# brew cask install xtrafinder    || true
# brew cask install skype         || true
# brew cask install sourcetree    || true
# brew cask install sublime-text  || true
# brew cask install virtualbox    || true
# brew cask install vagrant       || true
# brew cask install caskroom/cask/night-owl || true
# brew cask install bettertouchtool    || true
# brew cask install messenger          || true
brew cask install tomighty           || true

# Remove outdated versions
brew cleanup

## other
go get github.com/motemen/ghq
go get github.com/sugyan/ttygif
