#!/bin/bash

VERSION_FROM=$1
DEFAULT_VERSION=$2
PACKAGE_NAME=$3

echo "DEFAULT_VERSION: ${DEFAULT_VERSION}" >&2

MATCH_PATTERN="*$(git tag | grep -E "^(releases?\/|v)?[0-9]+\.[0-9]+\.[0-9]+$" | sed -E 's/.*([0-9]+\.[0-9]+\.[0-9]+)$/\1/' | sort -V -r | head -n 1)"

if [[ $VERSION_FROM == "git" ]]; then

  ONLINE_VERSION=""
  LOCAL_VERSION=$(git describe --tags --abbrev=0 --match="${MATCH_PATTERN}")
  
  if [[ $PACKAGE_NAME != "" ]]; then 
    ONLINE_VERSION=$(curl https://registry.npmjs.org/${PACKAGE_NAME} | jq '."dist-tags".latest' -r)
  else 
    ONLINE_VERSION=$(npm info get version --silent)
  fi

  if [[ $ONLINE_VERSION != "" ]]; then
    echo "CURRENT_VERSION from ONLINE: ${ONLINE_VERSION}" >&2
    DEFAULT_VERSION=$ONLINE_VERSION
  else 
    if [[ $LOCAL_VERSION != "" ]]; then
      echo "CURRENT_VERSION from LOCAL: ${LOCAL_VERSION}" >&2
      DEFAULT_VERSION=$(echo "$LOCAL_VERSION" | cut -d'v' -f 2)
    else
      echo "CURRENT_VERSION: Not Found" >&2
    fi
  fi

fi

echo "VERSION_FROM: ${VERSION_FROM}" >&2
echo "CURRENT_VERSION: ${DEFAULT_VERSION}" >&2

echo "${DEFAULT_VERSION}"