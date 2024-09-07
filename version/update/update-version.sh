#!/bin/bash

NEW_VERSION="$1"
COMMIT_MESSAGE=$(printf $2 "${NEW_VERSION}")

echo "COMMIT_MESSAGE: ${COMMIT_MESSAGE}" >&2

sed -i '/"version": *"[0-9].[0-9].[0-9]"/ s/"[0-9].[0-9].[0-9]"/"'$NEW_VERSION'"/' package.json

git add .
git commit -m $COMMIT_MESSAGE
git push