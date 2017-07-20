#!/bin/sh

VERSION="v2.020"
VERSION_="v2_020"
URL="https://github.com/chrissimpkins/Hack/releases/download/"

if test "$(which pacman)"; then
  pacman=( \
    adobe-source-{code,sans,serif}-pro-fonts \
    noto-fonts{,-emoji} \
    otf-fira-{mono,sans} \
    terminus-font \
    ttf-anonymous-pro \
    ttf-dejavu \
    ttf-gentium \
    ttf-hack \
    ttf-inconsolata \
    ttf-liberation \
    ttf-linux-libertine \
    ttf-opensans \
    ttf-roboto \
    ttf-ubuntu-font-family \
  )
  yaourt=(\
    gohu-powerline \
    otf-fira-code \
    otf-hasklig \
    otf-hermit \
    otf-texgyre \
    phallus-fonts-git \
    system-san-francisco-font-git \
    ttf-iosevka-term \
    ttf-monoid \
    ttf-{ms,vista}-fonts \
  )
  sudo pacman -S --noconfirm --needed "${pacman[*]}"
  yaourt -S --noconfirm "${yaourt[*]}"
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
