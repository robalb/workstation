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

- ### set kitty as the default terminal:
  settings>keyboard shortcuts>custom shortcut> (set ctrl+alt+t to execute `kitty --start-as fullscreen`. This will automatically disable the default
  'launch terminal' shortuct)
- ### swap esc and capslock key: 
  install gnome tweaks `sudo apt install gnome-tweaks-tool && gnome-tweaks` then from the gnome tweaks app (NOT the settings app) Keyboard & Mouse > Additional Layout Options > Caps Lock Behavior
- ### swap fn and ctrl on some thinkpad keyboard layouts: 
  It's done in the bios settings. Config -> keyboard/mouse -> Fn and Ctrl Key swap. [lenovo - how to swap fn and ctrl](https://support.lenovo.com/gb/en/solutions/ht074187-how-to-swap-the-fn-function-and-ctrl-control-keyboard-keys-in-bios)
