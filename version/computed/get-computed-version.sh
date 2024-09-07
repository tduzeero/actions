#!/bin/bash

VERSION_FROM=$1
COMPUTED_VERSION=$2
COMMIT_LIST=$3
COMMIT_LIST_SEP=$4

if [[ $VERSION_FROM == "git" && $COMMIT_LIST != "" ]]; then

  MAJOR=$(echo $COMPUTED_VERSION | cut -d'.' -f 1)
  MINOR=$(echo $COMPUTED_VERSION | cut -d'.' -f 2)
  PATCH=$(echo $COMPUTED_VERSION | cut -d'.' -f 3)

  OLDIFS="$IFS"
  IFS=$'\n'
  for COMMIT in ${COMMIT_LIST//$COMMIT_LIST_SEP/$'\n'}; do
    COMMIT_SHA=${COMMIT:0:7}
    DESCRIPTION=''

    if [[ $(git rev-parse --symbolic-full-name $sha) = refs/* ]]; then
      DESCRIPTION=$(git show -s --format=%B $COMMIT_SHA)
    fi

    if [[ "$COMMIT" == *"!:"* || "$DESCRIPTION" == *"BREAKING CHANGE:"* ]]; then
      MAJOR=$(($MAJOR + 1))
      MINOR=0
      PATCH=0
      continue
    fi

    if [[ "$COMMIT" == *"feat:"* ]]; then
      MINOR=$(($MINOR + 1))
      PATCH=0
      continue
    fi

    PATCH=$(($PATCH + 1))

  done
  IFS="$OLDIFS"

  COMPUTED_VERSION="${MAJOR}.${MINOR}.${PATCH}"

fi

echo "COMPUTED_VERSION: ${COMPUTED_VERSION}" >&2

echo "${COMPUTED_VERSION}"