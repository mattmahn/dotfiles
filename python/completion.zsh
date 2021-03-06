#!/usr/bin/env zsh

# pip cli completion
[ python3 -m pip &>/dev/null ] && eval "$(python3 -m pip completion -z)"

if if-command molecule; then
  eval "$(_MOLECULE_COMPLETE=source molecule)"
fi
