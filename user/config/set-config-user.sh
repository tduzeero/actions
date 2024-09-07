#!/bin/bash

USER_FROM=$1
USER_NAME="github-actions[bot]"
USER_EMAIL="41898282+github-actions[bot]@users.noreply.github.com"

echo "USER_FROM=${USER_FROM}" >&2

if [[ "$USER_FROM" == "commit-head" ]]; then
  USER_NAME=$(git show -s --format='%an')
  USER_EMAIL=$(git show -s --format='%ae')
fi

echo "USER_NAME=${USER_NAME}" >&2
echo "USER_EMAIL=${USER_EMAIL}" >&2

git config user.name $USER_NAME
git config user.email $USER_EMAIL