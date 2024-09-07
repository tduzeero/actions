#!/bin/bash

VERSION_FROM=$1
CURRENT_VERSION=$2
MATCH_PATTERN="v+([0-9]|!(*[a-z]*)[0-9]).+([0-9]|!(*[a-z]*)[0-9]).+([0-9]|!(*[a-z]*)[0-9])"

if [[ $VERSION_FROM == "git" ]]; then
  CURRENT_TAG=$(git describe --tags --abbrev=0 --match="${MATCH_PATTERN}")
  echo "CURRENT_TAG: ${CURRENT_TAG}" >&2
  if [[ $CURRENT_TAG != "" ]]; then
    CURRENT_VERSION=$CURRENT_TAG
  fi
fi

echo "VERSION_FROM: ${VERSION_FROM}" >&2
echo "CURRENT_VERSION: ${CURRENT_VERSION}" >&2

echo "${CURRENT_VERSION}"