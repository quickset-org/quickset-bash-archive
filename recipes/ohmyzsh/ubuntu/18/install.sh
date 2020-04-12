#!/bin/bash



if [ $0 = "-zsh" ]; then
  if [ -f ~/.oh-my-zsh ]; then
    upgrade_oh_my_zsh
  else
    bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi;
else
  sudo apt install zsh;
  chsh -s /bin/zsh;
  bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
fi;