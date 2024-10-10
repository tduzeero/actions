#!/bin/bash

NEW_VERSION="$1"
COMMIT_MESSAGE=$(printf "$2" "${NEW_VERSION}")

echo "COMMIT_MESSAGE: ${COMMIT_MESSAGE}" >&2

git pull

sed -ie 's/"version": .*"/"version": '\"${$NEW_VERSION}\"'/g' package.json

git add .
git commit -m "$COMMIT_MESSAGE"
git push