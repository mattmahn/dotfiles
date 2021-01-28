#!/bin/sh

asdf_version='v0.8.0'
asdf_dir="${HOME}/.asdf"

if [ ! -d "$asdf_dir" ]; then
  git clone https://github.com/asdf-vm/asdf.git "$asdf_dir" --branch "$asdf_version"
fi
