#!/bin/sh
# https://github.com/BurntSushi/ripgrep

if test "$(which pacman)"; then  # Arch
  sudo pacman -S --noconfirm --needed ripgrep
elif test "$(which dnf)"; then  # Fedora 24+
  dnf copr enable carlgeorge/ripgrep
  dnf install ripgrep
elif test "$(which yum)"; then  # RHEL/CentOS 7
  yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlgeorge/ripgrep/repo/epel-7/carlgeorge-ripgrep-epel-7.repo
  yum install ripgrep
elif test "$(which brew)"; then  # Darwin
  brew install ripgrep
fi
