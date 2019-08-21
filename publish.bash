#!/bin/bash

# run linter
npm run lint
[[ $? -eq 1 ]] && exit || echo "Lint OK"

# Build project and publish library with new version
npm run build && yarn publish --access public

git push --follow-tags
