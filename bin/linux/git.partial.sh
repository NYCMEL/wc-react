#!/bin/sh

usage ()
{
  echo 'Usage : git.partial <path-to-git-repo> <partial-folder-name>'
  exit
}

if [ "$#" -ne 2 ]
then
  usage
fi

cd /tmp
rm -rf test

git init test
cd test
git remote add origin $1
git config core.sparsecheckout true
echo "$2/*" >> .git/info/sparse-checkout
git pull --depth=1 origin master
