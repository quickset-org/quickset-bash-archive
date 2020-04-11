#!/bin/bash

set -e

if [ -f ~/.sdkman ]; then
  sdk upgrade;
else
  curl -s "https://get.sdkman.io" | bash;
  source "$HOME/.sdkman/bin/sdkman-init.sh";
fi

