#!/bin/bash

if if-command apt; then
  sudo add-apt-repository ppa:maveonair/helix-editor
  sudo apt update
  sudo apt install helix
elif if-command dnf; then
  sudo dnf install helix
elif if-command pacman; then
  sudo pacman -S helix
elif if-command brew; then
  brew install helix
fi
