#!/bin/bash

# run linter
npm run lint
[[ $? -eq 1 ]] && exit || echo "Lint OK"

# Show current version
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

# Get package version
echo Enter new package version - current is $PACKAGE_VERSION :
read NEW_VERSION

# Set new version
npm version $NEW_VERSION

# Build project and publish library with new version
npm run build-bundle && npm publish --access public

git push
