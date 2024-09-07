#!/bin/sh

USER_TYPE=$1
USER_NAME="github-actions[bot]"
USER_EMAIL="41898282+github-actions[bot]@users.noreply.github.com"

if [[ "$USER_TYPE" == "commit-head" ]]; then
  USER_NAME=$(git show -s --format='%an')
  USER_EMAIL=$(git show -s --format='%ae')
fi

git config user.name $USER_NAME
git config user.email $USER_EMAIL