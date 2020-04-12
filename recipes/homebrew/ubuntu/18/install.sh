#!/bin/bash

printf "* Installing Homebrew... ";
which -s brew;
if [[ $? != 0 ]] ; then
    eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    brew update;
    brew upgrade;
    brew cleanup;
fi;
printf " Done.\n";