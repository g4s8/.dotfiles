
# utils.sh - utils shell functions

# add-ssh - function to help add ssh key
function add-ssh {
    local key=$1
    if [[ -z $key ]]; then
        keys=()
        while IFS= read -r -d $'\0'; do
            keys+=("$REPLY")
          done < <(find $HOME/.ssh -name .archive -prune -false -or \( -type f ! -name '*.pub' ! -name 'known_hosts' \) -print0)
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

# uniso - extract iso files to directory
function uniso {
    local iso=$1
    local dst=$2
    if [[ -z ${dst} ]]; then
        dst=$PWD
    fi
    mkdir -pv ${dst}
    local mnt=$(mktemp --directory)
    set -- sudo mount -o loop ${iso} ${mnt}
    echo "performing: $@"
    "$@"
    cp -vr ${mnt}/* -t ${dst}
    set -- sudo umount ${mnt}
    echo "performing: $@"
    "$@"
    rmdir ${mnt}
}

## git functions

function gcasm {
    git commit -a -S -m "$1"
}

function gcsm {
    git commit -S -m "$1"
}

# gmm - git merge master
function gmm {
    local remote=$1
    if [[ -z $remote ]]; then
        remote="origin"
    fi
    git fetch $remote master:master
    git merge --no-ff --no-commit master
    git commit -S --no-edit
}

function gsync {
    local remote=$1
    if [[ -z $remote ]]; then
        remote="origin"
    fi
    local branch=$(git rev-parse --abbrev-ref HEAD)
    echo "pulling $remote:$branch"
    git pull $remote $branch
    git fetch $remote -pv
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

# calculate some arithmetics
function calc {
  python3 -c "print($@)"
}

# kittens

# show image
function ks {
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

