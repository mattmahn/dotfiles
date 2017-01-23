#!/bin/sh
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$PATH:$HOME/.rbenv/bin"
else
  export PATH="$PATH:$HOME/.gem/ruby/2.4.0/bin"
fi

__rbenv_started=0

__rbenv_init() {
  test $__rbenv_started = 0 && {
    eval "$(command rbenv init -)"
    __rbenv_started=1
  }
}

rbenv() {
  __rbenv_init
  command rbenv "$@"
}

ruby() {
  __rbenv_init
  command ruby "$@"
}

rake() {
  __rbenv_init
  command rake "$@"
}

bundle() {
  __rbenv_init
  command bundle "$@"
}
