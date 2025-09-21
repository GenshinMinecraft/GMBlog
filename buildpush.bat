hugo --gc --logLevel debug --buildDrafts --buildExpired --buildFuture

git checkout main
git add .
git commit -m "`date`"
git push
