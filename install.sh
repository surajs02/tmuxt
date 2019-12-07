#!/bin/bash

# Setup loading tmuxt settings via .bashrc
userBashRc="$HOME/.bashrc"
# only add setup to .bashrc if not already added
if [[ `cat $userBashRc | grep -ic tmuxt` < 1 ]]; then
    echo "export PATH=$PWD"':$PATH' >> $userBashRc
    echo ". $PWD/init.sh" >> $userBashRc && . $userBashRc
    echo "tmuxt successfully installed via [$HOME/.bashrc]"
fi