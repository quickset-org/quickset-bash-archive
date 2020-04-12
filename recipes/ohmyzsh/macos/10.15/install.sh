#!/bin/bash

QUICKSET_PREREQUISITES=( homebrew );

for i in "${QUICKSET_PREREQUISITES[@]}"
do
   QUICKSET_PREQREQ_REPO_URL="https://raw.githubusercontent.com/onesupercoder/quickset/master/recipes/${i}/macos/10.15/install.sh"
   echo "$QUICKSET_PREQREQ_REPO_URL";
   /bin/bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL "$QUICKSET_PREQREQ_REPO_URL")";
done;

if [ $0 = "-zsh" ]; then
  if [ -f ~/.oh-my-zsh ]; then
    upgrade_oh_my_zsh
  else
    bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi;
else
  bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
  brew install zsh;
  chsh -s /bin/zsh;
fi;



