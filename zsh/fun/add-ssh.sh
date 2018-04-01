local key=$1
[[ -z $key ]] && {
  keys=$(\
    find $HOME/.ssh \
      -type f \
      ! -name '*.pub' \
      ! -name 'known_hosts' \
      -exec basename {} \;\
  )
  echo "Available ssh key:"
  echo $keys | awk '{printf "  %d. %s\n", NR, $0 }'
  echo -ne "Select number: "
  read num
  key=$(echo $keys | awk 'FNR == '$num' {print}')
}
local key_file=$HOME/.ssh/$key
[[ -f $key_file ]] || {
  echo "Key file has not been found"
  return
}
[[ -z $SSH_AUTH_SOCK ]] && eval $(ssh-agent)
ssh-add $key_file
