#!/bin/bash

VERSION="$1"
MESSAGE=$(printf $2 "${VERSION}")

echo "MESSAGE=${MESSAGE}"

exit 1

sed -i '/"version": *"[0-9].[0-9].[0-9]"/ s/"[0-9].[0-9].[0-9]"/"'$VERSION'"/' package.json

git add .
git commit -m $MESSAGE
git push