#!/bin/bash

# install
if command -v pacman &>/dev/null; then
  sudo pacman -S --noconfirm --needed emacs
elif [[ "$(uname -s)" = "Darwin" ]]; then
  brew install --cask emacs
fi

# first time setup
if [[ ! -d ~/.emacsfiles ]]; then
  git clone https://github.com/mattmahn/emacsfiles.git ~/.emacsfiles
  [[ -f ~/.emacs.el ]] && mv ~/.emacs.el{,.backup}
  ln -sv ~/.emacsfiles/emacs.el ~/.emacs.el
fi
