# env - custom bash environment variables

# GPG terminal path
export GPG_TTY=$(tty)

function _append_path {
  local dir=$1
  [[ -d $dir ]] && export PATH="${dir}:$PATH"
}

# PATH
_append_path $HOME/.local/bin
_append_path $HOME/go/bin
_append_path $HOME/.cargo/bin
_append_path $HOME/.foundry/bin
_append_path /opt/bin

# go private repos, add each goprivate line to ~/.config/goprivate
if [[ -f $HOME/.config/goprivate ]]; then
  goprivate=
  while IFS= read -r; do
    [[ -n $REPLY ]] && {
      if [[ -n $goprivate ]]; then
        goprivate="${goprivate},$REPLY"
      else
        goprivate=$REPLY
      fi
    }
  done < $HOME/.config/goprivate
  if [[ -n $goprivate ]]; then
    if [[ -n $GOPRIVATE ]]; then
      goprivate="${GOPRIVATE},$goprivate"
    fi
    export GOPRIVATE=$goprivate
  fi
fi

export GOPROXY="https://proxy.golang.org,direct"
export GOSUMDB="sum.golang.org"

