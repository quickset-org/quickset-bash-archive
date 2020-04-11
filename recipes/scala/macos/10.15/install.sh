#!/bin/bash

QUICKSET_PREREQUISITES=( ohmyzsh graalvm );

for i in "${QUICKSET_PREREQUISITES[@]}"
do
   QUICKSET_PREQREQ_REPO_URL="https://raw.githubusercontent.com/onesupercoder/quickset/master/recipes/${i}/macos/10.15/install.sh"
   echo "$QUICKSET_PREQREQ_REPO_URL";
   /bin/bash -c "$(curl -fsSL "$QUICKSET_PREQREQ_REPO_URL")";
done;

printf "* Installing Scala... ";
source "$HOME/.sdkman/bin/sdkman-init.sh";
sdk install scala 2.13.1
sdk default scala 2.13.1
printf " Done.";