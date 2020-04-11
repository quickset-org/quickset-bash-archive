#!/bin/bash

QUICKSET_PREREQUISITES=( ohmyzsh graalvm );

for i in "${QUICKSET_PREREQUISITES[@]}"
do
   QUICKSET_PREQREQ_REPO_URL="https://raw.githubusercontent.com/onesupercoder/quickset/master/${i}/recipes/macos/10.15/install.sh"
   /bin/bash -c "$(curl -fsSL "$QUICKSET_PREQREQ_REPO_URL")";
done;

