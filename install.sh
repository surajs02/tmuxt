#!/bin/bash

tmuxtCmdPath='./tmuxt.sh'
tmuxtDirPath='~/.tmuxt'
templatesDirPath="$tmuxtDirPath/templates"

function ensureDirExists {
    if test ! -d "$1"; then
        mkdir "$1"
    fi
}

function isDirEmpty {
    if [ -z "$(ls -A $1)" ]; then
        return 0
    fi
    return 1
}

if test -f "$tmuxtCmdPath"; then
    ensureDirExists "$tmuxtDirPath"
    ensureDirExists "$templatesDirPath"
else
    echo "No tmuxt command found at $tmuxtCmdPath"
    exit
fi
