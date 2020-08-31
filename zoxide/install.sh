#!/bin/sh
# https://github.com/ajeetdsouza/zoxide

if if-command brew; then
  brew install zoxide
elif if-command cargo; then
  cargo install -f zoxide
fi
