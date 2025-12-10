#!/bin/sh

# aliases

# common utils
alias l="ls"
alias ll="ls -lgGhv"
alias la="ls -lA"
alias lah="ls -lAh"

# maven
if command -v mvn 2>&1 /dev/null ; then
  alias mcp="mvn clean package"
  alias mcv="mvn clean verify"
fi

# kubectl
if command -v kubectl 2>&1 /dev/null ; then
  alias k="kubectl"
fi

# git
if command -v git 2>&1 /dev/null ; then
  alias gst="git status"
  alias gs="git status -s"
  alias gd="git diff"
  alias gds="git diff --staged"
  alias gprom="git pull --rebase origin master"
  alias gca="git commit --amend"
fi

alias "?"="echo $?"

# shortcats
if command -v python3 2>&1 /dev/null ; then
  alias py="python3"
fi

# cd
alias ...="cd ../.."
alias ....="cd ../../.."

# special
# alias :q="exit"
