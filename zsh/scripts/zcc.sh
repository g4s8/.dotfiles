src=${1%.*} # filename without extension, e.g. mkcd.sh -> mkcd

echo "compiling zsh function $src.zwc"
mv $src.sh $src
zsh -c "zcompile $src"
rm $src
