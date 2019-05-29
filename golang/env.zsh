#!/usr/bin/env zsh

gopath="$(go env GOPATH)"
if [ "$?" -eq 0 ]; then
	export PATH="${PATH}:${gopath}/bin"
fi
