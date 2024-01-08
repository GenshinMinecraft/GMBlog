#/bin/bash

rm -rf ./resources ./public
hugo
git add .
git commit -m "`date`"
git push
