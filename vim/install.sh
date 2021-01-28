#!/bin/bash

mkdir -p ~/.vim/undodir

if test "$(which pacman)"; then
  sudo pacman -S --noconfirm --needed gvim neovim ctags
  # install extra language providers
  sudo pacman -S --noconfirm --needed python python-pip ruby
elif [ "$(uname -s)" = "Darwin" ]; then
  brew install neovim
fi

# install neovim Python provider (system-wide)
sudo python3 -m pip install -U neovim
# install neovim Ruby provider (user-local)
gem install --no-document neovim

if [[ ! -d ~/.vimfiles ]]; then
  git clone https://github.com/mattmahn/vimfiles.git ~/.vimfiles
  mkdir -p ~/.config/nvim
  # see `nvim +help nvim-from-vim`
  (
  cat <<'EOF'
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF
) > ${XDG_CONFIG_HOME:-~/.config}/nvim/init.vim
  ln -vs ~/.vimfiles/vimrc.symlink ~/.vimrc
  ln -vs ~/.vimfiles/vim.symlink ~/.vim
fi

nvim +PlugUpdate! +qall >/tmp/vim-plugins.log 2>&1 || true
