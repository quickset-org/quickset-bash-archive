#!/bin/bash

QUICKSET_PREREQUISITES=( ohmyzsh graalvm );

for i in "${QUICKSET_PREREQUISITES[@]}"
do
   QUICKSET_PREQREQ_REPO_URL="https://raw.githubusercontent.com/${i}/macos/10.15/master/recipes/install.sh"
   /bin/bash -c "$(curl -fsSL "$QUICKSET_PREQREQ_REPO_URL")";
done;

