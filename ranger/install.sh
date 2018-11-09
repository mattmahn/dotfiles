#!/bin/sh

if test "$(which pacman)"; then  # Arch
  sudo pacman -S --noconfirm --needed ranger
elif test "$(which apt-get)"; then  # RHEL/CentOS 7
  sudo apt-get install -y ranger
elif test "$(which brew)"; then  # Darwin
  brew install ranger
fi
