#!/bin/sh

VERSION=$1
MESSAGE=$2

git push origin :v${VERSION}
git tag -d v${VERSION}

git add .
git commit -m "$MESSAGE"
git push

git tag -a -m "Version ${VERSION}" "v${VERSION}"
git push origin "v${VERSION}"