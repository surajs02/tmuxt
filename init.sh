#!/bin/bash

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

currentDir="$(dirname $BASH_SOURCE)" # current dir is based on where init.sh was launched from
loadSettingsFile="$currentDir/loadSettings.sh"
if ! test -f $loadSettingsFile; then
    echo "Cannot load settings, no file found at [$loadSettingsFile]"
    return 1
fi
. $loadSettingsFile

if test -f $TMUXT_CLI_PATH; then
    if ! test -f $TMUXT_TEMPLATES_PATH; then
        ensureDirExists $TMUXT_TEMPLATES_PATH
        # Setup tab autocompletion
        # (Double quotes to preserve spaces for wordlist)
        complete -W "$TMUXT_TEMPLATES_PATH" $TMUXT_CLI_PATH
    fi
else
    echo "No tmuxt command found at [$TMUXT_CLI_PATH]"
    exit 1
fi