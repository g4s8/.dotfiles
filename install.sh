#!/bin/sh

set -eu
cd ${0%/*}

os_id=$(cat /etc/os-release  | grep '^ID=' | awk -F'=' '{print $2}' | tr -d '"')
if [ $os_id = 'alpine' ]; then
  echo "> alpine > Detected Alpine Linux, installing dependencies"
  apk add --update --no-cache \
    bash \
    neovim \
    ncurses \
    curl \
    git || true
fi

if [ $os_id = 'void' ]; then
  sudo xbps-install -Sy \
    bash \
    neovim \
    ncurses \
    curl \
    git || true
fi

# install bashrc
echo "> bashrc > Installing bashrc and bash_profile"
if [ -f $HOME/.bashrc ]; then
  echo "> bashrc > Backing up existing .bashrc to .bashrc.bak"
  cp -v $HOME/.bashrc $HOME/.bashrc.bak
fi
rm -vr $HOME/.bashrc $HOME/.bashrc.d || true
echo "> bashrc > Installing new .bashrc and .bashrc.d"
cp -vr .bashrc.d -t $HOME
cp -v .bashrc -t $HOME

echo "> bashrc > Installing new .bash_profile"

if [ -f $HOME/.bash_profile ]; then
  cp -v $HOME/.bash_profile $HOME/.bash_profile.bak
fi
cp -v .bash_profile -t $HOME


# install nvim
echo "> nvim > Installing nvim configuration"
cp -vr .nvim -t $HOME
cp -v .vimrc -t $HOME
mkdir -pv $HOME/.config/nvim
cp -v .config/nvim/* -t $HOME/.config/nvim

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
