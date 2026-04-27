#!/bin/sh

set -eu
cd ${0%/*}

#!/bin/sh
set -e

install_linux() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        os_id="$ID"
    else
        echo "Cannot detect Linux distribution"
        exit 1
    fi

    case "$os_id" in
        alpine)
            echo "> Detected Alpine Linux"
            apk add --update --no-cache \
                bash \
                neovim \
                ncurses \
                curl \
                git
            ;;
        void)
            echo "> Detected Void Linux"
            sudo xbps-install -Sy \
                bash \
                neovim \
                ncurses \
                curl \
                git
            ;;
        *)
            echo "Unsupported Linux distro: $os_id"
            exit 1
            ;;
    esac
}

install_macos() {
    echo "> Detected macOS"

    if ! command -v brew >/dev/null 2>&1; then
        echo "Error: Homebrew is not installed."
        echo "Install it first from https://brew.sh/"
        exit 1
    fi

    brew install \
        bash \
        neovim \
        ncurses \
        curl \
        git
}

case "$(uname -s)" in
    Linux)
        install_linux
        ;;
    Darwin)
        install_macos
        ;;
    *)
        echo "Unsupported OS: $(uname -s)"
        exit 1
        ;;
esac

# install bashrc
echo "> bashrc > Installing bashrc and bash_profile"
if [ -f $HOME/.bashrc ]; then
  echo "> bashrc > Backing up existing .bashrc to .bashrc.bak"
  cp -v $HOME/.bashrc $HOME/.bashrc.bak
fi
rm -vr $HOME/.bashrc $HOME/.bashrc.d || true
echo "> bashrc > Installing new .bashrc and .bashrc.d"
cp -vr .bashrc.d $HOME/
cp -v .bashrc $HOME/

echo "> bashrc > Installing new .bash_profile"

if [ -f $HOME/.bash_profile ]; then
  cp -v $HOME/.bash_profile $HOME/.bash_profile.bak
fi
cp -v .bash_profile $HOME/


# install nvim
echo "> nvim > Installing nvim configuration"
cp -vr .nvim $HOME/
cp -v .vimrc $HOME/
mkdir -pv $HOME/.config/nvim
cp -v .config/nvim/* $HOME/.config/nvim/

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
