#!/bin/bash

# Error if settings haven't been loaded
if [[ ! -v TMUXT_SETTINGS_LOADED ]]; then
	echo 'tmuxt settings failed to load, try again after reinstalling tmuxt'
    exit 0
fi

if ! test -f $TMUXT_TEMPLATES_PATH; then
	echo "Cannot find templates folder at [$TMUXT_TEMPLATES_PATH], try again after reinstalling tmuxt"
	exit 1
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

function getScriptPaths() {
	echo `find "$TMUXT_TEMPLATES_PATH" -name "*.sh"`
}

function getScriptNames() {
	for p in `getScriptPaths`; do
		if [ -f "$p" ]; then
			scriptName=`basename $p`
			echo "$scriptName"
		fi
	done
}

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
		l)
			scriptNames=`ls $TMUXT_TEMPLATES_PATH`
			if [[ `echo $scriptNames|wc -w` < 1 ]]; then
				echo 'no templates found'
			else
				echo $scriptNames
			fi
			exit 0
			;;
		a)
			newScriptPath="$OPTARG"

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

# echo "$1"