#!/bin/bash

NEW_VERSION="v$1"
COMMIT_LIST="v$3"
COMMIT_LIST_SEP=$4
COMMIT_MESSAGE=$(prinf $2 "${NEW_VERSION}" "${COMMIT_LIST//$COMMIT_LIST_SEP//$'\n'}")

echo "COMMIT_MESSAGE: ${NEW_VERSION}" >&2

exit 1

git tag -a "v${NEW_VERSION}" -m "${MESSAGE}"
git push origin tag "v${NEW_VERSION}"
