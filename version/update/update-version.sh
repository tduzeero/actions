#!/bin/sh

VERSION="$1"
MESSAGE=$(prinf $2 "${VERSION}")

sed -i '/"version": *"[0-9].[0-9].[0-9]"/ s/"[0-9].[0-9].[0-9]"/"'$VERSION'"/' package.json

git add .
git commit -m $MESSAGE
git push