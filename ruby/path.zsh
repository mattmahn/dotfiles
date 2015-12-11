#!/bin/sh
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi
# shellcheck disable=SC2039
if rbenv &>/dev/null; then
  eval "$(rbenv init -)"
fi
if [ -d "$HOME/.gem/ruby/2.2.0" ]; then
  export PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"
fi
