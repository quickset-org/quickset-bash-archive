#!/bin/bash

set -e


QUICKSET_PREREQUISITES=( homebrew );

for i in "${QUICKSET_PREREQUISITES[@]}"
do
   QUICKSET_PREQREQ_REPO_URL="https://raw.githubusercontent.com/${i}/macos/10.15/master/recipes/install.sh"
   /bin/bash -c "$(curl -fsSL "$QUICKSET_PREQREQ_REPO_URL")";
done;


brew install zsh

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"