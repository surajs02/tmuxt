#!/bin/bash

userBashRc="$HOME/.bashrc"
# only remove setup if exists
if [[ `cat $userBashRc | grep -ic tmuxt` > 0 ]]; then
    sed -i '/tmuxt/Id' $userBashRc
    echo 'tmuxt successfully uninstalled'
    return 0
fi

echo 'cannot uninstall: tmuxt not installed'
return 1