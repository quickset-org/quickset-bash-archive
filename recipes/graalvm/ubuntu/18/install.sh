#!/bin/bash

QUICKSET_LATEST_GRAALVM_VERSION="20.0.0.r11-grl"
QUICKSET_PREREQUISITES=( sdkman );

printf "* Installing Oh-My-Zsh... ";
for i in "${QUICKSET_PREREQUISITES[@]}"
do
   QUICKSET_PREQREQ_REPO_URL="https://raw.githubusercontent.com/onesupercoder/quickset/master/recipes/${i}/ubuntu/18/install.sh"
   eval "$(curl -fsSL "$QUICKSET_PREQREQ_REPO_URL")";
done;

printf "* Installing graalvm.."

/bin/bash -c "sdk install java "$QUICKSET_LATEST_GRAALVM_VERSION"";
/bin/bash -c "sdk default java "$QUICKSET_LATEST_GRAALVM_VERSION"";

echo "  Done."