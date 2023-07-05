# my workstation

This shell script configures an ubuntu machine with my configurations, dotfiles and programs.

    curl -o- https://raw.githubusercontent.com/robalb/workstation/master/setup.sh | bash


If you don't have curl:

    sudo apt update && sudo apt install curl && curl -o- https://raw.githubusercontent.com/robalb/workstation/master/setup.sh | bash

features:

- Running the script twice won't cause any damage. Configurations and programs are installed only if they are not detected in the system
- guided github account login
- git repository for dotfiles management, synced with https://github.com/robalb/dotfiles. (It uses the technique described [here](https://www.atlassian.com/git/tutorials/dotfiles) )
- bare minimum tools: tmux, nvim, nerdfonts

extra features (kinda out of scope for this script, can be disabled via the extra flag):

- programming tools: lunarvim, python, nodejs (via nvm), docker desktop
- hacking tools: pwntools, z3

## TODO:

https://github.com/zardus/ctf-tools

# additional manual steps

These steps require manual intervention from the settings gui

- ### swap esc and capslock key: 
  install gnome tweaks `sudo apt install gnome-tweaks-tool && gnome-tweaks` then from the gnome tweaks app (NOT the settings app) Keyboard & Mouse > Additional Layout Options > Caps Lock Behavior
- ### activate wallpaper:
  The wallpaper png image is kept in the dotfiles repository as `~/wallpaper.png`. Use the settings gui to set it as wallpaper
- ### swap fn and ctrl on some thinkpad keyboard layouts: 
  It's done in the bios settings. Config -> keyboard/mouse -> Fn and Ctrl Key swap. [lenovo - how to swap fn and ctrl](https://support.lenovo.com/gb/en/solutions/ht074187-how-to-swap-the-fn-function-and-ctrl-control-keyboard-keys-in-bios)
- ### disable snap notifications
  https://askubuntu.com/a/1424950

# useful workflows

ssh keys: I generate a dedicated ssh key for every service that requires it.
If i have multiple github accounts, i generate an ssh key for every account.

Since github accounts are on the same github.com host, i create an host alias:

 ~/.ssh/config:

    #Digitiamo GitLab.com
    Host gitlab.com
      PreferredAuthentications publickey
      IdentityFile ~/.ssh/id_digitiamo_gitlab
    
    #Digitiamo github.com (example usage: git clone git@digitiamo-github:your-repo.git)
    Host digitiamo-github
      HostName github.com
      IdentitiesOnly yes
      IdentityFile ~/.ssh/id_digitiamo_github

