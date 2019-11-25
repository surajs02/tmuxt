#!/bin/bash

# Setup loading tmuxt settings via .bashrc
userBashRc="$HOME/.bashrc"
if [[ `cat $userBashRc | grep -ic tmuxt` < 1 ]]; then
    # only add setup to .bashrc if not already added
    echo -e "\n# Load tmuxt settings\n. $PWD/loadSettings.sh" >> $userBashRc && . $userBashRc
fi

function ensureDirExists {
    if test ! -d $1; then
        mkdir -vp $1
    fi
}

function isDirEmpty {
    if [ -z "$(ls -A $1)" ]; then
        return 0
    fi
    return 1
}

if test -f $TMUXT_CLI_PATH; then
    if ! test -f $TMUXT_TEMPLATES_PATH; then
        ensureDirExists $TMUXT_TEMPLATES_PATH
    fi
else
    echo "No tmuxt command found at [$TMUXT_CLI_PATH]"
    exit 1
fi