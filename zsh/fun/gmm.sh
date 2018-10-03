
gmm() {
  local remote=$1
  git fetch $remote master:master
  git merge --no-ff --no-commit master
  git commit -S --no-edit
}

gmm "$@"
