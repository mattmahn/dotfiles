#!/bin/sh

if if-command brew; then
  brew install jdxcode/tap/rtx
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

asdf_version='v0.8.1'
asdf_dir="${HOME}/.asdf"

if [ ! -d "$asdf_dir" ]; then
  git clone https://github.com/asdf-vm/asdf.git "$asdf_dir" --branch "$asdf_version"
fi
