#!/bin/bash

USER_FROM=$1
APP_SLUG=$2
USER_ID=$3

USER_NAME="github-actions[bot]"
USER_EMAIL="41898282+github-actions[bot]@users.noreply.github.com"

if [[ "$USER_FROM" == "app-bot" ]]; then
  USER_NAME="${APP_SLUG}[bot]"
  USER_EMAIL="${USER_ID}+${APP_SLUG}[bot]@users.noreply.github.com"
fi

if [[ "$USER_FROM" == "commit-head" ]]; then
  USER_NAME=$(git show -s --format='%an')
  USER_EMAIL=$(git show -s --format='%ae')
fi

echo "USER_FROM: ${USER_FROM}" >&2
echo "USER_NAME: ${USER_NAME}" >&2
echo "USER_EMAIL: ${USER_EMAIL}" >&2

git config user.name $USER_NAME
git config user.email $USER_EMAIL