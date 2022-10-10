
COLOR='\033[0;31m'
NC='\033[0m' # No Color

extra=true

# install a package from apt default repositories if not already installed
apt_requirement(){
  type -p $1 >/dev/null || echo -e "${COLOR} $1 not found, installing it ${NC}" &&\
    sudo apt -qq install $1 -y
}

echo -e "${COLOR} ====== [core] SETUP =======${NC}"
sudo apt -q update
sudo apt -q upgrade
apt_requirement curl
apt_requirement git
sudo apt install software-properties-common -y

#install gh (github cli) if not already installed
type -p gh >/dev/null || echo -e "${COLOR} gh not found, installing it ${NC}" \
  && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y


echo -e "${COLOR} ====== [core] GITHUB AUTH =======${NC}"
# TODO: dont login if already logged in
gh auth login
gh auth setup-git


echo -e "${COLOR} ====== [core] TOOLS INSTALLATION =======${NC}"
apt_requirement tmux
apt_requirement xclip
# commented out, this is hardcoded in the dotfiles repo now
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#install neovim if not already installed
type -p nvim >/dev/null || echo -e "${COLOR} neovim not found, installing it ${NC}" &&\
  sudo add-apt-repository ppa:neovim-ppa/stable -y &&\
  sudo apt-get update &&\
  sudo apt -qq install neovim -y

echo -e "${COLOR} ====== [core] DOTFILES SETUP =======${NC}"
# https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/
# Initialize the bare repo and pull the dotfiles from the origin.
# All these operations are idempotent
[ -d "$HOME/.cfg" ] && echo -e "${COLOR} ====== [core] skipping dotfiles setup =======${NC}" || ( echo -e "${COLOR} ====== [core] DOTFILES SETUP =======${NC}" \
  && git init --bare $HOME/.cfg \
  && git --git-dir=$HOME/.cfg/ --work-tree=$HOME remote add origin https://github.com/robalb/dotfiles \
  && git --git-dir=$HOME/.cfg/ --work-tree=$HOME pull --ff-only origin master )


# EXTRA CONFIGURATION
# Careful, the following configuration steps are not idempotent
if [ $extra ] ;then
  echo -e "${COLOR} ====== [extra] LANGUAGES INSTALLATION =======${NC}"
  apt-get install -y python3 python3-pip python3-dev libssl-dev libffi-dev build-essential wget
  python3 -m pip install --upgrade pip
  python3 -m pip install --upgrade pwntools
  python3 -m pip install --upgrade z3-solver

  #nvm: nodejs version manager.
  #Careful, this installation script appends stuff to .bashrc and .bash_profile
  #https://github.com/nvm-sh/nvm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

  #lunarvim
  echo -e "${COLOR} ====== [extra] LUNARVIM INSTALLATION =======${NC}"
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
fi


#TODO: download
# nodejs
# lunarvim https://www.lunarvim.org/docs/installation
# docker desktop https://docs.docker.com/desktop/install/ubuntu/
# ghidra
