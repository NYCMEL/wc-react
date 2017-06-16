#!/bin/sh

# USE IT LIKE: ./git.partial "jq/*"

cd /tmp
rm -rf test

git init test
cd test
git remote add origin https://github.com/NYCMEl/tk-components.git
git config core.sparsecheckout true
echo "$1" >> .git/info/sparse-checkout
git pull --depth=1 origin master
