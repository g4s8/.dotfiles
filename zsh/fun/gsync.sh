remote=$1
echo "syncing with ${remote}"
git pull $remote master
git fetch $remote -pv
