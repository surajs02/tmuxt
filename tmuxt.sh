#!/bin/bash

onelineUsage="$(basename $0) [-hHlr] [-adge template_script_path]"

usage() {
	cat <<-EndUsage
			Usage: "$onelineUsage"
		EndUsage
	exit 1
}

while getopts "lha:" opt; do
	case $opt in
		h)
			usage
			;;
		a)
			avalue="$OPTARG"
			echo "The value provided is $OPTARG"
			;;
		?)
			echo "script usage $(basename $0) [-l] [-h] [-a somevalue]" >&2
			exit 1
			;;
	esac
done

# Remove options so can access params
shift "$(($OPTIND -1))"

echo "$1"
