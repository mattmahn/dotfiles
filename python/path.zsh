#!/bin/sh

# add pip-install location to PATH
if [ "$(uname)" = "Darwin" ] && [ -d "${HOME}/Library/Python/" ]; then
  for version in ${HOME}/Library/Python/*; do
    export PATH="${PATH}:${version}/bin"
  done
fi
