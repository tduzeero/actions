#!/bin/bash

VERSION="$1"
COMMIT_MESSAGE=$(printf $2 "${VERSION}")

echo "COMMIT_MESSAGE=${COMMIT_MESSAGE}"

exit 1

sed -i '/"version": *"[0-9].[0-9].[0-9]"/ s/"[0-9].[0-9].[0-9]"/"'$VERSION'"/' package.json

git add .
git commit -m $COMMIT_MESSAGE
git push