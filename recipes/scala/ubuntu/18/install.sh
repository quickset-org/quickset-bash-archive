#!/bin/bash

QUICKSET_PREREQUISITES=( ohmyzsh graalvm );

for i in "${QUICKSET_PREREQUISITES[@]}"
do

   QUICKSET_PREQREQ_REPO_URL="https://raw.githubusercontent.com/onesupercoder/quickset/master/recipes/${i}/macos/10.15/install.sh"
   /bin/bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL "$QUICKSET_PREQREQ_REPO_URL")";
done;

