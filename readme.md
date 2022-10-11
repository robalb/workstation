# my workstation

This shell script configures an ubuntu machine with my every day use configurations, dotfiles and programs.

    curl -o- https://raw.githubusercontent.com/robalb/workstation/master/setup.sh | bash


If you don't have curl:

    sudo apt update && sudo apt install curl && curl -o- https://raw.githubusercontent.com/robalb/workstation/master/setup.sh | bash

features:

- idempotent script. Running it twice won't cause any damage
- guided github account login
- sync dotfiles with public repository https://github.com/robalb/dotfiles
- bare minimum tools: tmux, vim, kitty
- programming tools: lvim, python, nodejs (via nvm), docker desktop
- hacking tools: pwntools, z3

# additional manual steps

These steps require manual intervention from the settings gui

- set kitty as the default terminal
- swap esc and capslock key
- swap fn and ctrl on some thinkpad keyboard layouts
