#!/bin/bash

COMMIT_FROM=$1
COMMIT_FORMAT=$2

COMMIT_LIST=$(git log $COMMIT_FROM..HEAD --format="${COMMIT_FORMAT}" --reverse)

OLDIFS="$IFS"
IFS=$'\n'
for COMMIT in $COMMIT_LIST; do
  echo "COMMIT: ${COMMIT}" >&2
done
IFS="$OLDIFS"

echo "${COMMIT_LIST}"