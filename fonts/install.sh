#!/bin/bash
if [ "$(uname -s)" = "Darwin" ]; then
  brew cask install font-hack
elif test "$(which pacman)"; then
  sudo pacman -S --noconfirm --needed ttf-hack ttf-linux-libertine
  yaourt -S --noconfirm otf-hermit
else
  FONTS_FOLDER="$HOME/.fonts"
  mkdir -p "$FONTS_FOLDER"
  wget -O /tmp/hack.zip \
   -c https://github.com/chrissimpkins/Hack/releases/download/v2.010/Hack-v2_010-ttf.zip
  unzip -o /tmp/hack.zip -d "$FONTS_FOLDER"
fi
