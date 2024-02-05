#/bin/bash

#rm -rf ./resources ./public
hugo
#rm -rf ./resources
git add .
git commit -m "`date`"
git push
cd public/
bash zip.sh
