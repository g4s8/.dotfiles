V=1.2
TMP=$(mktemp -d)
cd ${TMP}
wget "https://github.com/g4s8/.dotfiles/archive/${V}.tar.gz"
tar xvzf "${V}.tar.gz"
cd ".dotfiles-${V}"
make all
rm -fr ${TMP}
