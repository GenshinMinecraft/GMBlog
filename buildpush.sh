#/bin/bash

sudo chmod 777 * -R
#rm -rf ./resources ./public
hugo
#rm -rf ./resources
git add .
git commit -m "`date`"
git push
