#!/bin/bash

QUICKSET_PREREQUISITES=( homebrew );

for i in "${QUICKSET_PREREQUISITES[@]}"
do
   QUICKSET_PREQREQ_REPO_URL="https://raw.githubusercontent.com/onesupercoder/quickset/master/${i}/recipes/macos/10.15/install.sh"
   /bin/bash -c "$(curl -fsSL "$QUICKSET_PREQREQ_REPO_URL")";
done;

brew install zsh

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"