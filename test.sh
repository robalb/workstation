#!/bin/bash

COLOR='\033[0;31m'
NC='\033[0m' # No Color

[ -d "$HOME/.cfg" ] || echo -e "${COLOR} ====== [core] DOTFILES SETUP =======${NC}" \
  && git init --bare $HOME/.cfg \
  && git --git-dir=$HOME/.cfg/ --work-tree=$HOME remote add origin https://github.com/robalb/dotfiles \
  && git --git-dir=$HOME/.cfg/ --work-tree=$HOME pull --ff-only origin master \


