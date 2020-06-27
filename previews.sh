#!/usr/bin/env bash

echo "# Previews" > previews.md

for var in "$@"
do
	echo "## ${var}" >> previews.md
    echo "![${var}](${var})" >> previews.md
done
