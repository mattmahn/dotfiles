#!/bin/zsh

command -v rustc &>/dev/null || return

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
