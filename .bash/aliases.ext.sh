#!/bin/sh

# aliases

# common utils
alias l="ls"
alias ll="ls -lgGhv"
alias la="ls -lA"
alias lah="ls -lAh"

# maven
alias mcp="mvn clean package"
alias mcv="mvn clean verify"

# kubectl
alias k="kubectl"
alias kcaf="kubectl apply -f"
alias kcdf="kubectl delete -f"
alias kccf="kubectl create -f"
alias kcgp="kubectl get pod"
alias kcgs="kubectl get svc"

# bash
alias gst="git status"
alias gs="git status -s"
alias gd="git diff"
alias gds="git diff --staged"
alias gprom="git pull --rebase origin master"
alias gca="git commit --amend"

alias "?"="echo $?"

# shortcats
alias py="python3"

# cd
alias ...="cd ../.."
alias ....="cd ../../.."

# special
alias :q="exit"
