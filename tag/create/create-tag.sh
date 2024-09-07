#!/bin/bash

CURRENT_VERSION="v$1"
COMMIT_LIST="v$3"
COMMIT_MESSAGE=$(prinf $2 "${CURRENT_VERSION}" "$COMMIT_LIST")

echo "COMMIT_MESSAGE: ${CURRENT_VERSION}" >&2

exit 1

git tag -a "${CURRENT_VERSION}" -m "${MESSAGE}"
git push origin tag "${CURRENT_VERSION}"
