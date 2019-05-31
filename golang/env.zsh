#!/usr/bin/env zsh

if ! command -v go &>/dev/null; then
  return
fi

gopath="$(go env GOPATH)"
if [ "$?" -eq 0 ]; then
	export PATH="${PATH}:${gopath}/bin"
fi
