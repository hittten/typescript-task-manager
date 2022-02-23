#!/bin/bash

commits=(
  ""
)
tags=(
  "init"
)

# get length of an array
tagsLength=${#tags[@]}

# use for loop to read all values and indexes
for (( i=0; i<${tagsLength}; i++ ));
do
  echo "Tagging: ${commits[$i]} with tag: ${tags[$i]}"
  git co "${commits[$i]}"
  git tag -a "${tags[$i]}" -m ${tags[$i]} --force
done
