#!/bin/sh

if if-command brew; then
  brew install asdf
elif if-command dnf; then
  dnf install -y dnf-plugins-core
  dnf config-manager --add-repo https://rtx.pub/rpm/rtx.repo
  dnf install -y rtx
elif if-command yum; then
  yum install -y yum-utils
  yum-config-manager --add-repo https://rtx.pub/rpm/rtx.repo
  yum install -y rtx
elif if-command cargo; then
  cargo install rtx-cli
else
  curl -sSL https://rtx.pub/install.sh | sh
fi
