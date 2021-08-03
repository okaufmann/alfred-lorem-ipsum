#!/usr/bin/env bash
set -e

newVersion=${1:-0.0.0}

fileName="alfred-lorem-ipsum.alfred3workflow"

echo "cleanup"
rm -Rf $fileName

echo "replacing version"
sed "s/{VERSION}/$newVersion/g" info.plist.example > info.plist

echo "create zip"
zip -r "../$fileName" . -x "*.DS_Store" -x "*/\.DS_Store" -x "info.plist.example" -x ".git/*"
