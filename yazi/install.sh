#!/bin/sh
# https://yazi-rs.github.io/docs/installation

if if-command pacman; then
  sudo pacman -S yazi
elif if-command brew; then
  brew install yazi
elif if-command cargo; then
  cargo install --locked yazi-fm yazi-cli
fi
