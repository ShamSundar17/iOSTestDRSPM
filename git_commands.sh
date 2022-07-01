#!/usr/bin/env bash

for i in "$@"
do
case $i in
    -m=*|--message=*)
    MESSAGE="${i#*=}"
    shift # past argument=value
    ;;
    -v=*|--version=*)
    VERSION="${i#*=}"
    shift # past argument=value
    ;;
esac
done

git add .
git commit -m "$MESSAGE" --quiet
git push -u origin main --quiet
# gh release create $VERSION ../Digita1Reef/DigitalReefiOS/build/SDK_$VERSION.zip



