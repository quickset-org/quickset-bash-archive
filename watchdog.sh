#!/bin/bash

#Ubuntu: sudo apt install entr
#Mac: brew install entr

find . -name '*.sh' | entr ./quickset.sh scala