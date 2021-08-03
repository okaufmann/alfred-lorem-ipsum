#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."

newVersion=$1

fileName="alfred-lorem-ipsum.alfred3workflow"

echo "cleanup"
rm -Rf $fileName

echo "replacing version"
sed "s/{VERSION}/$newVersion/g" src/info.plist.example > src/info.plist

echo "create zip"
zip -r "../$fileName" . -x "*.DS_Store" -x "*/\.DS_Store" -x "info.plist.example"

open $fileName