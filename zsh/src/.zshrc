##############################
# My super awesome zshrc.    #
##############################


local ZSHDIR="$HOME/.zsh"
function _zshrc_try_source {
  [[ -f $1 ]] && source $1
}

_zshrc_try_source "$ZSHDIR/env.local"

# oh-my-zsh
#
function init_zsh {
  plugins=(git extract zsh_reload)
  [[ "$(uname)" == "Darwin" ]] && {
    plugins=(osx brew $plugins)
  }
  source $ZSH/oh-my-zsh.sh
}

export ZSH=$HOME/.oh-my-zsh
if [[ -d "$ZSH" ]] {
  init_zsh
} else {
  echo -ne "Oh-my-zsh is not installed.\nWould you like to install it right now? [y/n]: "
  read install_zsh
  if [[ $install_zsh == "y" ]] {
    cp $HOME/.zshrc $HOME/.zshrc.backup
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    mv $HOME/.zshrc.backup $HOME/.zshrc
    init_zsh
  }
}

_zshrc_try_source $ZSHDIR/opts
_zshrc_try_source $ZSHDIR/aliases
_zshrc_try_source $ZSHDIR/bindings
_zshrc_try_source $ZSHDIR/style

# Load my functions
#
{
  local FUNDIR="${ZSHDIR}/fun/"
  [[ -d "${FUNDIR}" ]] && {
    fpath=($FUNDIR $fpath)
    for func in `find $FUNDIR -type f -iname '*.zwc'`; {
      autoload -U "${$(basename $func)%.*}"
    }
  }
}

# Set hsitory stuff.
#
export HISTFILE=$HOME/.zhistory
export HISTSIZE=1000
export SAVEHIST=10000
fc -R $HISTFILE # process history file right now! -R = reversed

_zshrc_try_source "$HOME/.profile"
_zshrc_try_source "$HOME/.zshrc.local"

# setup git env
export GPG_TTY=$(tty)

# Add RVM and local bin to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/script:$HOME/.rvm/bin"

# Configure uncrustify
export UNCRUSTIFY_CONFIG=$HOME/.uncrustify/uncrustify.cfg
