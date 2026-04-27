# bash autocompletions

for comp in $(find $HOME/.bashrc.d/completions -type f); do
  source $comp
done
