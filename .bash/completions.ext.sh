# bash autocompletions

for comp in $(find $HOME/.bash/completions -type f); do
  source $comp
done
