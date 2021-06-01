#!/bin/ash
set -o errexit
set -o nounset

echo "Installing node_modules"
yarn install

echo "Running yarn command: $@"
yarn "$@"
