#!/bin/sh

VERSION_FROM=$1
CURRENT_VERSION=$2

if [[ $VERSION_FROM == "git" ]]; then
  CURRENT_TAG=$(git describe --tags --abbrev=0)
  if [[ $CURRENT_TAG != "" ]]; then
    CURRENT_VERSION=$CURRENT_TAG
  fi
fi

echo "${CURRENT_VERSION}"