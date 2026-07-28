#!/bin/sh

branch=$(git branch | awk '/^\*/ { print $2 } ')

git checkout qa
git merge $branch
git push --force-with-lease
git checkout $branch
