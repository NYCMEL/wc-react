#!/bin/sh

# USE IT LIKE:
#    ./git.partial https://github.com/NYCMEl/Melify-private.git emacs/*

#!/bin/sh

cd /tmp
rm -rf test

git init test
cd test
git remote add origin $1
git config core.sparsecheckout true
echo "$2" >> .git/info/sparse-checkout
git pull --depth=1 origin master
