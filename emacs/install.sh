#!/bin/bash

# install
if command -v pacman &>/dev/null; then
  sudo pacman -S --noconfirm --needed emacs
elif [[ "$(uname -s)" = "Darwin" ]]; then
  brew cask install emacs
fi

# first time setup
if [[ ! -d ~/.emacsfiles ]]; then
  git clone git@github.com:mattmahn/emacsfiles.git ~/.emacsfiles
  ln -sv ~/.emacsfiles/emacs.el ~/.emacs.el
fi
