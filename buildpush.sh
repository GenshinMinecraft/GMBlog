#/bin/bash
hugo
rm -rf ./resources ./public
git add .
git commit -m "`date`"
git push
