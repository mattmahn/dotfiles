#!/bin/sh

VERSION="v2.020"
VERSION_="v2_020"
URL="https://github.com/chrissimpkins/Hack/releases/download/"

if test "$(which pacman)"; then
  sudo pacman -S --noconfirm --needed ttf-hack ttf-linux-libertine terminus-font ttf-inconsolata
  yaourt -S --noconfirm otf-hermit gohufont-powerline phallus-fonts-git
elif [ "$(uname -s)" = "Darwin" ]; then
  curl -L -s -o /tmp/hack.tgz "$URL/$VERSION/Hack-${VERSION_}-otf.tar.gz"
  tar xzvf /tmp/hack.tgz -C ~/Library/Fonts
else
  mkdir -p ~/.fonts
  curl -L -s -o /tmp/hack.tgz "$URL/$VERSION/Hack-${VERSION_}-ttf.tar.gz"
  tar xzvf /tmp/hack.tgz -C ~/.fonts
fi

cd /tmp
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts
cd -
