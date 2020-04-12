#!/bin/bash

if [ -f ~/.sdkman ]; then
  printf "* Installing SDK Man... ";
  sdk upgrade;
  printf " Done.\n";
else
  printf "* Installing SDK Man... ";
  curl -s "https://get.sdkman.io" | bash;
  source "$HOME/.sdkman/bin/sdkman-init.sh";
  printf " Done.\n";
fi

