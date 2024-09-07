#!/bin/bash

COMMIT_FROM=$1
COMMIT_FORMAT=$2

COMMIT_LIST=$(git log $COMMIT_FROM..HEAD --format="${COMMIT_FORMAT}" --reverse)

echo "COMMIT_LIST=${COMMIT_LIST}" >&2

echo "${COMMIT_LIST}"