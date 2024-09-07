#!/bin/sh

VERSION=$1
MESSAGE=$2

git push origin :v${VERSION}
git tag -d v${VERSION}

git add .
git update-index --chmod=+x tag/commit/get-commit-list.sh
git update-index --chmod=+x tag/create/create-tag.sh
git update-index --chmod=+x user/config/set-config-user.sh
git update-index --chmod=+x version/computed/get-computed-version.sh
git update-index --chmod=+x version/current/get-current-version.sh
git update-index --chmod=+x version/update/update-version.sh
git commit -m "$MESSAGE"
git push

git tag -a -m "Version ${VERSION}" "v${VERSION}"
git push origin "v${VERSION}"