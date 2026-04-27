
# utils.sh - utils shell functions

# add-ssh - function to help add ssh key
function add-ssh {
    local key=$1
    if [[ -z $key ]]; then
        keys=()
        while IFS= read -r -d $'\0'; do
            keys+=("$REPLY")
        done < <(find $HOME/.ssh -name .archive -prune -false -or \( -type f ! -name '*.pub' ! -name 'known_hosts' ! -name 'config' \) -print0 | sort -z)
#-exec basename {} \;)
        echo "Available ssh key:"
        for i in ${!keys[*]}; do
            echo " $(($i+1)). $(basename ${keys[$i]})"
        done
      echo -n "Select number: "
      read num
      key=${keys[$(($num-1))]}
    fi
    [[ -f $key ]] || {
      clear
      echo "Key file has not been found"
      return
    }
    [[ -z $SSH_AUTH_SOCK ]] && eval $(ssh-agent)
    ssh-add $key
    clear
    echo "added ssh-key ${key}"
}

# bash-reload - function to reload rc file
function bash-reload {
    source $HOME/.bashrc
}

# cdtmp - cd into new tmp dir
function cdtmp {
    cd $(mktemp --directory)
}

# rmrf - rm with -rf options
function rmrf {
    rm -rf $1
}

# trash - move to .trash dir
function trash {
    local dir=".trash"
    mkdir -p $dir
    for f in $@; do
      mv $f -t $dir
    done
}

# tailf - tail -f
function tailf {
    tail -f $1
}

# gbda - delete all merged to master branch
function gbda {
    git branch --no-color --merged | command grep -vE "^(\*|\s*(master)\s*$)" | command xargs -n 1 git branch -d
}

# mkcd - mkdir and cd into it
function mkcd {
    local target=$1
    mkdir -p $target && cd $target
}

# kittens

# show image
function img {
  kitty +kitten icat $1
}

# show diff
function kd {
  kitty +kitten diff $1 $2
}

# reload source
function resource {
  source $HOME/.bashrc
}

# send signal to all processes with given name
function _sigall {
  for pid in $(pidof "$1"); do
    kill "$2" $pid
    echo "killed $1 - $pid"
  done
}

function termall {
  _sigall "$1" "-TERM"
}

function killall {
  _sigall "$1" "-KILL"
}

