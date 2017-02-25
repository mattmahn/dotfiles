#!/bin/sh

if test "$(which pacman)"; then
  sudo pacman -S--noconfirm --needed gvim ctags
fi

vim +PluginInstall! +qall >/tmp/vim-plugins.log 2>&1 || true
