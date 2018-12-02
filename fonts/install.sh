#!/bin/bash

if command -v yay >/dev/null 2>&1; then
  pacman=( \
    adobe-source-{code,sans,serif}-pro-fonts \
    noto-fonts{,-emoji} \
    otf-fira-code \
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
  aur=(\
    gohufont-powerline \
    otf-hasklig \
    otf-hermit \
    phallus-fonts-git \
    system-san-francisco-font-git \
    ttf-iosevka-term \
    ttf-librebaskerville \
    ttf-monoid \
    ttf-paratype \
    ttf-{ms,vista}-fonts \
  )
  yay -S --noconfirm --needed ${pacman[*]} ${aur[*]}
elif [ "$(uname -s)" = "Darwin" ]; then
  curl -Ls -o /tmp/hack.tgz "https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-3.003-ttf.tar.gz"
  tar xzvf /tmp/hack.tgz -C ~/Library/Fonts
fi

tmpdir="$(mktemp -d)"
(
  # shellcheck disable=SC2164
  cd "$tmpdir"
  git clone https://github.com/powerline/fonts.git
  ./fonts/install.sh
)
rm -rf "$tmpdir"
