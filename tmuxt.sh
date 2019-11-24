#!/bin/bash

# Error if settings haven't been loaded
if [[ ! -v TMUXT_SETTINGS_LOADED ]]; then
	echo 'tmuxt settings failed to load, try again after installing tmuxt'
    exit 0
fi

while getopts "lha:" opt; do
	case $opt in
		h)
			cat <<-EndHelp
					NAME: 
						tmuxt - tmux template script manager

					SYNOPSIS:
						"$(basename $0) [-hl] [-a scriptPath] [-de script]"

					DESCRIPTION:
						tmuxt is a simple script manager for tmux: it provides options for 
						managing scripts (located in "$")

					OPTIONS:
						-h 
							Show help
						-l
							List template scripts
						-a scriptPath
							Add script to templates
						-d scriptName
							Remove script from templates
						-e scriptName
							Remove script from templates
						-g scriptName
							Get script path in templates
				EndHelp
			return 1
			;;
		a)
			avalue="$OPTARG"
			echo "The value provided is $OPTARG"
			;;
		?)
			echo "script usage $(basename $0) [-l] [-h] [-a somevalue]" >&2
			return 1
			;;
	esac
done

# Remove options so can access params
shift "$(($OPTIND -1))"

echo "$1"