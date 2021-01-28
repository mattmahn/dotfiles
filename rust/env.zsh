#!/bin/zsh

[[ -f ~/.cargo/env ]] && source ~/.cargo/env

if-command rustc || return
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
