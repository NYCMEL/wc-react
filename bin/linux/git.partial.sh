#!/bin/sh

usage ()
{
  echo 'Usage : git.partial -repo <path-to-git-repo> -folder <partial-folder-name>'
  exit
}

# CHECK ARGUMENT COUNT
if [ "$#" -ne 4 ]
then
  usage
fi

# ASSIGN VARIABLES FROM OPTIONS
while [ "$1" != "" ]; do
case $1 in
        -repo   ) shift
                  REPO=$1
                  ;;

        -folder ) shift
                  FOLDER=$1
                  ;;
    esac
    shift
done

echo '\n\tEXECUTING: git.partial -repo' $REPO ' -folder' $FOLDER
echo '\n-------------------------------------------------------'

# EXECUTE REQUIRED COMMANDS
cd /tmp
rm -rf test

git init test
cd test
git remote add origin $REPO
git config core.sparsecheckout true
echo "$FOLDER/*" >> .git/info/sparse-checkout
git pull --depth=1 origin master
echo '-------------------------------------------------------'
echo '\tCREATED /tmp/test folder\n'

