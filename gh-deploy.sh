#!/bin/sh
# This script is to deploy the _html folder to gh-pages
# For what it's doing, see https://gist.github.com/cobyism/4730490
if [ -z "$1" ]
then
  echo "Which folder do you want to deploy to GitHub Pages?"
  exit 1
fi
git subtree push --prefix $1 origin gh-pages

# If you're getting git errors about the remote behind behind:
# 1. On GitHub, change your default branch to something other than gh-pages.
# (You'll change it back soon.)
# 2. Delete the gh-pages branch.
# 3. Locally, run the command again:
# git subtree push --prefix $1 origin gh-pages
# where $1 is the folder you're pushing to gh-pages.
# 4. On GitHub.com, change your default branch back to gh-pages.
