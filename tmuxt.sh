#!/bin/bash

# Error if settings haven't been loaded
if [[ ! -v TMUXT_SETTINGS_LOADED ]]; then
	echo 'tmuxt settings failed to load, try again after installing tmuxt'
    exit 0
fi

shortHelp="usage: $(basename $0) [-hHl] [-a scriptPath] [-de script]"
longHelp=`cat <<EOF
NAME: 
	tmuxt -- tmux template script manager

SYNOPSIS:
	$shortHelp

DESCRIPTION:
	tmuxt is a simple script manager for tmux: it provides options for managing scripts

OPTIONS:
	-h 
		Show short help
	-H
		Show long help
	-l
		List template scripts
	-a scriptPath
		Add script to templates
	-d scriptName
		Delete script from templates
	-e scriptName
		Edit script from templates
	-g scriptName
		Get script path from templates
EOF
`

while getopts "lhHa:" opt; do
	case $opt in
		h)
			echo "usage: $shortHelp"
			exit 0
			;;
		H)
			echo "$longHelp"
			exit 0
			;;
		a)
			avalue="$OPTARG"
			echo "The value provided is $OPTARG"
			exit 0
			;;
		?)
			echo $shortHelp >&2
			exit 1
			;;
	esac
done

# Remove options so can access params
shift "$(($OPTIND -1))"

echo "$1"