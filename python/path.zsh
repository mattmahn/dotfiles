#!/bin/sh

__pyenv_started=0

__pyenv_init() {
  test $__pyenv_started = 0 && {
    eval "$(command pyenv init -)"
    __pyenv_started=1
  }
}

pyenv() {
  __pyenv_init
  command pyenv "$@"
}

python() {
  __pyenv_init
  command python "$@"
}

pip() {
  __pyenv_init
  command pip "$@"
}

# add pip-install location to PATH
if [ "$(uname)" = "Darwin" ]; then
  for version in ${HOME}/Library/Python/*; do
    export PATH="${PATH}:${version}/bin"
  done
fi
