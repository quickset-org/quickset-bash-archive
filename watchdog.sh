#!/bin/sh

#sudo apt install entr

find . -name '*.sh' | entr ./quickset.sh