#!/bin/bash

VERSION_FROM=$1
CURRENT_VERSION=$2
COMMITS=$3

if [[ $VERSION_FROM == "git" && $COMMITS != "" ]]; then

  CURRENT_VERSION_NUMBER=$(echo $CURRENT_VERSION | cut -d'v' -f 2)

  MAJOR=$(echo $CURRENT_VERSION_NUMBER | cut -d'.' -f 1)
  MINOR=$(echo $CURRENT_VERSION_NUMBER | cut -d'.' -f 2)
  PATCH=$(echo $CURRENT_VERSION_NUMBER | cut -d'.' -f 3)

  OLDIFS="$IFS"
  IFS=$'\n'
  for COMMIT in $COMMITS; do
    COMMIT_SHA=${COMMIT:0:7}
    DESCRIPTION=$(git show -s --format=%B $COMMIT_SHA)

    if [[ $COMMIT == *"!:"* || $DESCRIPTION == *"BREAKING CHANGE:"* ]]; then
      MAJOR=$(($MAJOR + 1))
      MINOR=0
      PATCH=0
      continue
    fi

    if [[ $COMMIT == *"feat:"* ]]; then
      MINOR=$(($MINOR + 1))
      PATCH=0
      continue
    fi

    PATCH=$(($PATCH + 1))

  done
  IFS="$OLDIFS"

  CURRENT_VERSION="${MAJOR}.${MINOR}.${PATCH}"

fi

echo "${CURRENT_VERSION}"