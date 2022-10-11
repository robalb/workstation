#!/bin/bash

COLOR='\033[0;31m'
NC='\033[0m' # No Color


type -p kitty >/dev/null || (echo -e "${COLOR} kitty not found, installing it ${NC}" \
  && (curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin) \
  && ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/ )
  

