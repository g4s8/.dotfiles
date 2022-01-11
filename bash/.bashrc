if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

if [[ -f $HOME/.bashrc.pre ]]; then
  source $HOME/.bashrc.pre
fi

function _bashrc {
    local bashdir="$HOME/.bash"

    _try_load_bash_ext() {
        source "${bashdir}/${1}.sh"
    }

    # apply extensions
    local extensions=(colors aliases utils)
    for ext in ${extensions[*]}; do
        _try_load_bash_ext $ext
    done
    unset -f _try_load_bash_ext

    _ps_git_branch() {
        local branch=""
        if [[ -d ".git" ]]; then
            git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
        fi
    }

    local red="\[$(tput setaf 1)\]"
    local rst="\[$(tput sgr0)\]"
    local blue="\[$(tput setaf 4)\]"
    local green="\[$(tput setaf 2)\]"
    local brown="\[$(tput setaf 3)\]"
    local cyan="\[$(tput setaf 5)\]"

    local ps=" "
    if [[ $(whoami) == "root" ]]; then
        ps="${ps}${red}"
    else
        ps="${ps}${blue}"
    fi
    ps="${ps}\\u${rst}"
    ps="${ps} ${green} \\w${rst}"
    ps="${ps}${brown}\$(_ps_git_branch)${rst}"
    ps="${ps} ${cyan}>${rst} "
    export PS1=$ps


    # export gpg tty
    export GPG_TTY=$(tty)

    # export paths
    export PATH="$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.ruby/bin:$PATH"
    export GEM_HOME="$HOME/.ruby"
}

_bashrc
unset -f _bashrc


# Tab completion
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'


# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

## SMARTER TAB-COMPLETION (Readline bindings) ##
BASH_AUTOCOMPLETION=true

if [[ $BASH_AUTOCOMPLETION == "true" ]]; then
    # Perform file completion in a case insensitive fashion
    bind "set completion-ignore-case on"

    # Treat hyphens and underscores as equivalent
    bind "set completion-map-case on"

    # Display matches for ambiguous patterns at first tab press
    bind "set show-all-if-ambiguous on"

    # Immediately add a trailing slash when autocompleting symlinks to directories
    bind "set mark-symlinked-directories on"
fi

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=1000000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars


if [ -z $DISPLAY ] && [ "$(tty)" == "/dev/tty1" ]; then
  read -p "Start Sway? (y/n): " yn
  if [[ $yn == "y" ]]; then
    _xrd=/tmp/.xdg_runtime/g4s8
    mkdir -pv "${_xrd}" && exec env XDG_RUNTIME_DIR="${_xrd}" dbus-run-session sway
  fi
fi
# complete -C /usr/bin/terraform terraform

# for ruby https://github.com/rbenv/rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - bash)"
