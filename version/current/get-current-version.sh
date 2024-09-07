#!/bin/bash

VERSION_FROM=$1
DEFAULT_VERSION=$2
MATCH_PATTERN="*$(git tag | grep -E "^(releases?\/|v)?[0-9]+\.[0-9]+\.[0-9]+$" | sed -E 's/.*([0-9]+\.[0-9]+\.[0-9]+)$/\1/' | sort -V -r | head -n 1)"

if [[ $VERSION_FROM == "git" ]]; then
  CURRENT_TAG=$(git describe --tags --abbrev=0 --match="${MATCH_PATTERN}")
  if [[ $CURRENT_TAG != "" ]]; then
    echo "CURRENT_TAG: ${CURRENT_TAG}" >&2
    DEFAULT_VERSION=$(echo "$CURRENT_TAG" | cut -d'v' -f 2)
  else
    echo "CURRENT_TAG: Not Found" >&2
  fi
fi

echo "VERSION_FROM: ${VERSION_FROM}" >&2
echo "DEFAULT_VERSION: ${DEFAULT_VERSION}" >&2

echo "${DEFAULT_VERSION}"