#!/bin/bash

NEW_VERSION=$1
TAG_MESSAGE=$2
COMMIT_LIST=$3
COMMIT_LIST_SEP=$4
COMMIT_MESSAGE=$(printf "${TAG_MESSAGE}" "${NEW_VERSION}" "${COMMIT_LIST//$COMMIT_LIST_SEP//$'\n'}")

echo "COMMIT_MESSAGE: ${NEW_VERSION}" >&2

git push origin :v${NEW_VERSION}
git tag -d v${NEW_VERSION}

git tag -a -m "${MESSAGE}" "v${NEW_VERSION}"
git push origin tag "v${NEW_VERSION}"
