hugo --gc -v --buildDrafts --buildExpired --buildFuture

git checkout main
git add .
git commit -S -m "`date`"
git push
