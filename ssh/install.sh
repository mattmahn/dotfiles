#!/bin/sh
test -f ~/.ssh/config || {
  mv ~/.ssh/config ~/.ssh/config.local
  ln -sv "$DOTFILES"/ssh/config ~/.ssh/config
}
test -f ~/.ssh/config.local || touch ~/.ssh/config.local
