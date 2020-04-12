#!/bin/bash


printf "* Installing Oh-My-Zsh... ";
which -s zsh;
if [[ $? != 0 ]] ; then
  if [ -f ~/.oh-my-zsh ]; then
    upgrade_oh_my_zsh
  else
    bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi;
else
  sudo apt install zsh;
  chsh -s /bin/zsh;
  bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
fi;
printf " Done.";