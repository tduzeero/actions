#!/bin/bash

CURRENT_TAG="v$1"
COMMIT_LIST="v$3"
MESSAGE=$(prinf $2 "${CURRENT_TAG}" "$COMMIT_LIST")

echo "Tag version: ${CURRENT_TAG}" >&2
echo "Commits from last tag: ${COMMIT_LIST}" >&2

exit 1

git tag -a "${CURRENT_TAG}" -m "${MESSAGE}"
git push origin tag "${CURRENT_TAG}"
