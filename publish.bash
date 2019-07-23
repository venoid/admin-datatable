#!/bin/bash

# run linter
npm run lint
[[ $? -eq 1 ]] && exit || echo "Lint OK"

# Build project and publish library
npm run build-bundle && yarn publish
