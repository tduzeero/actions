#!/bin/bash

NEW_VERSION=$1
TAG_MESSAGE=$2
COMMIT_LIST=$3
COMMIT_LIST_SEP=$4
COMMIT_MESSAGE=$(printf "${TAG_MESSAGE}" "${NEW_VERSION}" "${COMMIT_LIST//$COMMIT_LIST_SEP//$'\n'}")

git push origin :v${NEW_VERSION}
git tag -d v${NEW_VERSION}

echo "COMMIT_MESSAGE: ${COMMIT_MESSAGE}" >&2

git tag -a -m "${COMMIT_MESSAGE}" "v${NEW_VERSION}"
git push origin tag "v${NEW_VERSION}"
