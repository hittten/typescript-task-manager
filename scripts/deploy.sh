#!/bin/bash

tags=(
  "init"
)

# get length of an array
tagsLength=${#tags[@]}

# use for loop to read all values and indexes
for (( i=0; i<${tagsLength}; i++ ));
do
  echo "Deploying: ${tags[$i]}"
  git co "${tags[$i]}"
  npm run build
  firebase hosting:channel:deploy "${tags[$i]}" --expires 30d
done

git co main
npm run build
firebase deploy
