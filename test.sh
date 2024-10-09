
VERSION_FROM='git'
CURRENT_VERSION='v0.0.1'
COMMIT_LIST="ec66eb4 feat: update create-tag.yml - wxyzeero@gmail.com:::72f3edf fix: update create-tag.yml - wxyzeero@gmail.com:::88c382c Fix/create tag 6 (#11) - wxyzeero@gmail.com:::785ba2e fix: update create-tag.yml - wxyzeero@gmail.com:::e518d1d fix: update create-tag.yml - wxyzeero@gmail.com:::6e03014 fix: update create-tag.yml - wxyzeero@gmail.com:::aeb8daf fix: update create-tag.yml - wxyzeero@gmail.com:::5810403 fix: update create-tag.yml - wxyzeero@gmail.com:::0eda1b1 fix: update create-tag.yml - wxyzeero@gmail.com:::a094618 fix: update create-tag.yml - wxyzeero@gmail.com:::84147bb fix: update create-tag.yml - wxyzeero@gmail.com:::ff563be chore: update workflows - wxyzeero@gmail.com:::"
COMMIT_LIST_SEP=":::"
TAG_MESSAGE='New version %s\n\n Log changes: \n\n%s'

# NEW_VERSION=$(bash version/computed/get-computed-version.sh "$VERSION_FROM" "$CURRENT_VERSION" "$COMMIT_LIST" "$COMMIT_LIST_SEP")

# COMMIT_MESSAGE=$(printf "${TAG_MESSAGE}" "${NEW_VERSION}" "${COMMIT_LIST//$COMMIT_LIST_SEP//$'\n'}")

# echo "COMMIT_MESSAGE: ${COMMIT_MESSAGE}" >&2

LAST_VERSION=$(npm info @tduzeero/cdommon version --silent)
echo $LAST_VERSION