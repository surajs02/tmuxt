#!/bin/bash

# Setup loading tmuxt settings via .bashrc
userBashRc="$HOME/.bashrc"
if [[ `cat $userBashRc | grep -ic tmuxt` < 1 ]]; then
    # only add setup to .bashrc if not already added
    echo ". $PWD/init.sh" >> $userBashRc && . $userBashRc
fi