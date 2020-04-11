#!/bin/bash

sudo apt install zsh

chsh -s /bin/zsh

sh -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

