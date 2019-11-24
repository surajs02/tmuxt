#!/bin/bash

# this script must be sourced to get vars and return correctly

# Exit if settings were previously loaded
if [[ -v TMUXT_SETTINGS_LOADED ]] && [ $TMUXT_SETTINGS_LOADED -eq 0 ]; then
    return 0
fi

tmuxtIniFile="./tmuxt.ini"

if ! test -f $tmuxtIniFile; then
    echo "No file found at [$tmuxtIniFile]"
    return 1
fi

# Load vars
. $tmuxtIniFile # ini file will assign values to tmuxt vars
tmuxtVars=$(cat $tmuxtIniFile | cut -d='' -f1)
export $tmuxtVars

# Error if no vars
totalVars=$(echo $tmuxtVars | wc -w)
if [ $totalVars -le 0 ]; then
    export TMUXT_SETTINGS_LOADED=1
    echo "error loading [$tmuxtIniFile]"
    return 1
fi

export TMUXT_SETTINGS_LOADED=0
echo "tmuxt settings loaded"
