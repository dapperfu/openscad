#!/usr/bin/env bash

echo "# Previews" > previews.md

for var in "$@"
do
    echo "![${var}](${var})" >> previews.md
done
