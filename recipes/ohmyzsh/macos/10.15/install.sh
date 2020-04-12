#!/bin/bash

QUICKSET_PREREQUISITES=( homebrew );

for i in "${QUICKSET_PREREQUISITES[@]}"
do
   QUICKSET_PREQREQ_REPO_URL="https://raw.githubusercontent.com/onesupercoder/quickset/master/recipes/${i}/macos/10.15/install.sh"
   eval "$(curl -fsSL "$QUICKSET_PREQREQ_REPO_URL")";
done;

printf "* Installing Oh-My-Zsh... ";
which -s upgrade_oh_my_zsh;
if [[ $? = 0 ]] ; then
  upgrade_oh_my_zsh;
else
  which -s zsh;
  if [ $? = 0 ]; then
    bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
  else
    brew install zsh;
    chsh -s /bin/zsh;
    bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi;
fi;
printf " Done.";



