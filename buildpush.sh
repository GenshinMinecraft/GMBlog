#/bin/bash
hugo
rm -rf ./resources
git add .
git commit -m "`date`"
git push
