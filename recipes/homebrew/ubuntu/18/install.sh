#!/bin/bash

which -s brew;
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    brew update;
    brew upgrade;
    brew cleanup;
fi;

