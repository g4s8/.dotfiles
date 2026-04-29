__bashrc_start="$EPOCHREALTIME"

if [[ -f /etc/bashrc ]]; then
  source /etc/bashrc
fi
if [[ -f /etc/bash/bashrc ]]; then
  source /etc/bash/bashrc
fi

if [[ -d ~/.bashrc.d ]]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      source "$rc"
    fi
  done
fi

__bashrc_end="$EPOCHREALTIME"
awk -v start="$__bashrc_start" -v end="$__bashrc_end" '
BEGIN {
    diff = end - start
    sec = int(diff)
    ns = int((diff - sec) * 1000000000)
    printf "bashrc loaded in %d.%09d seconds\n", sec, ns
}'
