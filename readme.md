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

# ssh workflows

I generate a dedicated ssh key for every service that requires it, i never reuse the same ssh key.
This is for privacy reasons:
When ssh tries to authenticate via public key, it sends the server all your public keys, one by one, until the server accepts one.
This is a minor information disclosure issue, since public keys can then be used to link someone's presence to private infrastructure, or github accounts.

If i have multiple github accounts, i generate an ssh key for every account.
Since github accounts are on the same github.com host, i create an host alias

this is an example of config file

 ~/.ssh/config:

    #personal github.com
    Host github.com
      IdentitiesOnly yes
      PubkeyAuthentication yes
      IdentityFile ~/.ssh/id_personal_github
    
    #work github.com (example usage: git clone git@work-github:your-repo.git)
    Host work-github
      HostName github.com
      IdentitiesOnly yes
      PubkeyAuthentication yes
      IdentityFile ~/.ssh/id_work_github

    # By default, connect to a ssh server with user ubuntu,
    # and don't send any ssh public key to avoid information disclosure to potential attackers.
    # This block must be at the END of the config file
    Host *
      PubkeyAuthentication no
      IdentitiesOnly yes
      User ubuntu

