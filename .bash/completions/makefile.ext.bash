function _make_targets_complete {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local makefile=${MAKEFILE:-Makefile}

  [[ -f $makefile ]] || return 0

  # Extract targets from the Makefile
  local targets
  targets=$(
    awk -F: '
      # Match lines that look like targets and not variable assignments
      /^[a-zA-Z0-9_.-]+[ \t]*:([^=]|$)/ {
        # First field before ":" can contain multiple targets
        n = split($1, t, /[ \t]+/)
        for (i = 1; i <= n; i++) {
          # Skip empty, .PHONY, and dot-targets in general
          if (t[i] != "" && t[i] !~ /^\./)
            print t[i]
        }
      }
    ' "$makefile" | sort -u
  )

  COMPREPLY=($(compgen -W "$targets" -- "$cur"))
}

complete -F _make_targets_complete make
